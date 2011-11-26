using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.IO;
using System.Text;

using IntecoAG.IBS.SyncService.Messages;

namespace IntecoAG.IBS.SyncService {
    public class HTTPSyncService: ISyncService {

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

    }
}
