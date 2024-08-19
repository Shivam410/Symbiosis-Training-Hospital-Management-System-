<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Hospital_patient.Dashboard" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css"> <!-- Bootstrap 5 CSS -->
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
        }

        .sidebar {
            height: 100vh;
            background-color: #343a40;
            padding-top: 20px;
            width: 250px; /* Set width for sidebar */
            position: fixed; /* Fix sidebar position */
        }

        .sidebar a {
            color: #ffffff;
            text-decoration: none;
            padding: 10px 20px;
            display: block;
            font-size: 1.1rem;
        }

        .sidebar a:hover {
            background-color: #495057;
        }

        .sidebar a.active {
            background-color: #007bff;
        }

        .main-content {
            margin-left: 250px;
            padding: 20px;
        }

        .card-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: #2c3e50;
        }

        .card {
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .card-body p {
            font-size: 1.1rem;
            color: #34495e;
        }

        .header-title {
            font-size: 2rem;
            font-weight: bold;
            color: #2980b9;
            margin-bottom: 1rem;
        }

        .badge-custom {
            background-color: #1abc9c;
            font-size: 1rem;
            padding: 0.5rem 1rem;
            border-radius: 5px;
        }

        .text-muted {
            font-size: 0.9rem;
        }

        .footer-text {
            font-size: 0.9rem;
            color: #95a5a6;
            text-align: center;
            margin-top: 2rem;
        }
    </style>
</head>

<body>
    <div class="d-flex">
        <!-- Sidebar -->
        <nav class="sidebar bg-dark">
            <a href="Dashboard.aspx" class="active">Dashboard</a>
            <a href="Appointments.aspx">Appointments</a>
            <a href="MedicalRecords.aspx">Medical Records</a>
            <a href="Prescriptions.aspx">Prescription History</a>
            <a href="Billing.aspx">Billing and Payment History</a>
            <a href="Logout.aspx" class="btn btn-danger">Logout</a>
        </nav>

        <!-- Main Content -->
        <div class="main-content">
            <div class="container">
                <h2 class="header-title text-center mb-4">Patient Dashboard</h2>
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex align-items-center mb-4">
                            <h4 class="card-title">Welcome, <asp:Label ID="lblFullName" runat="server" Text=""></asp:Label></h4>
                            <span class="badge badge-custom ms-3">Patient</span>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-6">
                                <p><strong>Date of Birth:</strong> <asp:Label ID="lblDateOfBirth" runat="server" Text=""></asp:Label></p>
                            </div>
                            <div class="col-md-6">
                                <p><strong>Age:</strong> <asp:Label ID="lblAge" runat="server" Text=""></asp:Label></p>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-6">
                                <p><strong>Gender:</strong> <asp:Label ID="lblGender" runat="server" Text=""></asp:Label></p>
                            </div>
                            <div class="col-md-6">
                                <p><strong>Contact Number:</strong> <asp:Label ID="lblContactNumber" runat="server" Text=""></asp:Label></p>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-6">
                                <p><strong>Email:</strong> <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label></p>
                            </div>
                            <div class="col-md-6">
                                <p><strong>Medical Conditions:</strong> <asp:Label ID="lblMedicalConditions" runat="server" Text=""></asp:Label></p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <p><strong>Allergies:</strong> <asp:Label ID="lblAllergies" runat="server" Text=""></asp:Label></p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="footer-text mt-4">
                    <p>&copy; 2024 Hospital Management System. All Rights Reserved.</p>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
