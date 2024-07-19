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
    public partial class JobSeekerRegistration : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("data source=DURGESH\\SQLEXPRESS; initial catalog=JobPortal_5724;integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindQualification();
                BindJobProfile();
                BindState();
            }
        }

        public void BindQualification()
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM tblQualifications", conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            ddlqualification.DataValueField = "QualificationId";
            ddlqualification.DataTextField = "QualificationName";
            ddlqualification.DataSource = dt;
            ddlqualification.DataBind();
            ddlqualification.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        public void BindJobProfile()
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM tblJobProfile", conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            ddljobprofile.DataValueField = "JobProfileId";
            ddljobprofile.DataTextField = "JobProfileName";
            ddljobprofile.DataSource = dt;
            ddljobprofile.DataBind();
            ddljobprofile.Items.Insert(0, new ListItem("--Select--", "0"));
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
            String ResumeName = furesume.PostedFile.FileName;

            fuimage.SaveAs(Server.MapPath("JobSeekerImages" + "\\" + ImageName));
            furesume.SaveAs(Server.MapPath("JobSeekerResumes" + "\\" + ResumeName));

            conn.Open();
            SqlCommand cmd = new SqlCommand("Proc_JobSeeker", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "INSERT");
            cmd.Parameters.AddWithValue("@JobSeekerName", txtname.Text);
            cmd.Parameters.AddWithValue("@JobSeekerEmail", txtemail.Text);
            cmd.Parameters.AddWithValue("@JobSeekerPassword", txtpassword.Text);
            cmd.Parameters.AddWithValue("@JobSeekerDOB", txtdob.Text);
            cmd.Parameters.AddWithValue("@JobSeekerGender", rblgender.SelectedValue);
            cmd.Parameters.AddWithValue("@JobSeekerMobile", txtmobile.Text);
            cmd.Parameters.AddWithValue("@JobSeekerJobProfile", ddljobprofile.SelectedValue);
            cmd.Parameters.AddWithValue("@JobSeekerQualification", ddlqualification.SelectedValue);
            cmd.Parameters.AddWithValue("@JobSeekerState", ddlstate.SelectedValue);
            cmd.Parameters.AddWithValue("@JobSeekerCity", ddlcity.SelectedValue);
            cmd.Parameters.AddWithValue("@JobSeekerAddress", txtadd.Text);
            cmd.Parameters.AddWithValue("@JobSeekerExp", ddlexperience.SelectedValue);
            cmd.Parameters.AddWithValue("@JobSeekerImage", ImageName);
            cmd.Parameters.AddWithValue("@JobSeekerResume", ResumeName);
            cmd.Parameters.AddWithValue("@JobSeekerComments", txtcomments.Text);

            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}