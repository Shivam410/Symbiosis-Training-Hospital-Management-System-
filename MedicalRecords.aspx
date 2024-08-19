<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MedicalRecords.aspx.cs" Inherits="Hospital_patient.MedicalRecords" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Medical Records</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2 class="text-center mb-4">Manage Medical Records</h2>
            
            <!-- Section to Add New Medical Record -->
            <div class="card mb-4">
                <div class="card-body">
                    <h4 class="card-title">Add New Medical Record</h4>
                    <div class="form-group">
                        <label for="txtRecordType">Record Type</label>
                        <asp:TextBox ID="txtRecordType" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvRecordType" runat="server" ControlToValidate="txtRecordType" ErrorMessage="Record Type is required" CssClass="text-danger" />
                    </div>
                    <div class="form-group">
                        <label for="txtRecordDetails">Record Details</label>
                        <asp:TextBox ID="txtRecordDetails" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvRecordDetails" runat="server" ControlToValidate="txtRecordDetails" ErrorMessage="Record Details are required" CssClass="text-danger" />
                    </div>
                    <asp:Button ID="btnAddRecord" runat="server" Text="Add Record" CssClass="btn btn-primary btn-block" OnClick="btnAddRecord_Click" />
                </div>
            </div>

            <!-- Section to Display Medical Records -->
            <h4 class="mb-4">Your Medical Records</h4>
            <asp:GridView ID="gvMedicalRecords" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" OnRowCommand="gvMedicalRecords_RowCommand" DataKeyNames="RecordID">
                <Columns>
                    <asp:BoundField DataField="RecordID" HeaderText="Record ID" />
                    <asp:BoundField DataField="RecordType" HeaderText="Record Type" />
                    <asp:BoundField DataField="RecordDetails" HeaderText="Record Details" />
                    <asp:BoundField DataField="CreatedDate" HeaderText="Created Date" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:ButtonField Text="Delete" CommandName="DeleteRecord" ButtonType="Button" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>

