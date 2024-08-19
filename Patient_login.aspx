<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Patient_login.aspx.cs" Inherits="Hospital_patient.Patient_login" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- Bootstrap CSS -->
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4">Patient Login</h2>
        <form id="LoginForm" runat="server">
            <div class="form-group">
                <label for="txtUsername">UsernameEmail</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername" ErrorMessage="Username is required" CssClass="text-danger" />
            </div>
            <div class="form-group">
                <label for="txtPassword">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required" CssClass="text-danger" />
            </div>
            <div class="form-group">
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="Login_Click" CssClass="btn btn-primary btn-block" />
            </div>
            <div class="text-center mt-3">
                <p>Don't have an account? <a href="Patient_Register.aspx">Register here</a></p>
            </div>
        </form>
    </div>
</body>
</html>
