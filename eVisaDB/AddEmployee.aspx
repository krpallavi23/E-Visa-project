<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddEmployee.aspx.cs" Inherits="eVisaSystem.AddEmployee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Employee</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('https://static.vecteezy.com/system/resources/thumbnails/035/631/030/small_2x/abstract-white-planes-and-clouds-with-long-shadows-on-blue-background-illustration-travel-concept-vector.jpg');
            background-size: cover;
            background-position: center;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            width: 90%;
            max-width: 1000px;
            margin: 20px auto;
            background: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        h2 {
            width: 100%;
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .form-row {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            flex: 1;
            min-width: 200px;
        }

        .form-group label {
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }

        .form-group input[type="text"],
        .form-group textarea,
        .form-group select,
        .form-group input[type="date"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
            font-size: 16px;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        .form-group input[type="text"]:focus,
        .form-group textarea:focus,
        .form-group select:focus,
        .form-group input[type="date"]:focus {
            border-color: #007bff;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.25);
            outline: none;
        }

        .form-group input[type="radio"] {
            width: auto;
            margin-right: 10px;
        }

        .form-group .gender-label {
            display: inline-block;
            margin-right: 20px;
        }

        .form-group .gender-container {
            margin-top: 5px;
        }

        .button-container {
            width: 100%;
            text-align: center;
            margin-top: 20px;
        }

        .submit-button {
            padding: 12px 25px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s, box-shadow 0.3s;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .submit-button:hover {
            background-color: #0056b3;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }

        /* Style adjustments for horizontal layout */
        .form-row {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .form-row .form-group {
            flex: 1;
            min-width: 200px;
        }

        .form-group .datepicker {
            width: calc(100% - 22px); /* Adjust width for datepicker */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Add the ScriptManager here -->
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        
        <div class="container">
            <h2>Add Employee</h2>
            <div class="form-row">
                <div class="form-group">
                    <label for="txtFirstName">First Name:</label>
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="enhanced-textbox" />
                </div>
                <div class="form-group">
                    <label for="txtLastName">Last Name:</label>
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="enhanced-textbox" />
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="txtContact">Contact:</label>
                    <asp:TextBox ID="txtContact" runat="server" CssClass="enhanced-textbox" />
                </div>
                <div class="form-group">
                    <label for="txtAddress">Address:</label>
                    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3" CssClass="enhanced-textbox" />
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="ddlPosition">Position:</label>
                    <asp:DropDownList ID="ddlPosition" runat="server" CssClass="enhanced-textbox">
                        <asp:ListItem Text="Select Position" Value="" />
                        <asp:ListItem Text="Manager" Value="Manager" />
                        <asp:ListItem Text="Developer" Value="Developer" />
                        <asp:ListItem Text="Designer" Value="Designer" />
                        <asp:ListItem Text="Data Analyst" Value="Data Analyst" />
                        <asp:ListItem Text="Machine Learning Engineer" Value="Machine Learning Engineer" />
                        <asp:ListItem Text="Software Engineer" Value="Software Engineer" />
                        <asp:ListItem Text="Cloud Engineer" Value="Cloud Engineer" />
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label for="txtJoiningDate">Joining Date:</label>
                    <asp:TextBox ID="txtJoiningDate" runat="server" CssClass="datepicker enhanced-textbox" />
                    <ajaxToolkit:CalendarExtender ID="calJoiningDate" runat="server" TargetControlID="txtJoiningDate" />
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label>Gender:</label>
                    <div class="gender-container">
                        <asp:RadioButton ID="rbMale" runat="server" GroupName="Gender" Text="Male" CssClass="gender-label" />
                        <asp:RadioButton ID="rbFemale" runat="server" GroupName="Gender" Text="Female" CssClass="gender-label" />
                    </div>
                </div>
            </div>
            <div class="button-container">
                <asp:Button ID="btnSubmit" runat="server" Text="Add Employee" CssClass="submit-button" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </form>
</body>
</html>
