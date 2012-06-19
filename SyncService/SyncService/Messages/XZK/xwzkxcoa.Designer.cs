// ------------------------------------------------------------------------------
//  <auto-generated>
//    Generated by Xsd2Code. Version 3.4.0.38967
//    <NameSpace>IntecoAG.IBS.SyncService.Messages.XZK</NameSpace><Collection>List</Collection><codeType>CSharp</codeType><EnableDataBinding>False</EnableDataBinding><EnableLazyLoading>False</EnableLazyLoading><TrackingChangesEnable>False</TrackingChangesEnable><GenTrackingClasses>False</GenTrackingClasses><HidePrivateFieldInIDE>False</HidePrivateFieldInIDE><EnableSummaryComment>False</EnableSummaryComment><VirtualProp>False</VirtualProp><IncludeSerializeMethod>True</IncludeSerializeMethod><UseBaseClass>True</UseBaseClass><GenBaseClass>False</GenBaseClass><GenerateCloneMethod>False</GenerateCloneMethod><GenerateDataContracts>False</GenerateDataContracts><CodeBaseTag>Net35</CodeBaseTag><SerializeMethodName>Serialize</SerializeMethodName><DeserializeMethodName>Deserialize</DeserializeMethodName><SaveToFileMethodName>SaveToFile</SaveToFileMethodName><LoadFromFileMethodName>LoadFromFile</LoadFromFileMethodName><GenerateXMLAttributes>True</GenerateXMLAttributes><EnableEncoding>False</EnableEncoding><AutomaticProperties>False</AutomaticProperties><GenerateShouldSerialize>False</GenerateShouldSerialize><DisableDebug>False</DisableDebug><PropNameSpecified>Default</PropNameSpecified><Encoder>UTF8</Encoder><CustomUsings></CustomUsings><ExcludeIncludedTypes>False</ExcludeIncludedTypes><EnableInitializeFields>True</EnableInitializeFields>
//  </auto-generated>
// ------------------------------------------------------------------------------
namespace IntecoAG.IBS.SyncService.Messages.XZK {
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
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType=true)]
    [System.Xml.Serialization.XmlRootAttribute(Namespace="", IsNullable=false)]
    public partial class XWZKXCOA : ServiceMessage<XWZKXCOA> {
        
        private int rETURNCODEField;
        
        private List<XWZKXCOAZKLIST> zKLISTField;
        
        public XWZKXCOA() {
            this.zKLISTField = new List<XWZKXCOAZKLIST>();
        }
        
        [System.Xml.Serialization.XmlElementAttribute("RETURN-CODE", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=0)]
        public int RETURNCODE {
            get {
                return this.rETURNCODEField;
            }
            set {
                this.rETURNCODEField = value;
            }
        }
        
        [System.Xml.Serialization.XmlElementAttribute("ZK-LIST", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=1)]
        public List<XWZKXCOAZKLIST> ZKLIST {
            get {
                return this.zKLISTField;
            }
            set {
                this.zKLISTField = value;
            }
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Xml", "4.0.30319.1")]
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType=true)]
    public partial class XWZKXCOAZKLIST : ServiceMessage<XWZKXCOAZKLIST> {
        
        private string zKCODEField;
        
        private bool zKISCLOSEDField;
        
        private string zKSUBJECTCODEField;
        
        private string zKDTOPENField;
        
        private string zKDTCLOSEField;
        
        [System.Xml.Serialization.XmlElementAttribute("ZK-CODE", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=0)]
        public string ZKCODE {
            get {
                return this.zKCODEField;
            }
            set {
                this.zKCODEField = value;
            }
        }
        
        [System.Xml.Serialization.XmlElementAttribute("ZK-IS-CLOSED", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=1)]
        public bool ZKISCLOSED {
            get {
                return this.zKISCLOSEDField;
            }
            set {
                this.zKISCLOSEDField = value;
            }
        }
        
        [System.Xml.Serialization.XmlElementAttribute("ZK-SUBJECT-CODE", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=2)]
        public string ZKSUBJECTCODE {
            get {
                return this.zKSUBJECTCODEField;
            }
            set {
                this.zKSUBJECTCODEField = value;
            }
        }
        
        [System.Xml.Serialization.XmlElementAttribute("ZK-DT-OPEN", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=3)]
        public string ZKDTOPEN {
            get {
                return this.zKDTOPENField;
            }
            set {
                this.zKDTOPENField = value;
            }
        }
        
        [System.Xml.Serialization.XmlElementAttribute("ZK-DT-CLOSE", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=4)]
        public string ZKDTCLOSE {
            get {
                return this.zKDTCLOSEField;
            }
            set {
                this.zKDTCLOSEField = value;
            }
        }
    }
}
