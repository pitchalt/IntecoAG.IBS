// ------------------------------------------------------------------------------
//  <auto-generated>
//    Generated by Xsd2Code. Version 3.4.0.38967
//    <NameSpace>IntecoAG.IBS.SyncService.Messages.XVO</NameSpace><Collection>List</Collection><codeType>CSharp</codeType><EnableDataBinding>False</EnableDataBinding><EnableLazyLoading>False</EnableLazyLoading><TrackingChangesEnable>False</TrackingChangesEnable><GenTrackingClasses>False</GenTrackingClasses><HidePrivateFieldInIDE>False</HidePrivateFieldInIDE><EnableSummaryComment>False</EnableSummaryComment><VirtualProp>False</VirtualProp><IncludeSerializeMethod>True</IncludeSerializeMethod><UseBaseClass>True</UseBaseClass><GenBaseClass>False</GenBaseClass><GenerateCloneMethod>True</GenerateCloneMethod><GenerateDataContracts>False</GenerateDataContracts><CodeBaseTag>Net35</CodeBaseTag><SerializeMethodName>Serialize</SerializeMethodName><DeserializeMethodName>Deserialize</DeserializeMethodName><SaveToFileMethodName>SaveToFile</SaveToFileMethodName><LoadFromFileMethodName>LoadFromFile</LoadFromFileMethodName><GenerateXMLAttributes>True</GenerateXMLAttributes><EnableEncoding>False</EnableEncoding><AutomaticProperties>False</AutomaticProperties><GenerateShouldSerialize>False</GenerateShouldSerialize><DisableDebug>False</DisableDebug><PropNameSpecified>Default</PropNameSpecified><Encoder>UTF8</Encoder><CustomUsings></CustomUsings><ExcludeIncludedTypes>False</ExcludeIncludedTypes><EnableInitializeFields>True</EnableInitializeFields>
//  </auto-generated>
// ------------------------------------------------------------------------------
namespace IntecoAG.IBS.SyncService.Messages.XVO {
    using System;
    using System.Diagnostics;
    using System.Xml.Serialization;
    using System.Collections;
    using System.Xml.Schema;
    using System.ComponentModel;
    using System.IO;
    using System.Text;
    using System.Collections.Generic;
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Xml", "4.0.30319.233")]
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType=true)]
    [System.Xml.Serialization.XmlRootAttribute(Namespace="", IsNullable=false)]
    public partial class XWVOXMOA : ServiceMessage<XWVOXMOA> {
        
        private int rETURNCODEField;
        
        private int eRRORNUMBERField;
        
        private string eRRORMODULEField;
        
        private int eRRORLINEField;
        
        private string uUIDField;
        
        private string vOTYPEField;
        
        private decimal vOCODEField;
        
        private string vOCOUNTRYCODEField;
        
        private string vOINNField;
        
        private string vOKPPField;
        
        private string vONAMEField;
        
        private string vOADDRField;
        
        private string vONAMEFULLField;
        
        private string vOUPUSERField;
        
        private string vOUPPGMField;
        
        private string vOUPTIMEField;
        
        [System.Xml.Serialization.XmlElementAttribute("RETURN-CODE", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=0)]
        public int RETURNCODE {
            get {
                return this.rETURNCODEField;
            }
            set {
                this.rETURNCODEField = value;
            }
        }
        
        [System.Xml.Serialization.XmlElementAttribute("ERROR-NUMBER", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=1)]
        public int ERRORNUMBER {
            get {
                return this.eRRORNUMBERField;
            }
            set {
                this.eRRORNUMBERField = value;
            }
        }
        
        [System.Xml.Serialization.XmlElementAttribute("ERROR-MODULE", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=2)]
        public string ERRORMODULE {
            get {
                return this.eRRORMODULEField;
            }
            set {
                this.eRRORMODULEField = value;
            }
        }
        
        [System.Xml.Serialization.XmlElementAttribute("ERROR-LINE", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=3)]
        public int ERRORLINE {
            get {
                return this.eRRORLINEField;
            }
            set {
                this.eRRORLINEField = value;
            }
        }
        
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=4)]
        public string UUID {
            get {
                return this.uUIDField;
            }
            set {
                this.uUIDField = value;
            }
        }
        
        [System.Xml.Serialization.XmlElementAttribute("VO-TYPE", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=5)]
        public string VOTYPE {
            get {
                return this.vOTYPEField;
            }
            set {
                this.vOTYPEField = value;
            }
        }
        
        [System.Xml.Serialization.XmlElementAttribute("VO-CODE", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=6)]
        public decimal VOCODE {
            get {
                return this.vOCODEField;
            }
            set {
                this.vOCODEField = value;
            }
        }
        
        [System.Xml.Serialization.XmlElementAttribute("VO-COUNTRY-CODE", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=7)]
        public string VOCOUNTRYCODE {
            get {
                return this.vOCOUNTRYCODEField;
            }
            set {
                this.vOCOUNTRYCODEField = value;
            }
        }
        
        [System.Xml.Serialization.XmlElementAttribute("VO-INN", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=8)]
        public string VOINN {
            get {
                return this.vOINNField;
            }
            set {
                this.vOINNField = value;
            }
        }
        
        [System.Xml.Serialization.XmlElementAttribute("VO-KPP", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=9)]
        public string VOKPP {
            get {
                return this.vOKPPField;
            }
            set {
                this.vOKPPField = value;
            }
        }
        
        [System.Xml.Serialization.XmlElementAttribute("VO-NAME", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=10)]
        public string VONAME {
            get {
                return this.vONAMEField;
            }
            set {
                this.vONAMEField = value;
            }
        }
        
        [System.Xml.Serialization.XmlElementAttribute("VO-ADDR", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=11)]
        public string VOADDR {
            get {
                return this.vOADDRField;
            }
            set {
                this.vOADDRField = value;
            }
        }
        
        [System.Xml.Serialization.XmlElementAttribute("VO-NAME-FULL", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=12)]
        public string VONAMEFULL {
            get {
                return this.vONAMEFULLField;
            }
            set {
                this.vONAMEFULLField = value;
            }
        }
        
        [System.Xml.Serialization.XmlElementAttribute("VO-UP-USER", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=13)]
        public string VOUPUSER {
            get {
                return this.vOUPUSERField;
            }
            set {
                this.vOUPUSERField = value;
            }
        }
        
        [System.Xml.Serialization.XmlElementAttribute("VO-UP-PGM", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=14)]
        public string VOUPPGM {
            get {
                return this.vOUPPGMField;
            }
            set {
                this.vOUPPGMField = value;
            }
        }
        
        [System.Xml.Serialization.XmlElementAttribute("VO-UP-TIME", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=15)]
        public string VOUPTIME {
            get {
                return this.vOUPTIMEField;
            }
            set {
                this.vOUPTIMEField = value;
            }
        }
    }
}
