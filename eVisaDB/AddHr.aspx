<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddHR.aspx.cs" Inherits="eVisaSystem.AddHR" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add HR</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('https://i.pinimg.com/564x/33/d0/a8/33d0a824fa331f551e400368ac57f87e.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
        }

        .form-group input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .form-group input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            font-size: 16px;
        }

        .form-group input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .form-group .message {
            color: red;
            font-size: 14px;
        }

        .grid-view {
            margin-top: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Add HR</h1>
            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>
            <div class="form-group">
                <label for="txtFirstName">First Name:</label>
                <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtLastName">Last Name:</label>
                <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtContact">Contact:</label>
                <asp:TextBox ID="txtContact" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtAddress">Address:</label>
                <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtJoiningDate">Joining Date:</label>
                <asp:TextBox ID="txtJoiningDate" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="btnAddHR" runat="server" Text="Add HR" OnClick="btnAddHR_Click" />
            </div>
            <div class="grid-view">
                <asp:GridView ID="gvHRList" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="HRID" HeaderText="HR ID" ReadOnly="True" />
                        <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                        <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                        <asp:BoundField DataField="Contact" HeaderText="Contact" />
                        <asp:BoundField DataField="Address" HeaderText="Address" />
                        <asp:BoundField DataField="JoiningDate" HeaderText="Joining Date" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
