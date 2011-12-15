namespace ConversorEncoding
{
    partial class FormMain
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.folderBD = new System.Windows.Forms.FolderBrowserDialog();
            this.txtPath = new System.Windows.Forms.TextBox();
            this.btnFolderSelect = new System.Windows.Forms.Button();
            this.lstBxOutput = new System.Windows.Forms.ListBox();
            this.btnStartConverter = new System.Windows.Forms.Button();
            this.txtExtension = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // txtPath
            // 
            this.txtPath.Location = new System.Drawing.Point(12, 31);
            this.txtPath.Name = "txtPath";
            this.txtPath.Size = new System.Drawing.Size(753, 20);
            this.txtPath.TabIndex = 0;
            this.txtPath.Text = "C:\\Users\\Usuario\\Documents\\Visual Studio 2008\\Projects\\GuiaCatolico";
            // 
            // btnFolderSelect
            // 
            this.btnFolderSelect.Location = new System.Drawing.Point(771, 28);
            this.btnFolderSelect.Name = "btnFolderSelect";
            this.btnFolderSelect.Size = new System.Drawing.Size(24, 23);
            this.btnFolderSelect.TabIndex = 1;
            this.btnFolderSelect.Text = "...";
            this.btnFolderSelect.UseVisualStyleBackColor = true;
            this.btnFolderSelect.Click += new System.EventHandler(this.btnFolderSelect_Click);
            // 
            // lstBxOutput
            // 
            this.lstBxOutput.FormattingEnabled = true;
            this.lstBxOutput.Location = new System.Drawing.Point(12, 63);
            this.lstBxOutput.Name = "lstBxOutput";
            this.lstBxOutput.Size = new System.Drawing.Size(974, 472);
            this.lstBxOutput.TabIndex = 2;
            // 
            // btnStartConverter
            // 
            this.btnStartConverter.Location = new System.Drawing.Point(911, 28);
            this.btnStartConverter.Name = "btnStartConverter";
            this.btnStartConverter.Size = new System.Drawing.Size(75, 23);
            this.btnStartConverter.TabIndex = 3;
            this.btnStartConverter.Text = "Converta!";
            this.btnStartConverter.UseVisualStyleBackColor = true;
            this.btnStartConverter.Click += new System.EventHandler(this.btnStartConverter_Click);
            // 
            // txtExtension
            // 
            this.txtExtension.Location = new System.Drawing.Point(801, 31);
            this.txtExtension.Name = "txtExtension";
            this.txtExtension.Size = new System.Drawing.Size(104, 20);
            this.txtExtension.TabIndex = 4;
            this.txtExtension.Text = "*.aspx";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(13, 12);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(34, 13);
            this.label1.TabIndex = 5;
            this.label1.Text = "Pasta";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(801, 12);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(51, 13);
            this.label2.TabIndex = 6;
            this.label2.Text = "Extensão";
            // 
            // FormMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(999, 554);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtExtension);
            this.Controls.Add(this.btnStartConverter);
            this.Controls.Add(this.lstBxOutput);
            this.Controls.Add(this.btnFolderSelect);
            this.Controls.Add(this.txtPath);
            this.Name = "FormMain";
            this.Text = "Conversor de Encoding";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.FolderBrowserDialog folderBD;
        private System.Windows.Forms.TextBox txtPath;
        private System.Windows.Forms.Button btnFolderSelect;
        private System.Windows.Forms.ListBox lstBxOutput;
        private System.Windows.Forms.Button btnStartConverter;
        private System.Windows.Forms.TextBox txtExtension;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;

    }
}

