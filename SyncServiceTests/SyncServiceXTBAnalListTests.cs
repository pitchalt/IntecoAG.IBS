using System;

using NUnit.Framework;

using IntecoAG.IBS.SyncService.Messages.XTB;

namespace IntecoAG.IBS.SyncService {

    [TestFixture]
    public class SyncServiceXTBAnalListTests {

        IIBSSyncService SyncService;

        [TestFixtureSetUp]
        public void Init() {
            SyncService = new HTTPSyncService("http://sagsrv:8080/natcgi/natcgi.exe/");
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
        public void TestAnal_DL() {
            XWTBALIA msg_in = new XWTBALIA();
            msg_in.CMD = "LIST";
            msg_in.TBANALTYPECODE = "DL";
            XWTBALOA msg_out = SyncService.XWTBAL0N(msg_in); 
            Assert.AreEqual(msg_in.TBANALTYPECODE, msg_out.TBANALTYPECODE);
            foreach (XWTBALOATBANALLIST anal in msg_out.TBANALLIST ) {
                System.Console.WriteLine(anal.TBCODE + " - " + anal.TBNAME);
            }
            System.Console.WriteLine("Всего записей: " + msg_out.TBANALLIST.Count);
        }
        [Test]
        public void TestAnal_VN() {
            XWTBALIA msg_in = new XWTBALIA();
            msg_in.CMD = "LIST";
            msg_in.TBANALTYPECODE = "VN";
            XWTBALOA msg_out = SyncService.XWTBAL0N(msg_in);
            Assert.AreEqual(msg_in.TBANALTYPECODE, msg_out.TBANALTYPECODE);
            foreach (XWTBALOATBANALLIST anal in msg_out.TBANALLIST) {
                System.Console.WriteLine(anal.TBCODE + " - " + anal.TBNAME);
            }
            System.Console.WriteLine("Всего записей: " + msg_out.TBANALLIST.Count);
        }
        [Test]
        public void TestAnal_CT() {
            XWTBALIA msg_in = new XWTBALIA();
            msg_in.CMD = "LIST";
            msg_in.TBANALTYPECODE = "CT";
            XWTBALOA msg_out = SyncService.XWTBAL0N(msg_in);
            Assert.AreEqual(msg_in.TBANALTYPECODE, msg_out.TBANALTYPECODE);
            foreach (XWTBALOATBANALLIST anal in msg_out.TBANALLIST) {
                System.Console.WriteLine(anal.TBCODE + " - " + anal.TBNAME);
            }
            System.Console.WriteLine("Всего записей: " + msg_out.TBANALLIST.Count);
        }
        [Test]
        public void TestAnal_NT() {
            XWTBALIA msg_in = new XWTBALIA();
            msg_in.CMD = "LIST";
            msg_in.TBANALTYPECODE = "NT";
            XWTBALOA msg_out = SyncService.XWTBAL0N(msg_in);
            Assert.AreEqual(msg_in.TBANALTYPECODE, msg_out.TBANALTYPECODE);
            foreach (XWTBALOATBANALLIST anal in msg_out.TBANALLIST) {
                System.Console.WriteLine(anal.TBCODE + " - " + anal.TBNAME);
            }
            System.Console.WriteLine("Всего записей: " + msg_out.TBANALLIST.Count);
        }
        [Test]
        public void TestAnal_LN() {
            XWTBALIA msg_in = new XWTBALIA();
            msg_in.CMD = "LIST";
            msg_in.TBANALTYPECODE = "LN";
            XWTBALOA msg_out = SyncService.XWTBAL0N(msg_in);
            Assert.AreEqual(msg_in.TBANALTYPECODE, msg_out.TBANALTYPECODE);
            foreach (XWTBALOATBANALLIST anal in msg_out.TBANALLIST) {
                System.Console.WriteLine(anal.TBCODE + " - " + anal.TBNAME);
            }
            System.Console.WriteLine("Всего записей: " + msg_out.TBANALLIST.Count);
        }
    }
}
