using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationProject
{
    public partial class JobRecruiterRegistration : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("data source=DURGESH\\SQLEXPRESS; initial catalog=JobPortal_5724;integrated security=true;");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                BindState();
            }

        }

        public void BindState()
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM tblState", conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            ddlstate.DataValueField = "StateId";
            ddlstate.DataTextField = "StateName";
            ddlstate.DataSource = dt;
            ddlstate.DataBind();
            ddlstate.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        public void BindCity()
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM tblCity WHERE StateId = @StateId", conn);
            cmd.Parameters.AddWithValue("@StateId", ddlstate.SelectedValue);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            ddlcity.DataValueField = "CityId";
            ddlcity.DataTextField = "CityName";
            ddlcity.DataSource = dt;
            ddlcity.DataBind();
            ddlcity.Items.Insert(0, new ListItem("--Select--", "0"));
        }


        protected void ddlstate_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindCity();

        }

        protected void btnregister_Click(object sender, EventArgs e)
        {
            String ImageName = fuimage.PostedFile.FileName;

            fuimage.SaveAs(Server.MapPath("JobRecruiterImages" + "\\" + ImageName));

            conn.Open();
            SqlCommand cmd = new SqlCommand("proc_JobRecruiter", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "INSERT");
            cmd.Parameters.AddWithValue("@JobRecruiterName", txtname.Text);
            cmd.Parameters.AddWithValue("@JobRecruiterEmail", txtemail.Text);
            cmd.Parameters.AddWithValue("@JobRecruiterPassword", txtpassword.Text);
            cmd.Parameters.AddWithValue("@JobRecruiterURL", txturl.Text);
            cmd.Parameters.AddWithValue("@JobRecruiterMobile", txtmobile.Text);
            cmd.Parameters.AddWithValue("@JobRecruiterHR", txthr.Text);
            cmd.Parameters.AddWithValue("@JobRecruiterState", ddlstate.SelectedValue);
            cmd.Parameters.AddWithValue("@JobRecruiterCity", ddlcity.SelectedValue);
            cmd.Parameters.AddWithValue("@JobRecruiterAddress", txtadd.Text);
            cmd.Parameters.AddWithValue("@JobRecruiterImage", ImageName);
            cmd.Parameters.AddWithValue("@JobRecruiterComments", txtcomments.Text);

            cmd.ExecuteNonQuery();
            conn.Close();

        }
    }
}

/*
 
namespace WebApplicationProject
{
    public partial class JobRecruiterRegistration : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

       
        protected void ddlstate_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindCity();
        }

        protected void btnregister_Click(object sender, EventArgs e)
        {
           

        }
    }
}
 */