using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace eVisaSystem
{
    public partial class ManageHR : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindHRData();
            }
        }

        private void BindHRData()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["eVisaDBConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT HRID, FirstName, LastName, Contact, Address, JoiningDate FROM HR";
                using (SqlDataAdapter sda = new SqlDataAdapter(query, conn))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    gvHR.DataSource = dt;
                    gvHR.DataBind();
                }
            }
        }

        protected void gvHR_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvHR.EditIndex = e.NewEditIndex;
            BindHRData();
        }

        protected void gvHR_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // Retrieve the HRID
            string hrId = gvHR.DataKeys[e.RowIndex].Value.ToString();

            // Get the updated values from the TextBox controls
            string firstName = (gvHR.Rows[e.RowIndex].FindControl("txtFirstName") as TextBox).Text;
            string lastName = (gvHR.Rows[e.RowIndex].FindControl("txtLastName") as TextBox).Text;
            string contact = (gvHR.Rows[e.RowIndex].FindControl("txtContact") as TextBox).Text;
            string address = (gvHR.Rows[e.RowIndex].FindControl("txtAddress") as TextBox).Text;
            string joiningDate = (gvHR.Rows[e.RowIndex].FindControl("txtJoiningDate") as TextBox).Text;

            string connectionString = ConfigurationManager.ConnectionStrings["eVisaDBConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "UPDATE HR SET FirstName = @FirstName, LastName = @LastName, Contact = @Contact, Address = @Address, JoiningDate = @JoiningDate WHERE HRID = @HRID";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@HRID", hrId);
                    cmd.Parameters.AddWithValue("@FirstName", firstName);
                    cmd.Parameters.AddWithValue("@LastName", lastName);
                    cmd.Parameters.AddWithValue("@Contact", contact);
                    cmd.Parameters.AddWithValue("@Address", address);
                    cmd.Parameters.AddWithValue("@JoiningDate", DateTime.Parse(joiningDate)); // Ensure proper format

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            gvHR.EditIndex = -1;
            BindHRData();
        }

        protected void gvHR_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvHR.EditIndex = -1;
            BindHRData();
        }

        protected void gvHR_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string hrId = gvHR.DataKeys[e.RowIndex].Value.ToString();

            string connectionString = ConfigurationManager.ConnectionStrings["eVisaDBConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM HR WHERE HRID = @HRID";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@HRID", hrId);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            BindHRData();
        }
    }
}
