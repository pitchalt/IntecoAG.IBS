// ------------------------------------------------------------------------------
//  <auto-generated>
//    Generated by Xsd2Code. Version 3.4.0.38967
//    <NameSpace>IntecoAG.IBS.SyncService.Messages.XVO</NameSpace><Collection>List</Collection><codeType>CSharp</codeType><EnableDataBinding>False</EnableDataBinding><EnableLazyLoading>False</EnableLazyLoading><TrackingChangesEnable>False</TrackingChangesEnable><GenTrackingClasses>False</GenTrackingClasses><HidePrivateFieldInIDE>False</HidePrivateFieldInIDE><EnableSummaryComment>False</EnableSummaryComment><VirtualProp>False</VirtualProp><IncludeSerializeMethod>True</IncludeSerializeMethod><UseBaseClass>False</UseBaseClass><GenBaseClass>False</GenBaseClass><GenerateCloneMethod>False</GenerateCloneMethod><GenerateDataContracts>False</GenerateDataContracts><CodeBaseTag>Net35</CodeBaseTag><SerializeMethodName>Serialize</SerializeMethodName><DeserializeMethodName>Deserialize</DeserializeMethodName><SaveToFileMethodName>SaveToFile</SaveToFileMethodName><LoadFromFileMethodName>LoadFromFile</LoadFromFileMethodName><GenerateXMLAttributes>True</GenerateXMLAttributes><EnableEncoding>False</EnableEncoding><AutomaticProperties>False</AutomaticProperties><GenerateShouldSerialize>False</GenerateShouldSerialize><DisableDebug>False</DisableDebug><PropNameSpecified>Default</PropNameSpecified><Encoder>UTF8</Encoder><CustomUsings></CustomUsings><ExcludeIncludedTypes>False</ExcludeIncludedTypes><EnableInitializeFields>True</EnableInitializeFields>
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
    public partial class XWVOXMIA {
        
        private string cMDField;
        
        private decimal oGCODEField;
        
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
        
        private static System.Xml.Serialization.XmlSerializer serializer;
        
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=0)]
        public string CMD {
            get {
                return this.cMDField;
            }
            set {
                this.cMDField = value;
            }
        }
        
        [System.Xml.Serialization.XmlElementAttribute("OG-CODE", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=1)]
        public decimal OGCODE {
            get {
                return this.oGCODEField;
            }
            set {
                this.oGCODEField = value;
            }
        }
        
        [System.Xml.Serialization.XmlElementAttribute("VO-TYPE", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=2)]
        public string VOTYPE {
            get {
                return this.vOTYPEField;
            }
            set {
                this.vOTYPEField = value;
            }
        }
        
        [System.Xml.Serialization.XmlElementAttribute("VO-CODE", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=3)]
        public decimal VOCODE {
            get {
                return this.vOCODEField;
            }
            set {
                this.vOCODEField = value;
            }
        }
        
        [System.Xml.Serialization.XmlElementAttribute("VO-COUNTRY-CODE", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=4)]
        public string VOCOUNTRYCODE {
            get {
                return this.vOCOUNTRYCODEField;
            }
            set {
                this.vOCOUNTRYCODEField = value;
            }
        }
        
        [System.Xml.Serialization.XmlElementAttribute("VO-INN", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=5)]
        public string VOINN {
            get {
                return this.vOINNField;
            }
            set {
                this.vOINNField = value;
            }
        }
        
        [System.Xml.Serialization.XmlElementAttribute("VO-KPP", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=6)]
        public string VOKPP {
            get {
                return this.vOKPPField;
            }
            set {
                this.vOKPPField = value;
            }
        }
        
        [System.Xml.Serialization.XmlElementAttribute("VO-NAME", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=7)]
        public string VONAME {
            get {
                return this.vONAMEField;
            }
            set {
                this.vONAMEField = value;
            }
        }
        
        [System.Xml.Serialization.XmlElementAttribute("VO-ADDR", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=8)]
        public string VOADDR {
            get {
                return this.vOADDRField;
            }
            set {
                this.vOADDRField = value;
            }
        }
        
        [System.Xml.Serialization.XmlElementAttribute("VO-NAME-FULL", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=9)]
        public string VONAMEFULL {
            get {
                return this.vONAMEFULLField;
            }
            set {
                this.vONAMEFULLField = value;
            }
        }
        
        [System.Xml.Serialization.XmlElementAttribute("VO-UP-USER", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=10)]
        public string VOUPUSER {
            get {
                return this.vOUPUSERField;
            }
            set {
                this.vOUPUSERField = value;
            }
        }
        
        [System.Xml.Serialization.XmlElementAttribute("VO-UP-PGM", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=11)]
        public string VOUPPGM {
            get {
                return this.vOUPPGMField;
            }
            set {
                this.vOUPPGMField = value;
            }
        }
        
        [System.Xml.Serialization.XmlElementAttribute("VO-UP-TIME", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=12)]
        public string VOUPTIME {
            get {
                return this.vOUPTIMEField;
            }
            set {
                this.vOUPTIMEField = value;
            }
        }
        
        private static System.Xml.Serialization.XmlSerializer Serializer {
            get {
                if ((serializer == null)) {
                    serializer = new System.Xml.Serialization.XmlSerializer(typeof(XWVOXMIA));
                }
                return serializer;
            }
        }
        
        #region Serialize/Deserialize
        /// <summary>
        /// Serializes current XWVOXMIA object into an XML document
        /// </summary>
        /// <returns>string XML value</returns>
        public virtual string Serialize() {
            System.IO.StreamReader streamReader = null;
            System.IO.MemoryStream memoryStream = null;
            try {
                memoryStream = new System.IO.MemoryStream();
                Serializer.Serialize(memoryStream, this);
                memoryStream.Seek(0, System.IO.SeekOrigin.Begin);
                streamReader = new System.IO.StreamReader(memoryStream);
                return streamReader.ReadToEnd();
            }
            finally {
                if ((streamReader != null)) {
                    streamReader.Dispose();
                }
                if ((memoryStream != null)) {
                    memoryStream.Dispose();
                }
            }
        }
        
        /// <summary>
        /// Deserializes workflow markup into an XWVOXMIA object
        /// </summary>
        /// <param name="xml">string workflow markup to deserialize</param>
        /// <param name="obj">Output XWVOXMIA object</param>
        /// <param name="exception">output Exception value if deserialize failed</param>
        /// <returns>true if this XmlSerializer can deserialize the object; otherwise, false</returns>
        public static bool Deserialize(string xml, out XWVOXMIA obj, out System.Exception exception) {
            exception = null;
            obj = default(XWVOXMIA);
            try {
                obj = Deserialize(xml);
                return true;
            }
            catch (System.Exception ex) {
                exception = ex;
                return false;
            }
        }
        
        public static bool Deserialize(string xml, out XWVOXMIA obj) {
            System.Exception exception = null;
            return Deserialize(xml, out obj, out exception);
        }
        
        public static XWVOXMIA Deserialize(string xml) {
            System.IO.StringReader stringReader = null;
            try {
                stringReader = new System.IO.StringReader(xml);
                return ((XWVOXMIA)(Serializer.Deserialize(System.Xml.XmlReader.Create(stringReader))));
            }
            finally {
                if ((stringReader != null)) {
                    stringReader.Dispose();
                }
            }
        }
        
        /// <summary>
        /// Serializes current XWVOXMIA object into file
        /// </summary>
        /// <param name="fileName">full path of outupt xml file</param>
        /// <param name="exception">output Exception value if failed</param>
        /// <returns>true if can serialize and save into file; otherwise, false</returns>
        public virtual bool SaveToFile(string fileName, out System.Exception exception) {
            exception = null;
            try {
                SaveToFile(fileName);
                return true;
            }
            catch (System.Exception e) {
                exception = e;
                return false;
            }
        }
        
        public virtual void SaveToFile(string fileName) {
            System.IO.StreamWriter streamWriter = null;
            try {
                string xmlString = Serialize();
                System.IO.FileInfo xmlFile = new System.IO.FileInfo(fileName);
                streamWriter = xmlFile.CreateText();
                streamWriter.WriteLine(xmlString);
                streamWriter.Close();
            }
            finally {
                if ((streamWriter != null)) {
                    streamWriter.Dispose();
                }
            }
        }
        
        /// <summary>
        /// Deserializes xml markup from file into an XWVOXMIA object
        /// </summary>
        /// <param name="fileName">string xml file to load and deserialize</param>
        /// <param name="obj">Output XWVOXMIA object</param>
        /// <param name="exception">output Exception value if deserialize failed</param>
        /// <returns>true if this XmlSerializer can deserialize the object; otherwise, false</returns>
        public static bool LoadFromFile(string fileName, out XWVOXMIA obj, out System.Exception exception) {
            exception = null;
            obj = default(XWVOXMIA);
            try {
                obj = LoadFromFile(fileName);
                return true;
            }
            catch (System.Exception ex) {
                exception = ex;
                return false;
            }
        }
        
        public static bool LoadFromFile(string fileName, out XWVOXMIA obj) {
            System.Exception exception = null;
            return LoadFromFile(fileName, out obj, out exception);
        }
        
        public static XWVOXMIA LoadFromFile(string fileName) {
            System.IO.FileStream file = null;
            System.IO.StreamReader sr = null;
            try {
                file = new System.IO.FileStream(fileName, FileMode.Open, FileAccess.Read);
                sr = new System.IO.StreamReader(file);
                string xmlString = sr.ReadToEnd();
                sr.Close();
                file.Close();
                return Deserialize(xmlString);
            }
            finally {
                if ((file != null)) {
                    file.Dispose();
                }
                if ((sr != null)) {
                    sr.Dispose();
                }
            }
        }
        #endregion
    }
}
