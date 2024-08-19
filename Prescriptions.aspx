<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Prescriptions.aspx.cs" Inherits="Hospital_patient.Prescriptions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Prescriptions</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2 class="text-center mb-4">Manage Prescriptions</h2>

            <!-- Section to Add New Prescription -->
            <div class="card mb-4">
                <div class="card-body">
                    <h4 class="card-title">Add New Prescription</h4>
                    <div class="form-group">
                        <label for="txtDoctorID">Doctor ID</label>
                        <asp:TextBox ID="txtDoctorID" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDoctorID" runat="server" ControlToValidate="txtDoctorID" ErrorMessage="Doctor ID is required" CssClass="text-danger" />
                    </div>
                    <div class="form-group">
                        <label for="txtMedicineName">Medicine Name</label>
                        <asp:TextBox ID="txtMedicineName" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvMedicineName" runat="server" ControlToValidate="txtMedicineName" ErrorMessage="Medicine Name is required" CssClass="text-danger" />
                    </div>
                    <div class="form-group">
                        <label for="txtDosage">Dosage</label>
                        <asp:TextBox ID="txtDosage" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDosage" runat="server" ControlToValidate="txtDosage" ErrorMessage="Dosage is required" CssClass="text-danger" />
                    </div>
                    <div class="form-group">
                        <label for="txtStartDate">Start Date</label>
                        <asp:TextBox ID="txtStartDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" ControlToValidate="txtStartDate" ErrorMessage="Start Date is required" CssClass="text-danger" />
                    </div>
                    <div class="form-group">
                        <label for="txtEndDate">End Date</label>
                        <asp:TextBox ID="txtEndDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEndDate" runat="server" ControlToValidate="txtEndDate" ErrorMessage="End Date is required" CssClass="text-danger" />
                    </div>
                    <div class="form-group">
                        <label for="txtNotes">Notes</label>
                        <asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnAddPrescription" runat="server" Text="Add Prescription" CssClass="btn btn-primary btn-block" OnClick="btnAddPrescription_Click" />
                </div>
            </div>

            <!-- Section to Display Prescriptions -->
            <h4 class="mb-4">Your Prescriptions</h4>
            <asp:GridView ID="gvPrescriptions" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" OnRowCommand="gvPrescriptions_RowCommand" DataKeyNames="PrescriptionID">
                <Columns>
                    <asp:BoundField DataField="PrescriptionID" HeaderText="Prescription ID" />
                    <asp:BoundField DataField="DoctorID" HeaderText="Doctor ID" />
                    <asp:BoundField DataField="MedicineName" HeaderText="Medicine Name" />
                    <asp:BoundField DataField="Dosage" HeaderText="Dosage" />
                    <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="EndDate" HeaderText="End Date" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="Notes" HeaderText="Notes" />
                    <asp:ButtonField Text="Delete" CommandName="DeletePrescription" ButtonType="Button" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
