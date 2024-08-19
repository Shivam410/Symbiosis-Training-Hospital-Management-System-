using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Hospital_patient
{
    public partial class Billing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBillingData();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Retrieve form data
            decimal amount = Convert.ToDecimal(txtAmount.Text.Trim());
            string paymentStatus = txtPaymentStatus.Text.Trim();
            DateTime paymentDate = Convert.ToDateTime(txtPaymentDate.Text.Trim());
            string serviceDescription = txtServiceDescription.Text.Trim();

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PatientConnectionStringName"].ConnectionString;

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    string query = "INSERT INTO Billing (PatientID, Amount, PaymentStatus, PaymentDate, ServiceDescription) VALUES (@PatientID, @Amount, @PaymentStatus, @PaymentDate, @ServiceDescription)";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@PatientID", 1); // Replace with actual PatientID
                        cmd.Parameters.AddWithValue("@Amount", amount);
                        cmd.Parameters.AddWithValue("@PaymentStatus", paymentStatus);
                        cmd.Parameters.AddWithValue("@PaymentDate", paymentDate);
                        cmd.Parameters.AddWithValue("@ServiceDescription", serviceDescription);

                        cmd.ExecuteNonQuery();
                    }
                }

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Bill added successfully.');", true);
                LoadBillingData(); // Refresh the billing data
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('An error occurred: {ex.Message}');", true);
            }
        }

        private void LoadBillingData()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PatientConnectionStringName"].ConnectionString;

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    string query = "SELECT BillID, Amount, PaymentStatus, PaymentDate, ServiceDescription FROM Billing";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            gvBilling.DataSource = reader;
                            gvBilling.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('An error occurred: {ex.Message}');", true);
            }
        }
    }
}
