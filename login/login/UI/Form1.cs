using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace login
{
    public partial class Form1 : Form
    {
        public bool Is_login=false;
        public string Username = null;
        
        public Form1()
        {

            InitializeComponent();
        }
        public Form1(bool Is_login)
        {
            this.Is_login = Is_login;
            InitializeComponent();
        }
        public Form1(string Username,bool Is_login)
        {
            InitializeComponent();
            this.Is_login = Is_login;
            this.Username = Username;
            if (Is_login)
            {
                this.Text = Username + " 已登录";
            }
            else
            {
                Application.Exit();
            }
        
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            
           
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
    }
}
