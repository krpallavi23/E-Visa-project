<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="eVisaSystem.Feedback" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Feedback Page</title>
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
            width: 80%;
            max-width: 800px;
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

        .form-group select, .form-group textarea {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 100%;
        }

        .form-group textarea {
            height: 150px;
        }

        .btn-submit {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            background-color: #007BFF;
            color: white;
            cursor: pointer;
            font-size: 14px;
        }

        .btn-submit:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Submit Feedback</h2>
            <div class="form-group">
                <label for="ddlEmployee">Select Employee:</label>
                <asp:DropDownList ID="ddlEmployee" runat="server" />
            </div>
            <div class="form-group">
                <label for="txtFeedback">Feedback:</label>
                <asp:TextBox ID="txtFeedback" runat="server" TextMode="MultiLine" CssClass="form-control" />
            </div>
            <div class="form-group">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit Feedback" CssClass="btn-submit" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </form>
</body>
</html>
