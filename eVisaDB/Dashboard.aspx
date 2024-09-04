<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="eVisaSystem.Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-image: url('https://i.pinimg.com/564x/33/d0/a8/33d0a824fa331f551e400368ac57f87e.jpg'); /* E-visa related background image */
            background-size: cover;
            background-position: center;
            background-attachment: fixed; /* Ensures background image stays in place */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
        }

        .dashboard-container {
            width: 90%;
            max-width: 1200px;
            margin: auto;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            background-color: rgba(255, 255, 255, 0.8); /* Light background with transparency for buttons */
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            position: relative;
        }

        .dashboard-button {
            background-color: #2c3e50; /* Dark shade button color */
            color: #fff;
            border: none;
            border-radius: 8px;
            padding: 15px;
            margin: 5px;
            width: 150px;
            height: 120px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .dashboard-button:hover {
            background-color: #34495e; /* Slightly lighter shade for hover effect */
        }

        .dashboard-button img {
            max-width: 40px;
            margin-bottom: 8px;
        }

        .dashboard-button span {
            font-size: 14px;
            font-weight: bold;
        }

        .dashboard-button p {
            font-size: 12px;
        }

        .background-image {
            position: absolute;
            bottom: 10px;
            left: 50%;
            transform: translateX(-50%);
            max-width: 300px;
            width: 100%;
            opacity: 0.6;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard-container">
            <div class="dashboard-button" onclick="window.location.href='AddHR.aspx';">
                <img src="https://img.icons8.com/ios-filled/50/ffffff/user-group-man-man.png" alt="Add HR Icon"/>
                <span>Add HR</span>
                <p>Register new HR with login credentials.</p>
            </div>
            <div class="dashboard-button" onclick="window.location.href='ManageHR.aspx';">
                &nbsp;<span>Manage HR</span>
                <p>View, Edit, or Delete HR details.</p>
            </div>
            <div class="dashboard-button" onclick="window.location.href='AddEmployee.aspx';">
                <img src="https://img.icons8.com/ios-filled/50/ffffff/add-user-male.png" alt="Add Employee Icon"/>
                <span>Add Employee</span>
                <p>Add new employees and generate login credentials.</p>
            </div>
            <div class="dashboard-button" onclick="window.location.href='ManageEmployee.aspx';">
                <img src="https://img.icons8.com/ios-filled/50/ffffff/edit-user-male.png" alt="Manage Employee Icon"/>
                <span>Manage Employee</span>
                <p>View, Edit, or Delete employee details.</p>
            </div>
            <div class="dashboard-button" onclick="window.location.href='VisaStatus.aspx';">
                <img src="https://img.icons8.com/ios-filled/50/ffffff/visa.png" alt="Visa Status Icon"/>
                <span>Visa Status</span>
                <p>View and renew visa status.</p>
            </div>
            <div class="dashboard-button" onclick="window.location.href='ApplicantReport.aspx';">
                &nbsp;<span>Applicant Report</span>
                <p>Search and view applicant reports.</p>
            </div>
            <div class="dashboard-button" onclick="window.location.href='InterviewReport.aspx';">
                <img src="https://img.icons8.com/ios-filled/50/ffffff/interview.png" alt="Interview Report Icon"/>
                <span>Interview Report</span>
                <p>View interview reports and their status.</p>
            </div>
            <div class="dashboard-button" onclick="window.location.href='ResultReport.aspx';">
                &nbsp;<span>Result Report</span>
                <p>View final result reports of candidates.</p>
            </div>
            <div class="dashboard-button" onclick="window.location.href='OnsiteReport.aspx';">
                &nbsp;<span>Onsite Report</span>
                <p>View onsite report details entered by employees.</p>
            </div>
            <div class="dashboard-button" onclick="window.location.href='Feedback.aspx';">
                <img src="https://img.icons8.com/ios-filled/50/ffffff/feedback.png" alt="Feedback Icon"/>
                <span>Feedback</span>
                <p>View and manage feedback from employees and HR.</p>
            </div>
            &nbsp;</div>
    </form>
</body>
</html>
