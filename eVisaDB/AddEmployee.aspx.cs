using System;
using System.Configuration; 
using System.Data.SqlClient;

namespace eVisaSystem
{
    public partial class AddEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            
            string firstName = txtFirstName.Text.Trim();
            string lastName = txtLastName.Text.Trim();
            string contact = txtContact.Text.Trim();
            string address = txtAddress.Text.Trim();
            string position = ddlPosition.SelectedValue;
            DateTime joiningDate;

            
            if (!DateTime.TryParse(txtJoiningDate.Text, out joiningDate))
            {
                
                Response.Write("Please enter a valid joining date.");
                return;
            }

            
            string gender = rbMale.Checked ? "M" : (rbFemale.Checked ? "F" : null);

            
            if (string.IsNullOrEmpty(firstName) || string.IsNullOrEmpty(lastName) ||
                string.IsNullOrEmpty(contact) || string.IsNullOrEmpty(position) ||
                joiningDate == DateTime.MinValue || gender == null)
            {
                Response.Write("Please fill in all required fields.");
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["eVisaDBConnectionString"].ConnectionString;
            string query = "INSERT INTO Employee (FirstName, LastName, Contact, Address, JoiningDate, Position, Gender) " +
                           "VALUES (@FirstName, @LastName, @Contact, @Address, @JoiningDate, @Position, @Gender)";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@FirstName", firstName);
                cmd.Parameters.AddWithValue("@LastName", lastName);
                cmd.Parameters.AddWithValue("@Contact", contact);
                cmd.Parameters.AddWithValue("@Address", (object)address ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@JoiningDate", joiningDate);
                cmd.Parameters.AddWithValue("@Position", position);
                cmd.Parameters.AddWithValue("@Gender", gender);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    
                    Response.Write("Employee added successfully.");
                }
                catch (Exception ex)
                {
                   
                    Response.Write("An error occurred: " + ex.Message);
                }
            }
        }
    }
}
