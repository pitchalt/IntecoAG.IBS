using System;

using NUnit.Framework;

using IntecoAG.IBS.SyncService.Messages.XDP;

namespace IntecoAG.IBS.SyncService {

    [TestFixture]
    public class SyncServiceXDPTests {

        ISyncService SyncService;

        [TestFixtureSetUp]
        public void Init() {
            SyncService = new HTTPSyncService("http://npomash:8080/nww3d/mod/intecoag.ibs.ws-dev/xml-rpc/");
        }

        protected void ClearTestData() {
//            XWVOXLIA prm = new XWVOXLIA();
//            prm.CMD = "CLEAR-TEST-DATA";
//            prm.OGCODE = ogcode;
//            XWVOXLOA res = SyncService.XWVOXL0N(prm);
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
        public void ListTest([Range(1, 1, 1)]  int counter) {
            XWDPXLIA lprm = new XWDPXLIA();
            lprm.CMD = "LIST";
            XWDPXLOA lres = SyncService.XWDPXL0N(lprm);
            //Assert.AreEqual(lres.VOLIST.Count, 20);
            foreach (XWDPXLOADPLIST item in lres.DPLIST) {
                System.Console.WriteLine(item.DPCODE + " " + item.DPBUHCODE + " " + item.DPNAME);
            }
            //Assert.AreEqual(count, 20);
        }
    }
}
