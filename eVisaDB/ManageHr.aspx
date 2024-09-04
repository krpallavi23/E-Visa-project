<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageHR.aspx.cs" Inherits="eVisaSystem.ManageHR" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage HR</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('https://media.istockphoto.com/id/1194295234/vector/seamless-pattern-airplanes-routes.jpg?s=612x612&w=0&k=20&c=YleQXKb6Xt8jtgPFewemoE0Zu5tLXVkYPLoUUtDFBZk=');
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
            max-width: 1200px;
            margin: 20px auto;
            background: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            margin: 0 auto;
        }

        .table th, .table td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        .table th {
            background-color: #007bff;
            color: white;
        }

        .table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .table tr:hover {
            background-color: #ddd;
        }

        .text-box {
            width: 100%;
            padding: 8px;
            margin-bottom: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .action-button {
            display: inline-block;
            margin: 0 5px;
            padding: 8px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
            font-size: 14px;
            color: #fff;
        }

        .edit-button {
            background-color: #28a745;
        }

        .edit-button:hover {
            background-color: #218838;
            transform: scale(1.05);
        }

        .delete-button {
            background-color: #dc3545;
        }

        .delete-button:hover {
            background-color: #c82333;
            transform: scale(1.05);
        }

        .button-container {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Manage HR</h2>
            <asp:GridView ID="gvHR" runat="server" AutoGenerateColumns="False" CssClass="table" 
                DataKeyNames="HRID"
                OnRowEditing="gvHR_RowEditing" 
                OnRowUpdating="gvHR_RowUpdating" 
                OnRowCancelingEdit="gvHR_RowCancelingEdit" 
                OnRowDeleting="gvHR_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="HRID" HeaderText="HR ID" ReadOnly="True" />
                    <asp:TemplateField HeaderText="First Name">
                        <ItemTemplate>
                            <asp:Label ID="lblFirstName" runat="server" Text='<%# Bind("FirstName") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFirstName" runat="server" CssClass="text-box" Text='<%# Bind("FirstName") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Last Name">
                        <ItemTemplate>
                            <asp:Label ID="lblLastName" runat="server" Text='<%# Bind("LastName") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtLastName" runat="server" CssClass="text-box" Text='<%# Bind("LastName") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Contact">
                        <ItemTemplate>
                            <asp:Label ID="lblContact" runat="server" Text='<%# Bind("Contact") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtContact" runat="server" CssClass="text-box" Text='<%# Bind("Contact") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Address">
                        <ItemTemplate>
                            <asp:Label ID="lblAddress" runat="server" Text='<%# Bind("Address") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="text-box" Text='<%# Bind("Address") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Joining Date">
                        <ItemTemplate>
                            <asp:Label ID="lblJoiningDate" runat="server" Text='<%# Bind("JoiningDate", "{0:MM/dd/yyyy}") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtJoiningDate" runat="server" CssClass="text-box" Text='<%# Bind("JoiningDate", "{0:MM/dd/yyyy}") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
            <div class="button-container">
                
            </div>
        </div>
    </form>
</body>
</html>
