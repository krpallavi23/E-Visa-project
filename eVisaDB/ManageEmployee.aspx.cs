using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace eVisaSystem
{
    public partial class ManageEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindEmployeeData();
            }
        }

        private void BindEmployeeData()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["eVisaDBConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT EmployeeID, FirstName, LastName, Contact, Address, Position, JoiningDate, Gender FROM Employee";
                using (SqlDataAdapter sda = new SqlDataAdapter(query, conn))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    gvEmployees.DataSource = dt;
                    gvEmployees.DataBind();
                }
            }
        }

        protected void gvEmployees_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvEmployees.EditIndex = e.NewEditIndex;
            BindEmployeeData();
        }

        protected void gvEmployees_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                // Retrieve the EmployeeID
                string employeeID = gvEmployees.DataKeys[e.RowIndex].Value.ToString();

                // Get the updated values from the TextBox controls
                TextBox txtFirstName = gvEmployees.Rows[e.RowIndex].FindControl("txtFirstName") as TextBox;
                TextBox txtLastName = gvEmployees.Rows[e.RowIndex].FindControl("txtLastName") as TextBox;
                TextBox txtContact = gvEmployees.Rows[e.RowIndex].FindControl("txtContact") as TextBox;
                TextBox txtAddress = gvEmployees.Rows[e.RowIndex].FindControl("txtAddress") as TextBox;
                DropDownList ddlPosition = gvEmployees.Rows[e.RowIndex].FindControl("ddlPosition") as DropDownList;
                TextBox txtJoiningDate = gvEmployees.Rows[e.RowIndex].FindControl("txtJoiningDate") as TextBox;
                RadioButton rbMale = gvEmployees.Rows[e.RowIndex].FindControl("rbMale") as RadioButton;
                RadioButton rbFemale = gvEmployees.Rows[e.RowIndex].FindControl("rbFemale") as RadioButton;

                if (txtFirstName == null || txtLastName == null || txtContact == null || txtAddress == null ||
                    ddlPosition == null || txtJoiningDate == null || rbMale == null || rbFemale == null)
                {
                    // Handle the error case where controls are not found
                    throw new Exception("One or more controls could not be found in the GridView.");
                }

                string firstName = txtFirstName.Text;
                string lastName = txtLastName.Text;
                string contact = txtContact.Text;
                string address = txtAddress.Text;
                string position = ddlPosition.SelectedValue;
                string joiningDate = txtJoiningDate.Text;
                string gender = rbMale.Checked ? "M" : "F";

                string connectionString = ConfigurationManager.ConnectionStrings["eVisaDBConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "UPDATE Employee SET FirstName = @FirstName, LastName = @LastName, Contact = @Contact, Address = @Address, Position = @Position, JoiningDate = @JoiningDate, Gender = @Gender WHERE EmployeeID = @EmployeeID";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@EmployeeID", employeeID);
                        cmd.Parameters.AddWithValue("@FirstName", firstName);
                        cmd.Parameters.AddWithValue("@LastName", lastName);
                        cmd.Parameters.AddWithValue("@Contact", contact);
                        cmd.Parameters.AddWithValue("@Address", address);
                        cmd.Parameters.AddWithValue("@Position", position);
                        cmd.Parameters.AddWithValue("@JoiningDate", DateTime.Parse(joiningDate)); // Ensure proper format
                        cmd.Parameters.AddWithValue("@Gender", gender);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                gvEmployees.EditIndex = -1;
                BindEmployeeData();
            }
            catch (Exception ex)
            {
                // Log the error (ex) and/or show a friendly message
                // For example: Response.Write("Error: " + ex.Message);
                throw; // Or handle the error as appropriate
            }
        }

        protected void gvEmployees_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvEmployees.EditIndex = -1;
            BindEmployeeData();
        }

        protected void gvEmployees_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string employeeID = gvEmployees.DataKeys[e.RowIndex].Value.ToString();

                string connectionString = ConfigurationManager.ConnectionStrings["eVisaDBConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "DELETE FROM Employee WHERE EmployeeID = @EmployeeID";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@EmployeeID", employeeID);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                BindEmployeeData();
            }
            catch (Exception ex)
            {
                // Log the error (ex) and/or show a friendly message
                // For example: Response.Write("Error: " + ex.Message);
                throw; // Or handle the error as appropriate
            }
        }
    }
}
