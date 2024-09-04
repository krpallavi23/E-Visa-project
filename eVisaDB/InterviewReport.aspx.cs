using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace eVisaSystem
{
    public partial class InterviewReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindInterviewData();
                BindEmployeeDropDown();
            }
        }

        private void BindInterviewData()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["eVisaDBConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT 
                        i.InterviewID, 
                        e.FirstName + ' ' + e.LastName AS EmployeeName, 
                        i.InterviewDate, 
                        i.InterviewTime, 
                        i.InterviewStatus, 
                        i.Remarks
                    FROM 
                        Interview i
                    INNER JOIN 
                        Employee e ON i.EmployeeID = e.EmployeeID
                    ORDER BY 
                        i.InterviewDate DESC, i.InterviewTime DESC";

                try
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(query, conn))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);

                        gvInterviewReport.DataSource = dt;
                        gvInterviewReport.DataBind();
                    }
                }
                catch (Exception ex)
                {
                    gvInterviewReport.EmptyDataText = $"Error: {ex.Message}";
                }
            }
        }

        private void BindEmployeeDropDown()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["eVisaDBConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT EmployeeID, FirstName + ' ' + LastName AS EmployeeName FROM Employee";

                try
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(query, conn))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);

                        ddlEmployeeID.DataSource = dt;
                        ddlEmployeeID.DataTextField = "EmployeeName";
                        ddlEmployeeID.DataValueField = "EmployeeID";
                        ddlEmployeeID.DataBind();
                    }
                }
                catch (Exception ex)
                {
                    // Handle exception
                }
            }
        }

        protected void btnAddUpdateInterview_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["eVisaDBConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
                    INSERT INTO Interview (EmployeeID, InterviewDate, InterviewTime, InterviewStatus, Remarks)
                    VALUES (@EmployeeID, @InterviewDate, @InterviewTime, @InterviewStatus, @Remarks)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@EmployeeID", ddlEmployeeID.SelectedValue);
                    cmd.Parameters.AddWithValue("@InterviewDate", txtInterviewDate.Text);
                    cmd.Parameters.AddWithValue("@InterviewTime", txtInterviewTime.Text);
                    cmd.Parameters.AddWithValue("@InterviewStatus", ddlInterviewStatus.SelectedValue);
                    cmd.Parameters.AddWithValue("@Remarks", txtRemarks.Text);

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        BindInterviewData();
                    }
                    catch (Exception ex)
                    {
                        // Handle exception
                    }
                }
            }
        }

        protected void gvInterviewReport_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvInterviewReport.EditIndex = e.NewEditIndex;
            BindInterviewData();
        }

        protected void gvInterviewReport_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string interviewID = gvInterviewReport.DataKeys[e.RowIndex].Value.ToString();
            GridViewRow row = gvInterviewReport.Rows[e.RowIndex];
            DropDownList ddlStatus = (DropDownList)row.FindControl("ddlInterviewStatus");
            TextBox txtRemarks = (TextBox)row.FindControl("txtRemarks");

            string connectionString = ConfigurationManager.ConnectionStrings["eVisaDBConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
                    UPDATE Interview
                    SET InterviewStatus = @InterviewStatus,
                        Remarks = @Remarks
                    WHERE InterviewID = @InterviewID";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@InterviewID", interviewID);
                    cmd.Parameters.AddWithValue("@InterviewStatus", ddlStatus.SelectedValue);
                    cmd.Parameters.AddWithValue("@Remarks", txtRemarks.Text);

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        gvInterviewReport.EditIndex = -1;
                        BindInterviewData();
                    }
                    catch (Exception ex)
                    {
                        
                    }
                }
            }
        }

        protected void gvInterviewReport_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvInterviewReport.EditIndex = -1;
            BindInterviewData();
        }
    }
}
