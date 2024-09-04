using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace eVisaSystem
{
    public partial class ResultReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadEmployeeNames();
            }
        }

        private void LoadEmployeeNames()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["eVisaDBConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT EmployeeID, FirstName + ' ' + LastName AS FullName FROM Employee ORDER BY FullName";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    try
                    {
                        conn.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        ddlEmployeeName.DataSource = reader;
                        ddlEmployeeName.DataTextField = "FullName";
                        ddlEmployeeName.DataValueField = "EmployeeID";
                        ddlEmployeeName.DataBind();
                        ddlEmployeeName.Items.Insert(0, new ListItem("-- Select Employee --", ""));
                    }
                    catch (Exception ex)
                    {
                        // Handle exceptions
                        // For example, log error or show a message
                    }
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string selectedEmployeeID = ddlEmployeeName.SelectedValue;
            BindResultData(selectedEmployeeID);
        }

        private void BindResultData(string employeeID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["eVisaDBConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT 
                        i.InterviewID, 
                        e.FirstName + ' ' + e.LastName AS EmployeeName, 
                        i.InterviewStatus AS InterviewResult, 
                        i.Remarks
                    FROM 
                        Interview i
                    INNER JOIN 
                        Employee e ON i.EmployeeID = e.EmployeeID
                    WHERE
                        (@EmployeeID = '' OR i.EmployeeID = @EmployeeID)
                    ORDER BY 
                        i.InterviewID";

                try
                {
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@EmployeeID", employeeID);

                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);

                            if (dt.Rows.Count > 0)
                            {
                                gvResultReport.DataSource = dt;
                                gvResultReport.DataBind();
                            }
                            else
                            {
                                gvResultReport.EmptyDataText = "No results found.";
                                gvResultReport.DataBind();
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Log the exception or display an error message
                    gvResultReport.EmptyDataText = $"Error: {ex.Message}";
                    gvResultReport.DataBind();
                }
            }
        }
    }
}
