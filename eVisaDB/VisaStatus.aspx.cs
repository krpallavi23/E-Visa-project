using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace eVisaSystem
{
    public partial class VisaStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindVisaStatusData();
            }
        }

        private void BindVisaStatusData()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["eVisaDBConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT 
                        vs.VisaID, 
                        e.FirstName + ' ' + e.LastName AS EmployeeName, 
                        vs.VisaType, 
                        vs.VisaStatus, 
                        vs.ExpiryDate, 
                        vs.RenewalReason
                    FROM 
                        VisaStatus vs
                    INNER JOIN 
                        Employee e ON vs.EmployeeID = e.EmployeeID
                    ORDER BY 
                        vs.ExpiryDate";

                try
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(query, conn))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            gvVisaStatus.DataSource = dt;
                            gvVisaStatus.DataBind();
                        }
                        else
                        {
                            gvVisaStatus.EmptyDataText = "No visa status information available.";
                            gvVisaStatus.DataBind();
                        }
                    }
                }
                catch (Exception ex)
                {
                    gvVisaStatus.EmptyDataText = $"Error: {ex.Message}";
                    gvVisaStatus.DataBind();
                }
            }
        }

        protected void gvVisaStatus_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvVisaStatus.EditIndex = e.NewEditIndex;
            BindVisaStatusData();
        }

        protected void gvVisaStatus_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                int visaID = Convert.ToInt32(gvVisaStatus.DataKeys[e.RowIndex].Value);
                string renewalReason = (gvVisaStatus.Rows[e.RowIndex].FindControl("txtRenewalReason") as TextBox)?.Text;
                string visaType = (gvVisaStatus.Rows[e.RowIndex].FindControl("ddlVisaType") as DropDownList)?.SelectedValue;
                string visaStatus = (gvVisaStatus.Rows[e.RowIndex].FindControl("ddlVisaStatus") as DropDownList)?.SelectedValue;

                if (string.IsNullOrEmpty(visaType))
                {
                    visaType = "Tourist"; // Default value
                }

                if (string.IsNullOrEmpty(visaStatus))
                {
                    visaStatus = "Pending"; // Default value
                }

                string connectionString = ConfigurationManager.ConnectionStrings["eVisaDBConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "UPDATE VisaStatus SET VisaType = @VisaType, VisaStatus = @VisaStatus, RenewalReason = @RenewalReason WHERE VisaID = @VisaID";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@VisaID", visaID);
                        cmd.Parameters.AddWithValue("@VisaType", visaType);
                        cmd.Parameters.AddWithValue("@VisaStatus", visaStatus);
                        cmd.Parameters.AddWithValue("@RenewalReason", renewalReason);

                        conn.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected == 0)
                        {
                            throw new Exception("No rows updated. Ensure the VisaID exists and is not modified by another user.");
                        }
                    }
                }

                gvVisaStatus.EditIndex = -1;
                BindVisaStatusData();
            }
            catch (Exception ex)
            {
                gvVisaStatus.EmptyDataText = $"Error: {ex.Message}";
                gvVisaStatus.DataBind();
            }
        }

        protected void gvVisaStatus_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvVisaStatus.EditIndex = -1;
            BindVisaStatusData();
        }
    }
}
