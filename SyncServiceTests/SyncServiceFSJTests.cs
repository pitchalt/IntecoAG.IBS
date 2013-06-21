using System;

using NUnit.Framework;

using IntecoAG.IBS.SyncService.Messages.FSJ;

namespace IntecoAG.IBS.SyncService {

    [TestFixture]
    public class SyncServiceFSJTests {

        IIBSSyncService SyncService;

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
        public void ParseTest([Range(1, 1, 1)]  int counter) {
            FWSJXMIA msg_in = new FWSJXMIA();
            msg_in.CMD = "TEST-PARSE";
            FWSJXMOA msg_out = SyncService.FWSJXM0N(msg_in);
        }
        const String SJOID1 = "012345678901234567890123456789012345";
        const String SJOID2 = "012345678901234567890123456789012346";
        const String SJOID3 = "012345678911234567890123456789012346";
        [Test]
        public void UpdateTest([Range(1, 1, 1)]  int counter) {
            FWSJXMIA msg_in = new FWSJXMIA();
            msg_in.CMD = "UPDATE";
            msg_in.OPERATION = "Р01";
            msg_in.SJOID = SJOID1;
            //
            msg_in.VOCODE = 1234;
            msg_in.ZKCODE = "260200";
            msg_in.SFNUMBER = "SF1";
            msg_in.SFDATE = new DateTime(2012, 01, 29);
            msg_in.DGDATE = new DateTime(2010, 01, 01);
            msg_in.DGNUMBER = "1234/19-10";
            msg_in.FINUMBER = "FI1";
            msg_in.FIDATE = new DateTime(2012, 01, 30);
            msg_in.PLNUMBER = "234";
            //
            msg_in.SUMMCOST = 100;
            msg_in.AVTRATE = "";
            msg_in.SUMMAVT = 18.01M;
            msg_in.SUMMALL = 118.02M;
            msg_in.VACODE = "USD";
            msg_in.SUMMVALALL = 10;
            //
            msg_in.UOGCODE = 1000;
            msg_in.PERIOD = 201201;
            msg_in.DOCPROV = 31;
            msg_in.DOCNUMBER = 11;
            msg_in.DOCPCK = 2;
            msg_in.DOCDATE = new DateTime(2012, 01, 31);
            msg_in.ACCAVTDEBET = "9031";
            msg_in.ACCAVTCREDIT = "6831";
            msg_in.ACCSALEDEBET = "6213";
            msg_in.ACCSALECREDIT = "9011";
            msg_in.CNTUSER = "domain\\user";
            //
            FWSJXMOA msg_out = SyncService.FWSJXM0N(msg_in);
            msg_in.SUMMAVT = 18.03M;
            msg_in.SUMMALL = 118.04M;
            msg_out = SyncService.FWSJXM0N(msg_in);
            msg_in.SUMMAVT = 19.03M;
            msg_in.SUMMALL = 119.04M;
            msg_in.SJOID = SJOID2;
            msg_out = SyncService.FWSJXM0N(msg_in);
            msg_in.SUMMAVT = 23.03M;
            msg_in.SUMMALL = 123.04M;
            msg_in.SJOID = SJOID3;
            msg_out = SyncService.FWSJXM0N(msg_in);
            //

        }
    }
}
