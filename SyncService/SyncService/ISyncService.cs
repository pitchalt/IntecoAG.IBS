using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using IntecoAG.IBS.SyncService.Messages;
using IntecoAG.IBS.SyncService.Messages.FSJ;
using IntecoAG.IBS.SyncService.Messages.XDP;
using IntecoAG.IBS.SyncService.Messages.XTB;
using IntecoAG.IBS.SyncService.Messages.XVO;
using IntecoAG.IBS.SyncService.Messages.XZK;

namespace IntecoAG.IBS.SyncService {

    public class IBSServiceInternalException: Exception {
        public IBSServiceInternalException(Int32 number, String module, Int32 line): base() {
            ErrorModule = module;
            ErrorLine = line;
            ErrorNumber = number;
        }
        public Int32 ErrorNumber;
        public String ErrorModule;
        public Int32 ErrorLine;

        public override string Message {
            get {
                return String.Format("IBS service internal error: {0}, module {1}, line {2}", ErrorNumber, ErrorModule, ErrorLine);
            }
        }
    }

    public interface IIBSSyncService {
        XWVOXCOA XWVOXC0N(XWVOXCIA prm_in);
        XWVOXLOA XWVOXL0N(XWVOXLIA prm_in);
        XWVOXMOA XWVOXM0N(XWVOXMIA prm_in);
        XWDPXLOA XWDPXL0N(XWDPXLIA prm_in);
        XWTBXCOA XWTBXC0N(XWTBXCIA prm_in);
        XWTBXLOA XWTBXL0N(XWTBXLIA prm_in);
        XWZKXCOA XWZKXC0N(XWZKXCIA prm_in);
        XWZKXMOA XWZKXM0N(XWZKXMIA prm_in);
        FWSJXMOA FWSJXM0N(FWSJXMIA prm_in);
    }

}
