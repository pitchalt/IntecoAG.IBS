using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using NUnit.Framework;

using IntecoAG.IBS.SyncService;
using IntecoAG.IBS.SyncService.Messages;

namespace SyncServiceTests {

    [TestFixture]
    public class SyncServiceTests {

        ISyncService SyncService;

        [TestFixtureSetUp]
        public void Init() { 
            SyncService = new HTTPSyncService();
        }

        [Test]
        public void TestSimpleCall() {
            XWVOXCIA prm = new XWVOXCIA();
            XWVOXCOA res = SyncService.XWVOXC0N(prm);
            Assert.AreEqual(res.VOLIST.Count, 10);
            foreach (VOLIST vo in res.VOLIST)
                System.Console.WriteLine(vo.VOCODE + " - " + vo.VOUPTIME);
        }
    }
}
