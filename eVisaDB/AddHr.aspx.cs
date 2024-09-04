using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace eVisaSystem
{
    public partial class AddHR : Page
    {
        
        private readonly string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["eVisaDBConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindHRList();
            }
        }

        protected void btnAddHR_Click(object sender, EventArgs e)
        {
            string firstName = txtFirstName.Text.Trim();
            string lastName = txtLastName.Text.Trim();
            string contact = txtContact.Text.Trim();
            string address = txtAddress.Text.Trim();
            DateTime joiningDate;

            if (string.IsNullOrWhiteSpace(firstName) || string.IsNullOrWhiteSpace(lastName) ||
                string.IsNullOrWhiteSpace(contact) || !DateTime.TryParse(txtJoiningDate.Text.Trim(), out joiningDate))
            {
                lblMessage.Text = "Please fill in all fields correctly.";
                return;
            }

            
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO HR (FirstName, LastName, Contact, Address, JoiningDate) " +
                               "VALUES (@FirstName, @LastName, @Contact, @Address, @JoiningDate)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@FirstName", firstName);
                    cmd.Parameters.AddWithValue("@LastName", lastName);
                    cmd.Parameters.AddWithValue("@Contact", contact);
                    cmd.Parameters.AddWithValue("@Address", address);
                    cmd.Parameters.AddWithValue("@JoiningDate", joiningDate);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }

            txtFirstName.Text = string.Empty;
            txtLastName.Text = string.Empty;
            txtContact.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtJoiningDate.Text = string.Empty;

            lblMessage.Text = "HR details added successfully.";

            
            BindHRList();
        }

        private void BindHRList()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT HRID, FirstName, LastName, Contact, Address, JoiningDate FROM HR";

                using (SqlDataAdapter da = new SqlDataAdapter(query, conn))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    gvHRList.DataSource = dt;
                    gvHRList.DataBind();
                }
            }
        }
    }
}
