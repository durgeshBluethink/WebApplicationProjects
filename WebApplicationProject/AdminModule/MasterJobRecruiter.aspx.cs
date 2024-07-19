using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace WebApplicationProject.AdminModule
{

    public partial class MasterJobRecruiter : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("data source=DURGESH\\SQLEXPRESS; initial catalog=JobPortal_5724;integrated security=true");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindJobRecruiter();
              
            }
        }

        public void BindJobRecruiter()
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("proc_JobRecruiter", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "JobRecruiterJoin");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            
            gvjobRecruiter.DataSource = dt;
            gvjobRecruiter.DataBind();
            
        }
    }
}