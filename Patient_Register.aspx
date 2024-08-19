<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Patient_Register.aspx.cs" Inherits="Hospital_patient.Patient_Register" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Registration Form</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- Bootstrap CSS -->
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4">Patient Registration Form</h2>
        <form id="PatientForm" runat="server">
            <!-- Personal Information -->
            <h4>Personal Information</h4>
            <div class="form-group">
                <label for="txtFirstName">First Name</label>
                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First Name is required" CssClass="text-danger" />
            </div>
            <div class="form-group">
                <label for="txtLastName">Last Name</label>
                <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last Name is required" CssClass="text-danger" />
            </div>
            <div class="form-group">
                <label for="txtDateOfBirth">Date of Birth</label>
                <asp:TextBox ID="txtDateOfBirth" runat="server" TextMode="Date" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvDateOfBirth" runat="server" ControlToValidate="txtDateOfBirth" ErrorMessage="Date of Birth is required" CssClass="text-danger" />
            </div>
            <div class="form-group">
                <label for="txtAge">Age</label>
                <asp:TextBox ID="txtAge" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvAge" runat="server" ControlToValidate="txtAge" ErrorMessage="Age is required" CssClass="text-danger" />
                <asp:RangeValidator ID="rvAge" runat="server" ControlToValidate="txtAge" MinimumValue="0" MaximumValue="120" Type="Integer" ErrorMessage="Please enter a valid age between 0 and 120" CssClass="text-danger" />
            </div>
            <div class="form-group">
                <label for="ddlGender">Gender</label>
                <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select Gender" Value=""></asp:ListItem>
                    <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                    <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="ddlGender" InitialValue="" ErrorMessage="Gender is required" CssClass="text-danger" />
            </div>

            <!-- Contact Information -->
            <h4>Contact Information</h4>
            <div class="form-group">
                <label for="txtPrimaryContactNumber">Primary Contact Number</label>
                <asp:TextBox ID="txtPrimaryContactNumber" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvPrimaryContactNumber" runat="server" ControlToValidate="txtPrimaryContactNumber" ErrorMessage="Primary Contact Number is required" CssClass="text-danger" />
            </div>
            <div class="form-group">
                <label for="txtEmail">Email Address</label>
                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required" CssClass="text-danger" />
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" ErrorMessage="Invalid email format" CssClass="text-danger" />
            </div>

            <!-- Medical Information -->
            <h4>Medical Information</h4>
            <div class="form-group">
                <label for="txtMedicalConditions">Existing Medical Conditions</label>
                <asp:TextBox ID="txtMedicalConditions" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="txtAllergies">Allergies</label>
                <asp:TextBox ID="txtAllergies" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" />
            </div>

            <!-- Account Information -->
            <h4>Account Information</h4>
            <div class="form-group">
                <label for="txtUsername">Username</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername" ErrorMessage="Username is required" CssClass="text-danger" />
            </div>
            <div class="form-group">
                <label for="txtPassword">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required" CssClass="text-danger" />
                <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="txtPassword" ValidationExpression="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&]).{8,}" ErrorMessage="Password must be at least 8 characters long and include at least one uppercase letter, one lowercase letter, one number, and one special character (e.g., @, $, !, %, *, ?, &)" CssClass="text-danger" />
            </div>
            <div class="form-group">
                <label for="txtConfirmPassword">Confirm Password</label>
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="Confirm Password is required" CssClass="text-danger" />
                <asp:CompareValidator ID="cvPassword" runat="server" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" ErrorMessage="Passwords do not match" CssClass="text-danger" />
            </div>

            <!-- Form Submission -->
            <div class="form-group mt-4">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="Submit_Click" CssClass="btn btn-primary btn-block" />
            </div>

            <!-- Signup Redirect Link -->
            <div class="text-center mt-3">
                <span>Already registered?</span> 
                <asp:HyperLink ID="lnkLogin" runat="server" NavigateUrl="~/Patient_Login.aspx" CssClass="btn btn-link">Login Here</asp:HyperLink>
            </div>
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

