using System;
using System.Diagnostics;

using NUnit.Framework;

using IntecoAG.IBS.SyncService.Messages.XZK;

namespace IntecoAG.IBS.SyncService {

    [TestFixture]
    public class SyncServiceXZKTests {
        decimal ogcode = -11111;

        ISyncService SyncService;

        [TestFixtureSetUp]
        public void Init() {
            SyncService = new HTTPSyncService("http://npomash/natcgi/natcgi.exe/");
        }

        protected void ClearTestData() {
            XWZKXCIA lprm = new XWZKXCIA();
            lprm.CMD = "CLEAR-TEST-DATA";
            lprm.OGCODE = ogcode;
            XWZKXCOA lres = SyncService.XWZKXC0N(lprm);
        }

        [SetUp]
        public void SetUp() {
            ClearTestData();
        }
        
        [TearDown]
        public void TearDown() {
            ClearTestData();
        }

        [Test]
        public void SetTest() {
            XWZKXMIA lprm = new XWZKXMIA();
            lprm.CMD = "SET";
            lprm.OGCODE = ogcode;
            lprm.ZKCODE = "TEST1234";
            lprm.ZKSUBJECTCODE = "SUBJ1234";
            XWZKXMOA lres = SyncService.XWZKXM0N(lprm);
            lprm = new XWZKXMIA();
            lprm.CMD = "GET";
            lprm.OGCODE = ogcode;
            lprm.ZKCODE = "TEST1234";
            lres = SyncService.XWZKXM0N(lprm);
            Assert.AreEqual(lres.OGCODE, ogcode);
            Assert.AreEqual(lres.ZKCODE, "TEST1234");
            Assert.AreEqual(lres.ZKISCLOSED, false);
            Assert.AreEqual(lres.ZKSUBJECTCODE, "SUBJ1234");
            lprm.CMD = "SET";
            lprm.OGCODE = ogcode;
            lprm.ZKCODE = "TEST1234";
            lprm.ZKSUBJECTCODE = "SUBJ12345";
            lres = SyncService.XWZKXM0N(lprm);
            Assert.AreEqual(lres.ZKSUBJECTCODE, "SUBJ12345");
        }
        [Test]
        public void CloseTest() {
            XWZKXMIA lprm = new XWZKXMIA();
            lprm.CMD = "SET";
            lprm.OGCODE = ogcode;
            lprm.ZKCODE = "TEST1234";
            lprm.ZKSUBJECTCODE = "SUBJ1234";
            XWZKXMOA lres = SyncService.XWZKXM0N(lprm);
            Assert.AreEqual(lres.ZKISCLOSED, false);
            lprm = new XWZKXMIA();
            lprm.CMD = "CLOSE";
            lprm.OGCODE = ogcode;
            lprm.ZKCODE = "TEST1234";
            lres = SyncService.XWZKXM0N(lprm);
            Assert.AreEqual(lres.ZKISCLOSED, true);
        }
        [Test]
        public void ReOpenTest() {
            XWZKXMIA lprm = new XWZKXMIA();
            lprm.CMD = "SET";
            lprm.OGCODE = ogcode;
            lprm.ZKCODE = "TEST1234";
            lprm.ZKSUBJECTCODE = "SUBJ1234";
            XWZKXMOA lres = SyncService.XWZKXM0N(lprm);
            Assert.AreEqual(lres.ZKISCLOSED, false);
            lprm = new XWZKXMIA();
            lprm.CMD = "CLOSE";
            lprm.OGCODE = ogcode;
            lprm.ZKCODE = "TEST1234";
            lres = SyncService.XWZKXM0N(lprm);
            Assert.AreEqual(lres.ZKISCLOSED, true);
            lprm.CMD = "REOPEN";
            lprm.OGCODE = ogcode;
            lres = SyncService.XWZKXM0N(lprm);
            Assert.AreEqual(lres.ZKISCLOSED, false);
        }
        [Test]
        public void ListTest([Range(1, 1, 1)]  int counter) {
            XWZKXMIA lset = new XWZKXMIA();
            XWZKXMOA rset;
            for (int i = 0; i < 10; i++) {
                lset.CMD = "SET";
                lset.OGCODE = ogcode;
                lset.ZKCODE = "TEST-" + i.ToString();
                lset.ZKSUBJECTCODE = "SUBJ-" + i.ToString();
                rset = SyncService.XWZKXM0N(lset);
            }
            //
            XWZKXCIA lprm = new XWZKXCIA();
            lprm.CMD = "CATALOG";
            lprm.OGCODE = ogcode;
            XWZKXCOA lres = SyncService.XWZKXC0N(lprm);
//            Assert.AreEqual(lres.VOLIST.Count, 20);
            int count = 0;
            foreach (XWZKXCOAZKLIST  item in lres.ZKLIST) {
                count++;
                Debug.WriteLine(count.ToString() + " - " + item.ZKSUBJECTCODE + " - " +  item.ZKCODE);
            }
            Assert.AreEqual(count, 10);
        }
    }
}
