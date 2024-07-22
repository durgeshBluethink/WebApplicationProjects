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
            if (ddlusertype.SelectedValue == "1")
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT* from tblAdmin where AdminEmail= '" + txtemail.Text + "' and AdminPassword='" + txtpassword.Text + "'", conn);
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                ad.Fill(dt);
                conn.Close();

                if (dt.Rows.Count > 0)
                {
                    Response.Redirect("~/AdminModule/AdminHome.aspx");
                }
                else
                {
                    lblmsg.Text = "Login Failed!";
                }

            }
            else if (ddlusertype.SelectedValue == "2")
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT* from tblJobSeeker where JobSeekerEmail= '" + txtemail.Text + "' and JobSeekerPassword='" + txtpassword.Text + "'", conn);
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                ad.Fill(dt);
                conn.Close();

                if (dt.Rows.Count > 0)
                {
                    Response.Redirect("~/JobSeekerModule/JobSeekerHome.aspx");
                }
                else
                {
                    lblmsg.Text = "Login Failed!";
                }

            }
            else if (ddlusertype.SelectedValue == "3")
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT* from tblJobRecruiter where JobRecruiterEmail= '" + txtemail.Text + "' and JobRecruiterPassword='" + txtpassword.Text + "'", conn);
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                ad.Fill(dt);
                conn.Close();


                if (dt.Rows.Count > 0)
                {
                    Session["JRID"] = dt.Rows[0]["JobRecruiterId"];
                    Response.Redirect("~/JobRecruiterModule/JobRecruiterHome.aspx");
                }
                else
                {
                    lblmsg.Text = "Login Failed!";
                }
            }

        }
    }
}