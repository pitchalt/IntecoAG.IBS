using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Text;
using System.Xml;
using System.Xml.Serialization;

namespace IntecoAG.IBS.SyncService.Messages {
    public abstract class ServiceMessage<T> : IServiceMessage<T> {

        private static System.Xml.Serialization.XmlSerializer serializer;

        void IServiceMessage<T>.Serialize(StreamWriter stream) {
            XmlSerializer.Serialize(stream, this);
//            throw new NotImplementedException();
        }

        T IServiceMessage<T>.Deserialize(StreamReader stream) {
            return ((T)(XmlSerializer.Deserialize(System.Xml.XmlReader.Create(stream))));
//            throw new NotImplementedException();
        }

        protected static System.Xml.Serialization.XmlSerializer XmlSerializer {
            get {
                if ((serializer == null)) {
                    serializer = new System.Xml.Serialization.XmlSerializer(typeof(T));
                }
                return serializer;
            }
        }

    }
}
