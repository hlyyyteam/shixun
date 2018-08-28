using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Configuration;
using MySql.Data.MySqlClient;
namespace login
{
    public partial class Form2 : Form
    {

        DbHelper dbh = new DbHelper();
        public Form2()
        {
            InitializeComponent();

        }

        private void Form2_Load(object sender, EventArgs e)
        {
            this.StartPosition = FormStartPosition.CenterParent;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            label1.Text = "用户名称";
            label2.Text = "用户密码";
            textBox1.PasswordChar = '*';
            button1.Text = "确定";
            button2.Text = "取消";
            label3.Text = null;
            
            List<string> lst= dbh.getNames();
            for(int i=0;i<lst.Count ; i++)
            {
                comboBox1.Items.Add(lst[i]);
            }
            if (lst.Count != 0)
                comboBox1.Text = lst[0];
                  

        }

        private void button1_Click(object sender, EventArgs e)

        {
            String UserName = comboBox1.Text;
            String UserPwd = textBox1.Text;
            if(dbh.Is_Pwd(UserName,UserPwd))
            {
                MessageBox.Show("账号密码正确");
                // label3.Text = "账号密码正确,正在登陆";
                //System.Threading.Thread.Sleep(100);
                Form form1 = new Form1(UserName,true);
                form1.ShowDialog(this);
                this.Close();
            }
            else
            {
                DialogResult dr = MessageBox.Show("账号密码不匹配请重新输入","密码错误",MessageBoxButtons.RetryCancel,MessageBoxIcon.Warning);
                if(DialogResult.Cancel==dr)
                {
                    Application.Exit();
                }
            }
            
        }

        private void button2_Click(object sender, EventArgs e)
        {
           
            Application.Exit();
        }
   
    }
}
