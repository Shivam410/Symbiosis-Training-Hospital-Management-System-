using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Hospital_patient
{
    public partial class MedicalRecords : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMedicalRecords();
            }
        }

        protected void btnAddRecord_Click(object sender, EventArgs e)
        {
            string recordType = txtRecordType.Text.Trim();
            string recordDetails = txtRecordDetails.Text.Trim();
            int patientID = GetPatientID(); // You need to implement GetPatientID() based on your session or context
            DateTime createdDate = DateTime.Now;

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PatientConnectionStringName"].ConnectionString;

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    string query = "INSERT INTO MedicalRecords (PatientID, RecordType, RecordDetails, CreatedDate) VALUES (@PatientID, @RecordType, @RecordDetails, @CreatedDate)";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@PatientID", patientID);
                        cmd.Parameters.AddWithValue("@RecordType", recordType);
                        cmd.Parameters.AddWithValue("@RecordDetails", recordDetails);
                        cmd.Parameters.AddWithValue("@CreatedDate", createdDate);

                        cmd.ExecuteNonQuery();
                    }
                }

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Record added successfully.');", true);
                LoadMedicalRecords(); // Refresh the medical records list
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('An error occurred: {ex.Message}');", true);
            }
        }

        private void LoadMedicalRecords()
        {
            int patientID = GetPatientID(); // You need to implement GetPatientID() based on your session or context
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PatientConnectionStringName"].ConnectionString;

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    string query = "SELECT RecordID, RecordType, RecordDetails, CreatedDate FROM MedicalRecords WHERE PatientID = @PatientID";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@PatientID", patientID);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            gvMedicalRecords.DataSource = reader;
                            gvMedicalRecords.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('An error occurred: {ex.Message}');", true);
            }
        }

        protected void gvMedicalRecords_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteRecord")
            {
                try
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    int recordID = Convert.ToInt32(gvMedicalRecords.DataKeys[index].Value);

                    string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PatientConnectionStringName"].ConnectionString;

                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        conn.Open();

                        string query = "DELETE FROM MedicalRecords WHERE RecordID = @RecordID";

                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@RecordID", recordID);
                            cmd.ExecuteNonQuery();
                        }
                    }

                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Record deleted successfully.');", true);
                    LoadMedicalRecords(); // Refresh the medical records list
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
