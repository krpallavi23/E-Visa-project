using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace eVisaSystem
{
    public partial class Feedback : System.Web.UI.Page
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
                string query = "SELECT EmployeeID, FirstName + ' ' + LastName AS FullName FROM Employee";

                try
                {
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);

                            ddlEmployee.DataSource = dt;
                            ddlEmployee.DataTextField = "FullName";
                            ddlEmployee.DataValueField = "EmployeeID";
                            ddlEmployee.DataBind();

                            ddlEmployee.Items.Insert(0, new ListItem("Select Employee", ""));
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Handle the exception
                    // You might want to display an error message to the user
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string employeeID = ddlEmployee.SelectedValue;
            string feedback = txtFeedback.Text.Trim();

            if (string.IsNullOrEmpty(employeeID))
            {
                // Handle the case where no employee is selected
                // You might want to display an error message to the user
                return;
            }

            if (string.IsNullOrEmpty(feedback))
            {
                // Handle the case where no feedback is entered
                // You might want to display an error message to the user
                return;
            }

            SubmitFeedback(employeeID, feedback);
        }

        private void SubmitFeedback(string employeeID, string feedback)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["eVisaDBConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Feedback (EmployeeID, FeedbackText) VALUES (@EmployeeID, @FeedbackText)";

                try
                {
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@EmployeeID", employeeID);
                        cmd.Parameters.AddWithValue("@FeedbackText", feedback);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();

                        // Optionally, clear the input fields or display a success message
                        ddlEmployee.ClearSelection();
                        txtFeedback.Text = "";
                    }
                }
                catch (Exception ex)
                {
                    // Handle the exception
                    // You might want to display an error message to the user
                }
            }
        }
    }
}
