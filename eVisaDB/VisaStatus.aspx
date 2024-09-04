<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VisaStatus.aspx.cs" Inherits="eVisaSystem.VisaStatus" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Visa Status</title>
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

        form {
            padding: 20px;
        }

        .container {
            display: inline-block; /* Centering the GridView */
            margin-top: 50px; /* Space from top */
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent background */
            border-radius: 10px;
        }

        .gridview {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            margin: 0 auto; /* Center the table horizontally */
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

        .gridview input[type="text"],
        .gridview select {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 100%;
            box-sizing: border-box; /* Ensures padding is included in width */
        }

        .gridview button {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            background-color: #007BFF;
            color: white;
            cursor: pointer;
            font-size: 14px;
            margin: 2px;
        }

        .gridview button:hover {
            background-color: #0056b3;
        }

        .dropdown {
            background-color: #e9ecef; /* Light gray background for dropdown */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <asp:GridView ID="gvVisaStatus" runat="server" AutoGenerateColumns="False" DataKeyNames="VisaID" CssClass="gridview" OnRowEditing="gvVisaStatus_RowEditing" OnRowUpdating="gvVisaStatus_RowUpdating" OnRowCancelingEdit="gvVisaStatus_RowCancelingEdit">
                <Columns>
                    <asp:BoundField DataField="VisaID" HeaderText="Visa ID" ReadOnly="True" />
                    <asp:BoundField DataField="EmployeeName" HeaderText="Employee Name" />
                    <asp:TemplateField HeaderText="Visa Type">
                        <ItemTemplate>
                            <asp:Label ID="lblVisaType" runat="server" Text='<%# Bind("VisaType") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlVisaType" runat="server" CssClass="dropdown">
                                <asp:ListItem Value="Tourist">Tourist</asp:ListItem>
                                <asp:ListItem Value="Business">Business</asp:ListItem>
                                <asp:ListItem Value="Student">Student</asp:ListItem>
                                <asp:ListItem Value="Work">Work</asp:ListItem>
                                <asp:ListItem Value="Transit">Transit</asp:ListItem>
                                <asp:ListItem Value="Diplomatic">Diplomatic</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Visa Status">
                        <ItemTemplate>
                            <asp:Label ID="lblVisaStatus" runat="server" Text='<%# Bind("VisaStatus") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlVisaStatus" runat="server" CssClass="dropdown">
                                <asp:ListItem Value="Approved">Approved</asp:ListItem>
                                <asp:ListItem Value="Pending">Pending</asp:ListItem>
                                <asp:ListItem Value="Rejected">Rejected</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ExpiryDate" HeaderText="Expiry Date" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:TemplateField HeaderText="Renewal Reason">
                        <ItemTemplate>
                            <asp:Label ID="lblRenewalReason" runat="server" Text='<%# Bind("RenewalReason") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtRenewalReason" runat="server" Text='<%# Bind("RenewalReason") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" ShowCancelButton="True" />
                </Columns>
                <EmptyDataTemplate>
                    No visa status information available.
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
