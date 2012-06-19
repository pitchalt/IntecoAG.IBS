using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.IO;
using System.Text;

using IntecoAG.IBS.SyncService.Messages;
using IntecoAG.IBS.SyncService.Messages.FSJ;
using IntecoAG.IBS.SyncService.Messages.XVO;
using IntecoAG.IBS.SyncService.Messages.XZK;
using IntecoAG.IBS.SyncService.Messages.XDP;
using IntecoAG.IBS.SyncService.Messages.XTB;

namespace IntecoAG.IBS.SyncService {

    public class HTTPSyncService : ISyncService {
        public class CallResultFailException : Exception {
            public CallResultFailException(String msg, String context)
                : base(msg) {
                Context = context;
            }
            public String Context;
        }

        private String base_uri = "http://localhost:8080/nww3d/mod/ws-srv/xml-rpc/";


        public HTTPSyncService(String uri) {
            base_uri = uri;
        }

        protected T2 CallService<T1, T2>(String method, T1 msg_in)
            where T1 : IServiceMessage<T1>, new()
            where T2 : IServiceMessage<T2>, new() {
            String resp_err = null;
            Boolean IsError = false;
            T2 resp_val = default(T2);
            try {
                WebRequest request = WebRequest.Create(base_uri + method);
                request.Method = "POST";
                request.ContentType = "text/xml";
                //            byte[] buffer = Encoding.UTF8.GetBytes(prm_in.Serialize());
                //            request.ContentLength = buffer.Length;
                using (Stream PostData = request.GetRequestStream()) {
                    using (StreamWriter writer = new StreamWriter(PostData, Encoding.UTF8)) {
                        msg_in.Serialize(writer);
                        //            PostData.Write(buffer, 0, buffer.Length);
                        writer.Close();

                    }
                    PostData.Close();
                }
                //
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                using (Stream RespData = response.GetResponseStream()) {
                    using (StreamReader reader = new StreamReader(RespData, Encoding.GetEncoding(response.CharacterSet))) {
                        //            return XWVOXCOA.Deserialize(reader.ReadToEnd());
                        //            return ((T1)(T1.Serializer.Deserialize(System.Xml.XmlReader.Create(stringReader))))\
                        // Паша!!! Подозрительный способ, но читать стандарт HTTP лень
                        if (response.ContentType.Substring(0,8) == "text/xml") {
                            resp_val = new T2().Deserialize(reader);
                        }
                        else {
                            resp_err = reader.ReadToEnd();
                            IsError = true;
                        }
                        reader.Close();
                    }
                    RespData.Close();
                }
                if (!IsError)
                    return resp_val;
            }
            catch (Exception e) {
                throw new Exception("Call fail", e);
            }
            throw new CallResultFailException("Call fail result", resp_err);

        }

        public XWVOXCOA XWVOXC0N(XWVOXCIA prm_in) {
            return CallService<XWVOXCIA, XWVOXCOA>("xwvoxc0n", prm_in);
        }

        public XWVOXLOA XWVOXL0N(XWVOXLIA prm_in) {
            return CallService<XWVOXLIA, XWVOXLOA>("xwvoxl0n", prm_in);
        }

        public XWVOXMOA XWVOXM0N(XWVOXMIA prm_in) {
            return CallService<XWVOXMIA, XWVOXMOA>("xwvoxm0n", prm_in);
        }

        public XWDPXLOA XWDPXL0N(XWDPXLIA prm_in) {
            return CallService<XWDPXLIA, XWDPXLOA>("xwdpxl0n", prm_in);
        }

        public XWTBXCOA XWTBXC0N(XWTBXCIA prm_in) {
            return CallService<XWTBXCIA, XWTBXCOA>("xwtbxc0n", prm_in);
        }

        public XWTBXLOA XWTBXL0N(XWTBXLIA prm_in) {
            return CallService<XWTBXLIA, XWTBXLOA>("xwtbxl0n", prm_in);
        }

        public FWSJXMOA FWSJXM0N(FWSJXMIA prm_in) {
            return CallService<FWSJXMIA, FWSJXMOA>("fwsjxm0n", prm_in);
        }

        public XWZKXCOA XWZKXC0N(XWZKXCIA prm_in) {
            return CallService<XWZKXCIA, XWZKXCOA>("xwzkxc0n", prm_in);
        }

        public XWZKXMOA XWZKXM0N(XWZKXMIA prm_in) {
            return CallService<XWZKXMIA, XWZKXMOA>("xwzkxm0n", prm_in);
        }
    }
}
