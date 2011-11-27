using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.IO;
using System.Text;

using IntecoAG.IBS.SyncService.Messages;
using IntecoAG.IBS.SyncService.Messages.XVO;

namespace IntecoAG.IBS.SyncService {

    public class HTTPSyncService: ISyncService  {

        private String base_uri = "http://localhost:8080/nww3d/mod/ws-srv/xml-rpc/";


        protected T2 CallService<T1, T2> (String method, T1 msg_in) 
                where T1: IServiceMessage<T1>
                where T2: IServiceMessage<T2>, new() {
            WebRequest request = WebRequest.Create(base_uri + method);
            request.Method = "POST";
            request.ContentType = "text/xml";
//            byte[] buffer = Encoding.UTF8.GetBytes(prm_in.Serialize());
//            request.ContentLength = buffer.Length;
            Stream PostData = request.GetRequestStream();
            StreamWriter writer = new StreamWriter(PostData,Encoding.UTF8);
            msg_in.Serialize(writer);
//            PostData.Write(buffer, 0, buffer.Length);
            PostData.Close();
            //
            WebResponse response = request.GetResponse();
            Stream RespData = response.GetResponseStream();
            StreamReader reader = new StreamReader(RespData);
//            return XWVOXCOA.Deserialize(reader.ReadToEnd());
//            return ((T1)(T1.Serializer.Deserialize(System.Xml.XmlReader.Create(stringReader))))
            T2 val = new T2().Deserialize(reader);
            RespData.Close();
            return val;
        }

        public XWVOXCOA XWVOXC0N(XWVOXCIA prm_in) {
            WebRequest request = WebRequest.Create("http://localhost:8080/nww3d/mod/ws-srv/xml-rpc/xwvoxc0n");
            request.Method = "POST";
            request.ContentType = "text/xml";
            byte[] buffer = Encoding.UTF8.GetBytes(prm_in.Serialize());
            request.ContentLength = buffer.Length;
            Stream PostData = request.GetRequestStream();
            PostData.Write(buffer, 0, buffer.Length);
            PostData.Close();
            //
            WebResponse response = request.GetResponse();
            Stream RespData = response.GetResponseStream();
            StreamReader reader = new StreamReader(RespData);
            return XWVOXCOA.Deserialize(reader.ReadToEnd());
        }

//        public XWVOXCOA XWVOXC0N(XWVOXCIA prm_in) {
//            return CallService<XWVOXCIA, XWVOXCOA>("xwvoxc0n", prm_in);
//        }

        public  XWVOXLOA XWVOXL0N(XWVOXLIA prm_in) {
            return CallService<XWVOXLIA, XWVOXLOA>("xwvoxl0n", prm_in);
        }

        public XWVOXMOA XWVOXM0N(XWVOXMIA prm_in) {
            return CallService<XWVOXMIA, XWVOXMOA>("xwvoxm0n", prm_in);
        }

    }
}
