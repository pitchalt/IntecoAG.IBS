using System;
using System.Diagnostics;
using System.Reflection;
using System.Threading;
using System.Collections.Generic;
using System.Globalization;

using NUnit.Framework;

namespace IntecoAG.IBS.SyncService {

    public class ParallelizedTestFixture {
        private readonly IDictionary<string, TestRunner> threads = new Dictionary<string, TestRunner>();
        private readonly IDictionary<string, Action> actions = new Dictionary<string, Action>();

        protected bool RunFromConsole { get; set; }

        protected void Parallelize() {
            string executable = Environment.GetCommandLineArgs()[0];
            RunFromConsole = executable.ToLower().Contains("nunit-console");

            foreach (MethodInfo methodInfo in GetType().GetMethods(BindingFlags.Public | BindingFlags.Instance)) {
                if (methodInfo.GetCustomAttributes(typeof(TestAttribute), false).Length == 1 &&
                    methodInfo.GetCustomAttributes(typeof(IgnoreAttribute), false).Length == 0) {
                    string key = GetKey(methodInfo);
                    MethodInfo actionMethod = GetType().GetMethod(key + "Action",
                                                                    BindingFlags.NonPublic | BindingFlags.Public | BindingFlags.Instance);
                    if (actionMethod != null) {
                        actions.Add(key, () => actionMethod.Invoke(this, new object[] { }));
                    }
                }
            }

            if (RunFromConsole) {
                foreach (KeyValuePair<string, Action> actionPair in actions) {
                    TestRunner testRunner = new TestRunner(actionPair.Value);
                    ThreadStart ts = testRunner.DoWork;
                    Thread thread = new Thread(ts);
                    testRunner.Thread = thread;
                    thread.Start();
                    threads.Add(actionPair.Key, testRunner);
                }
            }
        }

        protected void RunTest() {
            string key = GetKey(new StackFrame(1, false).GetMethod());
            if (RunFromConsole) {
                TestRunner testRunner = threads[key];
                testRunner.Thread.Join();
                Assert.IsNull(testRunner.Error, string.Format(CultureInfo.InvariantCulture, "Unexpected exception {0}", testRunner.Error));
            }
            else {
                actions[key]();
            }
        }

        private static string GetKey(MethodBase method) {
            return method.Name.Substring("Test".Length);
        }

        private class TestRunner {
            private readonly Action action;

            public TestRunner(Action action) {
                this.action = action;
            }

            public Thread Thread { get; set; }
            public Exception Error { get; private set; }

            public void DoWork() {
                try {
                    action();
                } catch (Exception e) {
                    Error = e;
                }
            }
        }
    }

    [TestFixture]
    public class SomeTextFixture : ParallelizedTestFixture {
        [TestFixtureSetUp]
        public void FixtureSetup() {
            Parallelize();
        }

        public void Scenario1Action() {
            // Do actual testing.
        }

        [Test]
        public void TestScenario1() {
            RunTest();
        }

        public void Scenario2Action() {
        }

        [Test]
        public void TestScenario2() {
            RunTest();
        }
    }
}
