<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResultReport.aspx.cs" Inherits="eVisaSystem.ResultReport" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Result Report</title>
    <style>
        body {
            background-image: url('https://static.vecteezy.com/system/resources/thumbnails/035/631/030/small_2x/abstract-white-planes-and-clouds-with-long-shadows-on-blue-background-illustration-travel-concept-vector.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            text-align: center; /* Center text alignment */
        }

        .container {
            display: inline-block;
            margin-top: 50px;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            width: 80%; /* Adjust the width as needed */
            max-width: 1200px; /* Optional: limit the maximum width */
        }

        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-group input[type="text"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 100%;
        }

        .form-group select {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 100%;
        }

        .btn-search {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            background-color: #007BFF;
            color: white;
            cursor: pointer;
            font-size: 14px;
        }

        .btn-search:hover {
            background-color: #0056b3;
        }

        .gridview {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            margin: 20px auto; 
        }

        .gridview th, .gridview td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        .gridview th {
            background-color: #007BFF;
            color: #fff;
            font-weight: bold;
        }

        .gridview tr:nth-child(even) {
            background-color: #f4f4f4;
        }

        .gridview tr:hover {
            background-color: #d1e7fd;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Search Interview Results</h2>
            <div class="form-group">
                <label for="ddlEmployeeName">Select Employee:</label>
                <asp:DropDownList ID="ddlEmployeeName" runat="server" AutoPostBack="true">
                    <asp:ListItem Text="-- Select Employee --" Value="" />
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn-search" OnClick="btnSearch_Click" />
            </div>
            <asp:GridView ID="gvResultReport" runat="server" AutoGenerateColumns="False" CssClass="gridview">
                <Columns>
                    <asp:BoundField DataField="InterviewID" HeaderText="Interview ID" />
                    <asp:BoundField DataField="EmployeeName" HeaderText="Employee Name" />
                    <asp:BoundField DataField="InterviewResult" HeaderText="Interview Result" />
                    <asp:BoundField DataField="Remarks" HeaderText="Remarks" />
                </Columns>
                <EmptyDataTemplate>
                    No results found.
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
