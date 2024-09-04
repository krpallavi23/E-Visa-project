using System;
using System.Web.UI;

namespace eVisaSystem
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the user is authenticated
            if (Session["Username"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadDashboardData();
            }
        }

        private void LoadDashboardData()
        {
            // Load user-specific data
            string username = Session["Username"].ToString();
            // Example: lblWelcome.Text = $"Welcome, {username}!";
        }


        protected void btnAddHR_Click(object sender, EventArgs e)
        {
            Server.Transfer("AddHR.aspx");
        }

        protected void btnManageHR_Click(object sender, EventArgs e)
        {
            Server.Transfer("ManageHR.aspx");
        }

        protected void btnAddEmployee_Click(object sender, EventArgs e)
        {
            Server.Transfer("AddEmployee.aspx");
        }

        protected void btnManageEmployee_Click(object sender, EventArgs e)
        {
            Server.Transfer("ManageEmployee.aspx");
        }

        protected void btnVisaStatus_Click(object sender, EventArgs e)
        {
            Server.Transfer("VisaStatus.aspx");
        }

        protected void btnApplicantReport_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ApplicantReport.aspx");


        }

        protected void btnInterviewReport_Click(object sender, EventArgs e)
        {
            Server.Transfer("InterviewReport.aspx");
        }

        protected void btnResultReport_Click(object sender, EventArgs e)
        {
            Server.Transfer("ResultReport.aspx");
        }

        protected void btnOnsiteReport_Click(object sender, EventArgs e)
        {
            Server.Transfer("OnsiteReport.aspx");
        }

        protected void btnFeedback_Click(object sender, EventArgs e)
        {
            Server.Transfer("Feedback.aspx");
        }
    }
}
