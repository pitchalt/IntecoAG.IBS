using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Text;

namespace IntecoAG.IBS.SyncService.Messages {
    public interface IServiceMessage<T> {
        void Serialize(StreamWriter stream_write);
        T Deserialize(StreamReader stream_read);
    }
}
