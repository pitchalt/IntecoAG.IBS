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
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    [System.Xml.Serialization.XmlRootAttribute(Namespace = "", IsNullable = false)]
    public partial class XWZKXMIA : ServiceMessage<XWZKXMIA> {

        private string cMDField;

        private decimal oGCODEField;

        private int zKINTNUMField;

        private string zKCODEField;

        private decimal zKACBUHCODEField;

        private bool zKISCLOSEDField;

        private string zKDTOPENField;

        private string zKDTCLOSEField;

        private string zKSUBJECTCODEField;

        private string zKSHORTNAMEField;

        private string zKFULLNAMEField;

        private string zKDESCRIPTIONField;

        private decimal zKDPBUHCODEField;

        private decimal zKTBBUHCODEField;

        private string zKSOURCEField;

        private string zKNDSMODEField;

        private string zKBUHTYPEField;

        private decimal zKKOEFFKBField;

        private decimal zKKOEFFOZMField;

        [System.Xml.Serialization.XmlElementAttribute(Order = 0)]
        public string CMD {
            get {
                return this.cMDField;
            }
            set {
                this.cMDField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("OG-CODE", Order = 1)]
        public decimal OGCODE {
            get {
                return this.oGCODEField;
            }
            set {
                this.oGCODEField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("ZK-INT-NUM", Order = 2)]
        public int ZKINTNUM {
            get {
                return this.zKINTNUMField;
            }
            set {
                this.zKINTNUMField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("ZK-CODE", Order = 3)]
        public string ZKCODE {
            get {
                return this.zKCODEField;
            }
            set {
                this.zKCODEField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("ZK-AC-BUH-CODE", Order = 4)]
        public decimal ZKACBUHCODE {
            get {
                return this.zKACBUHCODEField;
            }
            set {
                this.zKACBUHCODEField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("ZK-IS-CLOSED", Order = 5)]
        public bool ZKISCLOSED {
            get {
                return this.zKISCLOSEDField;
            }
            set {
                this.zKISCLOSEDField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("ZK-DT-OPEN", Order = 6)]
        public string ZKDTOPEN {
            get {
                return this.zKDTOPENField;
            }
            set {
                this.zKDTOPENField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("ZK-DT-CLOSE", Order = 7)]
        public string ZKDTCLOSE {
            get {
                return this.zKDTCLOSEField;
            }
            set {
                this.zKDTCLOSEField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("ZK-SUBJECT-CODE", Order = 8)]
        public string ZKSUBJECTCODE {
            get {
                return this.zKSUBJECTCODEField;
            }
            set {
                this.zKSUBJECTCODEField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("ZK-SHORT-NAME", Order = 9)]
        public string ZKSHORTNAME {
            get {
                return this.zKSHORTNAMEField;
            }
            set {
                this.zKSHORTNAMEField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("ZK-FULL-NAME", Order = 10)]
        public string ZKFULLNAME {
            get {
                return this.zKFULLNAMEField;
            }
            set {
                this.zKFULLNAMEField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("ZK-DESCRIPTION", Order = 11)]
        public string ZKDESCRIPTION {
            get {
                return this.zKDESCRIPTIONField;
            }
            set {
                this.zKDESCRIPTIONField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("ZK-DP-BUH-CODE", Order = 12)]
        public decimal ZKDPBUHCODE {
            get {
                return this.zKDPBUHCODEField;
            }
            set {
                this.zKDPBUHCODEField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("ZK-TB-BUH-CODE", Order = 13)]
        public decimal ZKTBBUHCODE {
            get {
                return this.zKTBBUHCODEField;
            }
            set {
                this.zKTBBUHCODEField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("ZK-SOURCE", Order = 14)]
        public string ZKSOURCE {
            get {
                return this.zKSOURCEField;
            }
            set {
                this.zKSOURCEField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("ZK-NDS-MODE", Order = 15)]
        public string ZKNDSMODE {
            get {
                return this.zKNDSMODEField;
            }
            set {
                this.zKNDSMODEField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("ZK-BUH-TYPE", Order = 16)]
        public string ZKBUHTYPE {
            get {
                return this.zKBUHTYPEField;
            }
            set {
                this.zKBUHTYPEField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("ZK-KOEFF-KB", Order = 17)]
        public decimal ZKKOEFFKB {
            get {
                return this.zKKOEFFKBField;
            }
            set {
                this.zKKOEFFKBField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("ZK-KOEFF-OZM", Order = 18)]
        public decimal ZKKOEFFOZM {
            get {
                return this.zKKOEFFOZMField;
            }
            set {
                this.zKKOEFFOZMField = value;
            }
        }
    }
}
