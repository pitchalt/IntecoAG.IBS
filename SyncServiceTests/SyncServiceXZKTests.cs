using System;
using System.Diagnostics;

using NUnit.Framework;

using IntecoAG.IBS.SyncService.Messages.XZK;

namespace IntecoAG.IBS.SyncService {

    [TestFixture]
    public class SyncServiceXZKTests {
        decimal ogcode = 10000;

        ISyncService SyncService;

        [TestFixtureSetUp]
        public void Init() {
            SyncService = new HTTPSyncService("http://npomash:8080/nww3d/mod/intecoag.ibs.ws-dev/xml-rpc/");
        }

        protected void ClearTestData() {
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
            XWZKXMOA lres = SyncService.XWZKXM0N(lprm);
        }
        [Test]
        public void CloseTest() {
            XWZKXMIA lprm = new XWZKXMIA();
            lprm.CMD = "CLOSE";
            lprm.OGCODE = ogcode;
            XWZKXMOA lres = SyncService.XWZKXM0N(lprm);
        }
        [Test]
        public void ReOpenTest() {
            XWZKXMIA lprm = new XWZKXMIA();
            lprm.CMD = "REOPEN";
            lprm.OGCODE = ogcode;
            XWZKXMOA lres = SyncService.XWZKXM0N(lprm);
        }
        [Test]
        public void ListTest([Range(1, 1, 1)]  int counter) {
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
//            Assert.AreEqual(count, 20);
        }
    }
}
