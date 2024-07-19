using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationProject
{
    public partial class LoginForm : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("data source=DURGESH\\SQLEXPRESS; initial catalog=JobPortal_5724;integrated security=true");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("select from tblJobSeeker where JobSeekerEmail= '"+txtemail.Text+"' and JobSeekerPassword='"+txtpassword.Text+"'", conn);
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            ad.Fill(dt);
            conn.Close();

            if(dt.Rows.Count > 0)
            {
                Response.Redirect("JobSeekerHome.aspx");
            }
            else
            {
                lblmsg.Text = "Login Failed!";
            }

        }
    }
}