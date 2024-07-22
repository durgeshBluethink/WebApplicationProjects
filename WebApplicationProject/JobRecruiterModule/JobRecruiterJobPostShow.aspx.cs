using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace WebApplicationProject.JobRecruiterModule
{
    public partial class JobRecruiterJobPostShow : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("data source=DURGESH\\SQLEXPRESS; initial catalog=JobPortal_5724;integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindJobPost();
            }

        }
        public void BindJobPost()
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("proc_JobPost", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "JobPostJoin");
            cmd.Parameters.AddWithValue("@JobRecruiterId",Session["JRID"]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            gvjobpost.DataSource = dt;
            gvjobpost.DataBind();

        }
    }
}