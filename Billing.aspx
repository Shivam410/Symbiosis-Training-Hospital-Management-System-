<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Billing.aspx.cs" Inherits="Hospital_patient.Billing" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Billing and Payment</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <form id="formBilling" runat="server">
        <div class="container mt-5">
            <h2 class="text-center mb-4">Billing and Payment</h2>
            <div class="card mb-4">
                <div class="card-body">
                    <h4 class="card-title">Add New Bill</h4>
                    <div class="form-group">
                        <label for="txtAmount">Amount</label>
                        <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvAmount" runat="server" ControlToValidate="txtAmount" ErrorMessage="Amount is required" CssClass="text-danger" />
                        <asp:RangeValidator ID="rvAmount" runat="server" ControlToValidate="txtAmount" MinimumValue="0.01" MaximumValue="100000" Type="Double" ErrorMessage="Amount must be between 0.01 and 100000" CssClass="text-danger" />
                    </div>
                    <div class="form-group">
                        <label for="txtPaymentStatus">Payment Status</label>
                        <asp:TextBox ID="txtPaymentStatus" runat="server" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="txtPaymentDate">Payment Date</label>
                        <asp:TextBox ID="txtPaymentDate" runat="server" TextMode="Date" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="txtServiceDescription">Service Description</label>
                        <asp:TextBox ID="txtServiceDescription" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" />
                    </div>
                    <asp:Button ID="btnSubmit" runat="server" Text="Add Bill" CssClass="btn btn-primary btn-block" OnClick="btnSubmit_Click" />
                </div>
            </div>

            <h4 class="mb-4">Billing History</h4>
            <asp:GridView ID="gvBilling" runat="server" AutoGenerateColumns="False" CssClass="table table-striped">
                <Columns>
                    <asp:BoundField DataField="BillID" HeaderText="Bill ID" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="PaymentStatus" HeaderText="Payment Status" />
                    <asp:BoundField DataField="PaymentDate" HeaderText="Payment Date" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="ServiceDescription" HeaderText="Service Description" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>



