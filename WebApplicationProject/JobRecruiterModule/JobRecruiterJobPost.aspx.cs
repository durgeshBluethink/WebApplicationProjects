using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationProject.JobRecruiterModule
{
    public partial class JobRecruiterJobPost : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("data source=DURGESH\\SQLEXPRESS; initial catalog=JobPortal_5724;integrated security=true");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindJobProfile();
            }
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

        protected void btnjobpost_Click(object sender, EventArgs e)
        {
            string qualifications = "";
            for (int i = 0; i < cblQualifications.Items.Count; i++)
            {
                if (cblQualifications.Items[i].Selected)
                {
                    qualifications += cblQualifications.Items[i].Text + ",";
                }
            }
            qualifications = qualifications.TrimEnd(',');

            using (SqlCommand cmd = new SqlCommand("proc_JobPost", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "INSERT");
                cmd.Parameters.AddWithValue("@JobRecruiterId", Session["JRID"]); // Ensure this session variable is set
                cmd.Parameters.AddWithValue("@JobPostJobProfileId", ddljobprofile.SelectedValue);
                cmd.Parameters.AddWithValue("@JobPostMode", rblworkingmode.SelectedValue);
                cmd.Parameters.AddWithValue("@JobPostGender", rblgender.SelectedValue);
                cmd.Parameters.AddWithValue("@JobPostQualifications", qualifications); // Use the correct variable
                cmd.Parameters.AddWithValue("@JobPostMinExp", txtminexp.Text);
                cmd.Parameters.AddWithValue("@JobPostmaxExp", txtmaxexp.Text);
                cmd.Parameters.AddWithValue("@JobPostMinSalary", txtminsalary.Text);
                cmd.Parameters.AddWithValue("@JobPostMaxSalary", txtmaxsalary.Text);
                cmd.Parameters.AddWithValue("@JobPostVacancy", txtvacancy.Text);
                cmd.Parameters.AddWithValue("@JobPostComments", txtcomments.Text);

                conn.Open();
                int rowsAffected = cmd.ExecuteNonQuery();
                conn.Close();

                if (rowsAffected > 0)
                {
                    lblMessage.Text = "Job post inserted successfully.";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblMessage.Text = "Error inserting job post.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}
