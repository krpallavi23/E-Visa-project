using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace eVisaSystem
{
    public partial class OnsiteReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindEmployeeDetails();
            }
        }

        private void BindEmployeeDetails()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["eVisaDBConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT 
                        EmployeeID, 
                        FirstName, 
                        LastName, 
                        Contact, 
                        Address, 
                        JoiningDate, 
                        Position, 
                        Gender
                    FROM 
                        Employee
                    ORDER BY 
                        JoiningDate";

                try
                {
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);

                            if (dt.Rows.Count > 0)
                            {
                                gvEmployeeDetails.DataSource = dt;
                                gvEmployeeDetails.DataBind();
                            }
                            else
                            {
                                gvEmployeeDetails.EmptyDataText = "No employee details available.";
                                gvEmployeeDetails.DataBind();
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Log the exception or display an error message
                    gvEmployeeDetails.EmptyDataText = $"Error: {ex.Message}";
                    gvEmployeeDetails.DataBind();
                }
            }
        }
    }
}
