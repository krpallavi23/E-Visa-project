using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace eVisaSystem
{
    public partial class Applicant : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Page load logic here if needed
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string location = txtLocation.Text.Trim();

            BindApplicantData(name, location);
        }

        private void BindApplicantData(string name, string location)
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
                        Position
                    FROM 
                        Employee
                    WHERE
                        (@Name = '' OR FirstName LIKE '%' + @Name + '%' OR LastName LIKE '%' + @Name + '%') AND
                        (@Location = '' OR Address LIKE '%' + @Location + '%')
                    ORDER BY 
                        JoiningDate";

                try
                {
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Name", name);
                        cmd.Parameters.AddWithValue("@Location", location);

                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);

                            if (dt.Rows.Count > 0)
                            {
                                gvApplicants.DataSource = dt;
                                gvApplicants.DataBind();
                            }
                            else
                            {
                                gvApplicants.EmptyDataText = "No employees found.";
                                gvApplicants.DataBind();
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Log the exception or display an error message
                    gvApplicants.EmptyDataText = $"Error: {ex.Message}";
                    gvApplicants.DataBind();
                }
            }
        }
    }
}
