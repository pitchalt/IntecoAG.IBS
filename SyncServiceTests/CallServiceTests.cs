using System;
using System.IO;
using System.Net;
using System.Text;

using NUnit.Framework;

namespace IntecoAG.IBS.SyncService {
    [TestFixture]
    public class CallServiceTests {
        const String http_server_name = "http://sagsrv:8080";
        //const String http_server_name = "http://npomash:8080";
        [Test]
        public void EchoTest([Range(1, 10, 1)]  int counter) {
            String testxml = "<?xml version=\"1.0\" encoding=\"windows-1251\"?><TEST><CMD>ECHO</CMD><DATA>ECHO DATA" + counter.ToString() + "</DATA></TEST>";
            WebRequest request = WebRequest.Create(http_server_name + "/nww3d/mod/ws-srv/xml-rpc/wwecho1n");
//            WebRequest request = WebRequest.Create(http_server_name + "/nww3d/mod/intecoag.ibs.ws-dev/xml-rpc/wwecho1n");
            request.Method = "POST";
            request.ContentType = "text/xml";
            Stream PostData = request.GetRequestStream();
            StreamWriter writer = new StreamWriter(PostData, Encoding.GetEncoding("windows-1251"));
            writer.Write(testxml);
            writer.Close();
            PostData.Close();
            //
            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            Stream RespData = response.GetResponseStream();
            StreamReader reader = new StreamReader(RespData, Encoding.GetEncoding(response.CharacterSet));
            Assert.AreEqual(testxml, reader.ReadToEnd());
            reader.Close();
            RespData.Close();
        }
        [Test]
        public void SYSWEB3Test([Range(1, 10, 1)]  int counter) {
            WebRequest request = WebRequest.Create(http_server_name + "/nww3d/mod/sysweb3/nat-env");
            //            WebRequest request = WebRequest.Create("http://sagsrv:8080/nww3d/mod/fail-srv/fail-method");
            //            WebRequest request = WebRequest.Create("http://sagsrv:8080/nww3d/mod/sysweb3/fail-method");
            request.Method = "GET";
            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            Stream RespData = response.GetResponseStream();
            StreamReader reader = new StreamReader(RespData, Encoding.GetEncoding(response.CharacterSet));
            String resp_data = reader.ReadToEnd();
            reader.Close();
            RespData.Close();
        }
        [Test]
        public void HttpTest([Range(1, 10, 1)]  int counter) {
            WebRequest request = WebRequest.Create(http_server_name);
            request.Method = "GET";
            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            Stream RespData = response.GetResponseStream();
            StreamReader reader = new StreamReader(RespData, Encoding.GetEncoding(response.CharacterSet));
            String resp_data = reader.ReadToEnd();
            reader.Close();
            RespData.Close();
        }
    }
}
