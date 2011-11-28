using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using NUnit.Framework;

using IntecoAG.IBS.SyncService;
using IntecoAG.IBS.SyncService.Messages;
using IntecoAG.IBS.SyncService.Messages.XVO;

namespace IntecoAG.IBS.SyncService {

    [TestFixture]
    public class SyncServiceTests {
        decimal ogcode = 10000;

        ISyncService SyncService;

        [TestFixtureSetUp]
        public void Init() {
            SyncService = new HTTPSyncService("http://localhost:8080/nww3d/mod/ws-srv/xml-rpc/");
        }

        protected void ClearTestData() {
            XWVOXLIA prm = new XWVOXLIA();
            prm.CMD = "CLEAR-TEST-DATA";
            prm.OGCODE = ogcode;
            XWVOXLOA res = SyncService.XWVOXL0N(prm);
        }

        [SetUp]
        public void SetUp() {
            ClearTestData();
        }
        
        [TearDown]
        public void TearDown() {
            ClearTestData();
        }

        protected XWVOXMIA NewPrmFill(String cmd, String suffix) {
            XWVOXMIA prm = new XWVOXMIA();
            prm.CMD = cmd;
            prm.OGCODE = ogcode;
            prm.VONAME = "Имя" + suffix;
            prm.VONAMEFULL = "ИмяПолное" + suffix;
            prm.VOADDR = "Адрес" + suffix;
            prm.VOINN = "ИНН" + suffix;
            prm.VOKPP = "КПП" + suffix;
            return prm;
        }

        [Test]
        public void InsertTest() {
            decimal vocode1;
            decimal vocode2;
            XWVOXMIA prm;
            XWVOXMOA res;
            //
            prm = NewPrmFill("INSERT", "1");
            res = SyncService.XWVOXM0N(prm);
            vocode1 = res.VOCODE;
            //
            prm = NewPrmFill("INSERT", "2");
            res = SyncService.XWVOXM0N(prm);
            vocode2 = res.VOCODE;
            //
            prm = new XWVOXMIA();
            prm.OGCODE = ogcode;
            prm.VOCODE = vocode1;
            prm.CMD = "GET";
            res = SyncService.XWVOXM0N(prm);
            Assert.AreEqual(res.VONAME, "Имя1");
            Assert.AreEqual(res.VONAMEFULL, "ИмяПолное1");
            Assert.AreEqual(res.VOADDR, "Адрес1");
            Assert.AreEqual(res.VOINN, "ИНН1");
            Assert.AreEqual(res.VOKPP, "КПП1");
            //
            prm = new XWVOXMIA();
            prm.OGCODE = ogcode;
            prm.VOCODE = vocode2;
            prm.CMD = "GET";
            res = SyncService.XWVOXM0N(prm);
            Assert.AreEqual(res.VONAME, "Имя2");
            Assert.AreEqual(res.VONAMEFULL, "ИмяПолное2");
            Assert.AreEqual(res.VOADDR, "Адрес2");
            Assert.AreEqual(res.VOINN, "ИНН2");
            Assert.AreEqual(res.VOKPP, "КПП2");
            //
        }
        [Test]
        public void UpdateTest() {
            decimal vocode1;
            decimal vocode2;
            XWVOXMIA prm;
            XWVOXMOA res;
            //
            prm = NewPrmFill("INSERT", "1");
            res = SyncService.XWVOXM0N(prm);
            vocode1 = res.VOCODE;
            //
            prm = NewPrmFill("INSERT", "2");
            res = SyncService.XWVOXM0N(prm);
            vocode2 = res.VOCODE;
            //
            prm = NewPrmFill("UPDATE", "11");
            prm.VOCODE = vocode1;
            res = SyncService.XWVOXM0N(prm);
            //
            prm = NewPrmFill("UPDATE", "22");
            prm.VOCODE = vocode2;
            res = SyncService.XWVOXM0N(prm);
            //
            prm = new XWVOXMIA();
            prm.OGCODE = ogcode;
            prm.VOCODE = vocode1;
            prm.CMD = "GET";
            res = SyncService.XWVOXM0N(prm);
            Assert.AreEqual(res.VONAME, "Имя11");
            Assert.AreEqual(res.VONAMEFULL, "ИмяПолное11");
            Assert.AreEqual(res.VOADDR, "Адрес11");
            Assert.AreEqual(res.VOINN, "ИНН11");
            Assert.AreEqual(res.VOKPP, "КПП11");
            //
            prm = new XWVOXMIA();
            prm.OGCODE = ogcode;
            prm.VOCODE = vocode2;
            prm.CMD = "GET";
            res = SyncService.XWVOXM0N(prm);
            Assert.AreEqual(res.VONAME, "Имя22");
            Assert.AreEqual(res.VONAMEFULL, "ИмяПолное22");
            Assert.AreEqual(res.VOADDR, "Адрес22");
            Assert.AreEqual(res.VOINN, "ИНН22");
            Assert.AreEqual(res.VOKPP, "КПП22");
            //
        }
        [Test]
        public void ListTest() {
            decimal [] vocode = new decimal[20];
            XWVOXMIA iprm;
            XWVOXMOA ires;
            for (int i = 0; i < 20; i++) {
                iprm = NewPrmFill("INSERT", i.ToString());
                ires = SyncService.XWVOXM0N(iprm);
                vocode[i] = ires.VOCODE;
            }
            XWVOXLIA lprm = new XWVOXLIA();
            lprm.CMD = "LIST";
            lprm.OGCODE = ogcode;
            XWVOXLOA lres = SyncService.XWVOXL0N(lprm);
            Assert.AreEqual(lres.VOLIST.Count, 20);
            int count = 0;
            foreach (XWVOXLOAVOLIST item in lres.VOLIST) {
                for (int i = 0; i < 20; i++) {
                    if (vocode[i] == item.VOCODE) {
//                        System.Console.WriteLine(i + " " + item.VOCODE + " " + item.VONAME);
                        Assert.AreEqual(item.VONAME, "Имя" + i.ToString());
                        Assert.AreEqual(item.VONAMEFULL, "ИмяПолное" + i.ToString());
                        Assert.AreEqual(item.VOADDR, "Адрес" + i.ToString());
                        Assert.AreEqual(item.VOINN, "ИНН" + i.ToString());
                        Assert.AreEqual(item.VOKPP, "КПП" + i.ToString());
                        count++;
                    }
                }
            }
            Assert.AreEqual(count, 20);
        }
    }
}
