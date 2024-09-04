using System;

namespace eVisaSystem
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            Session.Clear();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text;

            if (AuthenticateUser(username, password))
            {
               
                Session["Username"] = username;

                
                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid username or password.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        private bool AuthenticateUser(string username, string password)
        {
            
            const string hardcodedUsername = "india";
            const string hardcodedPassword = "india1234";

            
            return username.Equals(hardcodedUsername, StringComparison.OrdinalIgnoreCase) &&
                   password.Equals(hardcodedPassword, StringComparison.Ordinal);
        }
    }
}
