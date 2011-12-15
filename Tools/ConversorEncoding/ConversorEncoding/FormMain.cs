using System;
using System.Text;
using System.Windows.Forms;
using System.IO;
 
namespace ConversorEncoding
{
    /* Porquê esta josta não processa acentos? Esses cabeçudos não entendem de internacionalização? É F@da!*/

    public partial class FormMain : Form
    {
        public FormMain()
        {
            InitializeComponent();
        }

        private void btnStartConverter_Click(object sender, EventArgs e)
        {
            String output = String.Empty;
            foreach (var myFile in new DirectoryInfo(txtPath.Text).GetFiles(txtExtension.Text, SearchOption.AllDirectories))
            {
                byte[] mass = new byte[1];
                using (FileStream fs = File.OpenRead(myFile.FullName)) {
                    fs.Read(mass, 0, 1);
                    fs.Close();
                    output = myFile.FullName;
                    if (mass[0] == 0xEF) {
                        output += "...SKIPPED";
                    } else {
                        String myFileContent = File.ReadAllText(myFile.FullName, Encoding.GetEncoding("windows-1251"));
                        File.WriteAllText(myFile.FullName, myFileContent, Encoding.UTF8);
                        output += "...Ok";
                    }
                    lstBxOutput.Items.Add(output);
                }
            }
            MessageBox.Show("Feito!");
        }

        private void btnFolderSelect_Click(object sender, EventArgs e)
        {
            if (folderBD.ShowDialog().Equals(DialogResult.OK))
            {
                txtPath.Text = folderBD.SelectedPath;
            }
        }
    }
}