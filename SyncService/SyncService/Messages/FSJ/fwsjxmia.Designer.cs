// ------------------------------------------------------------------------------
//  <auto-generated>
//    Generated by Xsd2Code. Version 3.4.0.38967
//    <NameSpace>IntecoAG.IBS.SyncService.Messages.FSJ</NameSpace><Collection>List</Collection><codeType>CSharp</codeType><EnableDataBinding>False</EnableDataBinding><EnableLazyLoading>False</EnableLazyLoading><TrackingChangesEnable>False</TrackingChangesEnable><GenTrackingClasses>False</GenTrackingClasses><HidePrivateFieldInIDE>False</HidePrivateFieldInIDE><EnableSummaryComment>False</EnableSummaryComment><VirtualProp>False</VirtualProp><IncludeSerializeMethod>True</IncludeSerializeMethod><UseBaseClass>True</UseBaseClass><GenBaseClass>False</GenBaseClass><GenerateCloneMethod>False</GenerateCloneMethod><GenerateDataContracts>False</GenerateDataContracts><CodeBaseTag>Net35</CodeBaseTag><SerializeMethodName>Serialize</SerializeMethodName><DeserializeMethodName>Deserialize</DeserializeMethodName><SaveToFileMethodName>SaveToFile</SaveToFileMethodName><LoadFromFileMethodName>LoadFromFile</LoadFromFileMethodName><GenerateXMLAttributes>True</GenerateXMLAttributes><EnableEncoding>False</EnableEncoding><AutomaticProperties>False</AutomaticProperties><GenerateShouldSerialize>False</GenerateShouldSerialize><DisableDebug>False</DisableDebug><PropNameSpecified>Default</PropNameSpecified><Encoder>UTF8</Encoder><CustomUsings></CustomUsings><ExcludeIncludedTypes>False</ExcludeIncludedTypes><EnableInitializeFields>True</EnableInitializeFields>
//  </auto-generated>
// ------------------------------------------------------------------------------
namespace IntecoAG.IBS.SyncService.Messages.FSJ {
    using System;
    using System.Diagnostics;
    using System.Xml.Serialization;
    using System.Collections;
    using System.Xml.Schema;
    using System.ComponentModel;
    using System.IO;
    using System.Text;
    using System.Collections.Generic;


    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Xml", "4.0.30319.1")]
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    [System.Xml.Serialization.XmlRootAttribute(Namespace = "", IsNullable = false)]
    public partial class FWSJXMIA : ServiceMessage<FWSJXMIA> {

        private string cMDField;

        private string sJOIDField;

        private string oPERATIONField;

        private decimal vOCODEField;

        private string sFNUMBERField;

        private System.DateTime sFDATEField;

        private string fINUMBERField;

        private System.DateTime fIDATEField;

        private string dGNUMBERField;

        private System.DateTime dGDATEField;

        private string zKCODEField;

        private decimal sUMMCOSTField;

        private string aVTRATEField;

        private decimal sUMMAVTField;

        private decimal sUMMALLField;

        private string vACODEField;

        private decimal sUMMVALALLField;

        private string pLNUMBERField;

        private string aCCSALEDEBETField;

        private string aCCSALECREDITField;

        private string aCCAVTDEBETField;

        private string aCCAVTCREDITField;

        private decimal pERIODField;

        private decimal uOGCODEField;

        private decimal dOCPROVField;

        private decimal dOCPCKField;

        private decimal dOCNUMBERField;

        private System.DateTime dOCDATEField;

        private string cNTUSERField;

        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 0)]
        public string CMD {
            get {
                return this.cMDField;
            }
            set {
                this.cMDField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("SJ-OID", Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 1)]
        public string SJOID {
            get {
                return this.sJOIDField;
            }
            set {
                this.sJOIDField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 2)]
        public string OPERATION {
            get {
                return this.oPERATIONField;
            }
            set {
                this.oPERATIONField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("VO-CODE", Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 3)]
        public decimal VOCODE {
            get {
                return this.vOCODEField;
            }
            set {
                this.vOCODEField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("SF-NUMBER", Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 4)]
        public string SFNUMBER {
            get {
                return this.sFNUMBERField;
            }
            set {
                this.sFNUMBERField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("SF-DATE", Form = System.Xml.Schema.XmlSchemaForm.Unqualified, DataType = "date", Order = 5)]
        public System.DateTime SFDATE {
            get {
                return this.sFDATEField;
            }
            set {
                this.sFDATEField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("FI-NUMBER", Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 6)]
        public string FINUMBER {
            get {
                return this.fINUMBERField;
            }
            set {
                this.fINUMBERField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("FI-DATE", Form = System.Xml.Schema.XmlSchemaForm.Unqualified, DataType = "date", Order = 7)]
        public System.DateTime FIDATE {
            get {
                return this.fIDATEField;
            }
            set {
                this.fIDATEField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("DG-NUMBER", Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 8)]
        public string DGNUMBER {
            get {
                return this.dGNUMBERField;
            }
            set {
                this.dGNUMBERField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("DG-DATE", Form = System.Xml.Schema.XmlSchemaForm.Unqualified, DataType = "date", Order = 9)]
        public System.DateTime DGDATE {
            get {
                return this.dGDATEField;
            }
            set {
                this.dGDATEField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("ZK-CODE", Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 10)]
        public string ZKCODE {
            get {
                return this.zKCODEField;
            }
            set {
                this.zKCODEField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("SUMM-COST", Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 11)]
        public decimal SUMMCOST {
            get {
                return this.sUMMCOSTField;
            }
            set {
                this.sUMMCOSTField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("AVT-RATE", Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 12)]
        public string AVTRATE {
            get {
                return this.aVTRATEField;
            }
            set {
                this.aVTRATEField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("SUMM-AVT", Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 13)]
        public decimal SUMMAVT {
            get {
                return this.sUMMAVTField;
            }
            set {
                this.sUMMAVTField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("SUMM-ALL", Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 14)]
        public decimal SUMMALL {
            get {
                return this.sUMMALLField;
            }
            set {
                this.sUMMALLField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("VA-CODE", Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 15)]
        public string VACODE {
            get {
                return this.vACODEField;
            }
            set {
                this.vACODEField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("SUMM-VAL-ALL", Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 16)]
        public decimal SUMMVALALL {
            get {
                return this.sUMMVALALLField;
            }
            set {
                this.sUMMVALALLField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("PL-NUMBER", Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 17)]
        public string PLNUMBER {
            get {
                return this.pLNUMBERField;
            }
            set {
                this.pLNUMBERField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("ACC-SALE-DEBET", Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 18)]
        public string ACCSALEDEBET {
            get {
                return this.aCCSALEDEBETField;
            }
            set {
                this.aCCSALEDEBETField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("ACC-SALE-CREDIT", Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 19)]
        public string ACCSALECREDIT {
            get {
                return this.aCCSALECREDITField;
            }
            set {
                this.aCCSALECREDITField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("ACC-AVT-DEBET", Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 20)]
        public string ACCAVTDEBET {
            get {
                return this.aCCAVTDEBETField;
            }
            set {
                this.aCCAVTDEBETField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("ACC-AVT-CREDIT", Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 21)]
        public string ACCAVTCREDIT {
            get {
                return this.aCCAVTCREDITField;
            }
            set {
                this.aCCAVTCREDITField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 22)]
        public decimal PERIOD {
            get {
                return this.pERIODField;
            }
            set {
                this.pERIODField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("UOG-CODE", Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 23)]
        public decimal UOGCODE {
            get {
                return this.uOGCODEField;
            }
            set {
                this.uOGCODEField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("DOC-PROV", Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 24)]
        public decimal DOCPROV {
            get {
                return this.dOCPROVField;
            }
            set {
                this.dOCPROVField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("DOC-PCK", Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 25)]
        public decimal DOCPCK {
            get {
                return this.dOCPCKField;
            }
            set {
                this.dOCPCKField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("DOC-NUMBER", Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 26)]
        public decimal DOCNUMBER {
            get {
                return this.dOCNUMBERField;
            }
            set {
                this.dOCNUMBERField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("DOC-DATE", Form = System.Xml.Schema.XmlSchemaForm.Unqualified, DataType = "date", Order = 27)]
        public System.DateTime DOCDATE {
            get {
                return this.dOCDATEField;
            }
            set {
                this.dOCDATEField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("CNT-USER", Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 28)]
        public string CNTUSER {
            get {
                return this.cNTUSERField;
            }
            set {
                this.cNTUSERField = value;
            }
        }
    }
}