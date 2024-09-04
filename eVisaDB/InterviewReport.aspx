<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InterviewReport.aspx.cs" Inherits="eVisaSystem.InterviewReport" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Interview Report</title>
    <style>
        body {
            background-image: url('https://static.vecteezy.com/system/resources/thumbnails/035/631/030/small_2x/abstract-white-planes-and-clouds-with-long-shadows-on-blue-background-illustration-travel-concept-vector.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        .container {
            display: inline-block;
            margin-top: 50px;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            width: 90%;
            max-width: 1200px;
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

        .form-group {
            margin: 15px 0;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
        }

        .form-group input, .form-group select {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 100%;
        }

        .form-group button {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            background-color: #007BFF;
            color: white;
            cursor: pointer;
        }

        .form-group button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Interview Report</h2>

            <!-- Form for Adding/Updating Interview -->
            <div class="form-group">
                <asp:Label ID="lblEmployeeID" runat="server" Text="Employee ID:"></asp:Label>
                <asp:DropDownList ID="ddlEmployeeID" runat="server"></asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:Label ID="lblInterviewDate" runat="server" Text="Interview Date:"></asp:Label>
                <asp:TextBox ID="txtInterviewDate" runat="server" TextMode="Date"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblInterviewTime" runat="server" Text="Interview Time:"></asp:Label>
                <asp:TextBox ID="txtInterviewTime" runat="server" TextMode="Time"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblInterviewStatus" runat="server" Text="Interview Status:"></asp:Label>
                <asp:DropDownList ID="ddlInterviewStatus" runat="server">
                    <asp:ListItem Value="Scheduled">Scheduled</asp:ListItem>
                    <asp:ListItem Value="Completed">Completed</asp:ListItem>
                    <asp:ListItem Value="Cancelled">Cancelled</asp:ListItem>
                    <asp:ListItem Value="Postponed">Postponed</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:Label ID="lblRemarks" runat="server" Text="Remarks:"></asp:Label>
                <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" Rows="3"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="btnAddUpdateInterview" runat="server" Text="Add/Update Interview" OnClick="btnAddUpdateInterview_Click" />
            </div>

            <!-- GridView to Display Interviews -->
            <asp:GridView ID="gvInterviewReport" runat="server" AutoGenerateColumns="False" CssClass="gridview"
                OnRowEditing="gvInterviewReport_RowEditing"
                OnRowUpdating="gvInterviewReport_RowUpdating"
                OnRowCancelingEdit="gvInterviewReport_RowCancelingEdit">
                <Columns>
                    <asp:BoundField DataField="InterviewID" HeaderText="Interview ID" ReadOnly="True" />
                    <asp:BoundField DataField="EmployeeName" HeaderText="Employee Name" />
                    <asp:BoundField DataField="InterviewDate" HeaderText="Interview Date" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="InterviewTime" HeaderText="Interview Time" DataFormatString="{0:HH:mm:ss}" />
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label ID="lblInterviewStatus" runat="server" Text='<%# Bind("InterviewStatus") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlInterviewStatus" runat="server">
                                <asp:ListItem Value="Scheduled">Scheduled</asp:ListItem>
                                <asp:ListItem Value="Completed">Completed</asp:ListItem>
                                <asp:ListItem Value="Cancelled">Cancelled</asp:ListItem>
                                <asp:ListItem Value="Postponed">Postponed</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Remarks">
                        <ItemTemplate>
                            <asp:Label ID="lblRemarks" runat="server" Text='<%# Bind("Remarks") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtRemarks" runat="server" Text='<%# Bind("Remarks") %>' TextMode="MultiLine" Rows="3" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:Button ID="btnEdit" runat="server" CommandName="Edit" CommandArgument='<%# Container.DataItemIndex %>' Text="Edit" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Button ID="btnUpdate" runat="server" CommandName="Update" CommandArgument='<%# Container.DataItemIndex %>' Text="Update" />
                            <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    No interview records found.
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
