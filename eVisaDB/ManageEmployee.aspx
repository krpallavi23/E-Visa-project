<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageEmployee.aspx.cs" Inherits="eVisaSystem.ManageEmployee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Employees</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('https://static.vecteezy.com/system/resources/thumbnails/035/631/030/small_2x/abstract-white-planes-and-clouds-with-long-shadows-on-blue-background-illustration-travel-concept-vector.jpg');
            background-size: cover;
            background-position: center;
            margin: 0;
            padding: 0;
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

        .grid-view-container {
            margin-top: 20px;
        }

        .button-container {
            text-align: center;
            margin-top: 20px;
        }

        .submit-button {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .submit-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div class="container">
            <h2>Manage Employees</h2>

            <asp:GridView ID="gvEmployees" runat="server" AutoGenerateColumns="False"
                          OnRowEditing="gvEmployees_RowEditing"
                          OnRowUpdating="gvEmployees_RowUpdating"
                          OnRowCancelingEdit="gvEmployees_RowCancelingEdit"
                          OnRowDeleting="gvEmployees_RowDeleting"
                          DataKeyNames="EmployeeID" CssClass="grid-view-container">
                <Columns>
                    <asp:BoundField DataField="EmployeeID" HeaderText="Employee ID" ReadOnly="True" />
                    <asp:TemplateField HeaderText="First Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFirstName" runat="server" Text='<%# Bind("FirstName") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblFirstName" runat="server" Text='<%# Bind("FirstName") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Last Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtLastName" runat="server" Text='<%# Bind("LastName") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblLastName" runat="server" Text='<%# Bind("LastName") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Contact">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtContact" runat="server" Text='<%# Bind("Contact") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblContact" runat="server" Text='<%# Bind("Contact") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Address">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("Address") %>' TextMode="MultiLine" Rows="3" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblAddress" runat="server" Text='<%# Bind("Address") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Position">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlPosition" runat="server">
                                <asp:ListItem Text="Select Position" Value="" />
                                <asp:ListItem Text="Manager" Value="Manager" />
                                <asp:ListItem Text="Developer" Value="Developer" />
                                <asp:ListItem Text="Designer" Value="Designer" />
                                <asp:ListItem Text="Data Analyst" Value="Data Analyst" />
                                <asp:ListItem Text="Machine Learning Engineer" Value="Machine Learning Engineer" />
                                <asp:ListItem Text="Software Engineer" Value="Software Engineer" />
                                <asp:ListItem Text="Cloud Engineer" Value="Cloud Engineer" />
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblPosition" runat="server" Text='<%# Bind("Position") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Joining Date">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtJoiningDate" runat="server" Text='<%# Bind("JoiningDate", "{0:yyyy-MM-dd}") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblJoiningDate" runat="server" Text='<%# Bind("JoiningDate", "{0:yyyy-MM-dd}") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Gender">
                        <EditItemTemplate>
                            <asp:RadioButton ID="rbMale" runat="server" GroupName="Gender" Text="Male" />
                            <asp:RadioButton ID="rbFemale" runat="server" GroupName="Gender" Text="Female" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblGender" runat="server" Text='<%# Bind("Gender") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
                <EditRowStyle BackColor="#7CFC00" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
