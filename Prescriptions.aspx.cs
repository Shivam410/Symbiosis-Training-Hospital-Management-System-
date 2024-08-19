using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Hospital_patient
{
    public partial class Prescriptions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPrescriptions();
            }
        }

        protected void btnAddPrescription_Click(object sender, EventArgs e)
        {
            string medicineName = txtMedicineName.Text.Trim();
            string dosage = txtDosage.Text.Trim();
            DateTime startDate = Convert.ToDateTime(txtStartDate.Text);
            DateTime endDate = Convert.ToDateTime(txtEndDate.Text);
            string notes = txtNotes.Text.Trim();
            int doctorID = Convert.ToInt32(txtDoctorID.Text.Trim());
            int patientID = GetPatientID(); // Implement this method to get the patient ID

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PatientConnectionStringName"].ConnectionString;

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    string query = "INSERT INTO Prescriptions (PatientID, DoctorID, MedicineName, Dosage, StartDate, EndDate, Notes) VALUES (@PatientID, @DoctorID, @MedicineName, @Dosage, @StartDate, @EndDate, @Notes)";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@PatientID", patientID);
                        cmd.Parameters.AddWithValue("@DoctorID", doctorID);
                        cmd.Parameters.AddWithValue("@MedicineName", medicineName);
                        cmd.Parameters.AddWithValue("@Dosage", dosage);
                        cmd.Parameters.AddWithValue("@StartDate", startDate);
                        cmd.Parameters.AddWithValue("@EndDate", endDate);
                        cmd.Parameters.AddWithValue("@Notes", notes);

                        cmd.ExecuteNonQuery();
                    }
                }

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Prescription added successfully.');", true);
                LoadPrescriptions(); // Refresh the prescriptions list
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('An error occurred: {ex.Message}');", true);
            }
        }

        private void LoadPrescriptions()
        {
            int patientID = GetPatientID(); // Implement this method to get the patient ID
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PatientConnectionStringName"].ConnectionString;

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    string query = "SELECT PrescriptionID, DoctorID, MedicineName, Dosage, StartDate, EndDate, Notes FROM Prescriptions WHERE PatientID = @PatientID";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@PatientID", patientID);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            gvPrescriptions.DataSource = reader;
                            gvPrescriptions.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('An error occurred: {ex.Message}');", true);
            }
        }

        protected void gvPrescriptions_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeletePrescription")
            {
                try
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    int prescriptionID = Convert.ToInt32(gvPrescriptions.DataKeys[index].Value);

                    string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PatientConnectionStringName"].ConnectionString;

                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        conn.Open();

                        string query = "DELETE FROM Prescriptions WHERE PrescriptionID = @PrescriptionID";

                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@PrescriptionID", prescriptionID);
                            cmd.ExecuteNonQuery();
                        }
                    }

                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Prescription deleted successfully.');", true);
                    LoadPrescriptions(); // Refresh the prescriptions list
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('An error occurred: {ex.Message}');", true);
                }
            }
        }

        private int GetPatientID()
        {
            // Implement logic to retrieve the patient ID. This could be from the session, query string, etc.
            // For example:
            return Convert.ToInt32(Session["PatientID"]);
        }
    }
}
