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
        Model.loginPrc lgp = new Model.loginPrc();
        public Form2()
        {
            InitializeComponent();

        }

        private void Form2_Load(object sender, EventArgs e)
        {
            //登陆界面 位置&&不可调整大小
            this.StartPosition = FormStartPosition.CenterParent;
            this.MaximizeBox = false;
            this.MinimizeBox = false;

            //设置 combobox 只可选择不可编辑
            comboBox1.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            
            //输入密码时是  * 号
            textBox1.PasswordChar = '*';

            this.Text = "管理员登陆";
            label1.Text = "用户名称";
            label2.Text = "用户密码";          
            button1.Text = "确定";
            button2.Text = "取消";
            label3.Text = null;
            
            //加载combobox 数据库数据 
            List<string> lst= lgp.getUsermae();
            for(int i=0;i<lst.Count ; i++)
            {
                comboBox1.Items.Add(lst[i]);
            }

            //加载combobox的默认值
            if (lst.Count != 0)
                comboBox1.Text = lst[0];
                  
        }

        //确定按钮
        private void button1_Click(object sender, EventArgs e)

        {
       
            String UserName = comboBox1.Text;
            String UserPwd = textBox1.Text;
            /*if (!lgp.Is_formatpwd(UserPwd))
            {
                DialogResult dr = MessageBox.Show("密码格式错误请重新输入", "密码有误", MessageBoxButtons.RetryCancel, MessageBoxIcon.Warning);
                if (DialogResult.Cancel == dr)
                {
                    Application.Exit();
                }
            }*/

            if (lgp.Is_Pwd(UserName,UserPwd)) // 验证账号密码是否匹配
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
                //密码错误时 弹框提醒
                DialogResult dr = MessageBox.Show("账号密码不匹配请重新输入","密码错误",MessageBoxButtons.RetryCancel,MessageBoxIcon.Warning);
                if(DialogResult.Cancel==dr)
                {
                    Application.Exit();
                }
            }
            
        }

        //点取消按钮时关闭程序
        private void button2_Click(object sender, EventArgs e)
        {         
            Application.Exit();
        }
   
    }
}
