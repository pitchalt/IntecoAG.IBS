using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using IntecoAG.IBS.SyncService.Messages;
using IntecoAG.IBS.SyncService.Messages.XDP;
using IntecoAG.IBS.SyncService.Messages.XVO;

namespace IntecoAG.IBS.SyncService {

    public interface ISyncService {
        XWVOXCOA XWVOXC0N(XWVOXCIA prm_in);
        XWVOXLOA XWVOXL0N(XWVOXLIA prm_in);
        XWVOXMOA XWVOXM0N(XWVOXMIA prm_in);
        XWDPXLOA XWDPXL0N(XWDPXLIA prm_in);
    }

}
