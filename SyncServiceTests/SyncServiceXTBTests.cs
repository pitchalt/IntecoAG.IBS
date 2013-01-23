using System;

using NUnit.Framework;

using IntecoAG.IBS.SyncService.Messages.XTB;

namespace IntecoAG.IBS.SyncService {

    [TestFixture]
    public class SyncServiceXTBTests {

        ISyncService SyncService;

        [TestFixtureSetUp]
        public void Init() {
            SyncService = new HTTPSyncService("http://npomash:8080/nww3d/mod/intecoag.ibs.ws-dev/xml-rpc/");
//            SyncService = new HTTPSyncService("http://sagsrv:8080/nww3d/mod/ws-srv/xml-rpc/");
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
        public void CatalogTest([Range(1, 1, 1)]  int counter) {
            int count = 0;
            XWTBXCIA lprm = new XWTBXCIA();
            XWTBXLIA msg_in = new XWTBXLIA();
            lprm.CMD = "CATALOG";
            XWTBXCOA lres = SyncService.XWTBXC0N(lprm);
            //Assert.AreEqual(lres.VOLIST.Count, 20);
            foreach (var item in lres.TBLIST) {
//                System.Console.WriteLine(item.TBCODE + " " + item.TBBUHCODE + " " + item.TBDPCODE);
                count++;
                msg_in.TBBUHCODE.Add(item.TBBUHCODE);
                if (count >= 100) {
                    ListTest(msg_in);
                    count = 0;
                    msg_in = new XWTBXLIA();
                }
            }
            ListTest(msg_in);
            System.Console.WriteLine("Test catalog read: " + lres.TBLIST.Count);
            //Assert.AreEqual(count, 20);
        }
        [Test]
        public void RPCCatalogTest([Range(1, 1, 1)]  int counter) {
            XWTBXCIA lprm = new XWTBXCIA();
            XWTBXLIA msg_in = new XWTBXLIA();
            lprm.CMD = "TEST-RPC";
//            lprm.DPGROUPCODE = 2;
//            lprm.UPDTSTART = new DateTime(2011, 01, 01);
//            lprm.UPDTSTOP = new DateTime(2011, 03, 31);
            XWTBXCOA lres = SyncService.XWTBXC0N(lprm);
            Assert.AreEqual(lres.RETURNCODE, 0);
            Assert.AreEqual(lres.TBLIST.Count, 1);
        }

        [Test]
        public void ChangesListTest([Range(1, 1, 1)]  int counter) {
            int count = 0;
            XWTBXCIA lprm = new XWTBXCIA();
            XWTBXLIA msg_in = new XWTBXLIA();
            lprm.CMD = "CHANGES";
            lprm.DPGROUPCODE = 2;
            lprm.UPDTSTART = new DateTime(2011, 01, 01);
            lprm.UPDTSTOP = new DateTime(2011, 01, 31);
            XWTBXCOA lres = SyncService.XWTBXC0N(lprm);
            //Assert.AreEqual(lres.VOLIST.Count, 20);
            foreach (var item in lres.TBLIST) {
                //                System.Console.WriteLine(item.TBCODE + " " + item.TBBUHCODE + " " + item.TBDPCODE);
                count++;
                msg_in.TBBUHCODE.Add(item.TBBUHCODE);
                if (count >= 100) {
                    ListTest(msg_in);
                    count = 0;
                    msg_in = new XWTBXLIA();
                }
            }
            ListTest(msg_in);
            System.Console.WriteLine("Test catalog read: " + lres.TBLIST.Count);
            //Assert.AreEqual(count, 20);
        }
        public void ListTest(XWTBXLIA msg_in) {
            System.Console.WriteLine("------------------");
            msg_in.CMD = "LIST";
            XWTBXLOA lres = SyncService.XWTBXL0N(msg_in);
            foreach (var item in lres.TBLIST) {
                System.Console.WriteLine(item.TBCODE + "/" + item.TBDPCODE + "/" + item.TBDLCODE + " " + item.TBSEX + " " + item.TBLASTNAME + " " + item.TBFIRSTNAME + " " + item.TBMIDDLENAME + " ");
            }
        }
    }
}
