<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Appointments.aspx.cs" Inherits="Hospital_patient.Appointments" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Appointments</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2 class="text-center mb-4">Manage Appointments</h2>
            <div class="card mb-4">
                <div class="card-body">
                    <h4 class="card-title">Create New Appointment</h4>
                    <div class="form-group">
                        <label for="txtDoctorName">Doctor Name</label>
                        <asp:TextBox ID="txtDoctorName" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDoctorName" runat="server" ControlToValidate="txtDoctorName" ErrorMessage="Doctor Name is required" CssClass="text-danger" />
                    </div>
                    <div class="form-group">
                        <label for="txtDate">Date</label>
                        <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDate" runat="server" ControlToValidate="txtDate" ErrorMessage="Date is required" CssClass="text-danger" />
                    </div>
                    <div class="form-group">
                        <label for="txtTime">Time</label>
                        <asp:TextBox ID="txtTime" runat="server" TextMode="Time" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTime" runat="server" ControlToValidate="txtTime" ErrorMessage="Time is required" CssClass="text-danger" />
                    </div>
                    <div class="form-group">
                        <label for="txtReason">Reason for Appointment</label>
                        <asp:TextBox ID="txtReason" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnSubmit" runat="server" Text="Book Appointment" CssClass="btn btn-primary btn-block" OnClick="btnSubmit_Click" />
                </div>
            </div>

            <h4 class="mb-4">Your Appointments</h4>
            <asp:GridView ID="gvAppointments" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" OnRowCommand="gvAppointments_RowCommand" DataKeyNames="AppointmentID">
                <Columns>
                <asp:BoundField DataField="AppointmentID" HeaderText="Appointment ID" />
                <asp:BoundField DataField="DoctorName" HeaderText="Doctor Name" />
                <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}" />
                <asp:BoundField DataField="Time" HeaderText="Time" />
                <asp:BoundField DataField="Reason" HeaderText="Reason" />
                <asp:ButtonField Text="Cancel" CommandName="CancelAppointment" ButtonType="Button" />
            </Columns>
            </asp:GridView>

        </div>
    </form>
</body>
</html>
