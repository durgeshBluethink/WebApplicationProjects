using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplicationProject.AdminModule
{
    public partial class MasterJobSeeker : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("data source=DURGESH\\SQLEXPRESS; initial catalog=JobPortal_5724;integrated security=true");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindJobSeeker();
            }
        }

        public void BindJobSeeker()
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("Proc_JobSeeker", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "JobSeekerJoin");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            conn.Close();

            gvjobseeker.DataSource = dt;
            gvjobseeker.DataBind();
        }
    }
}
