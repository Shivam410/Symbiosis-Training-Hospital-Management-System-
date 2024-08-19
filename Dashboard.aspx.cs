using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Hospital_patient
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve the logged-in username from session
                string username = Session["Username"] as string;

                if (string.IsNullOrEmpty(username))
                {
                    // If username is not in session, redirect to login page
                    Response.Redirect("Patient_login.aspx");
                }
                else
                {
                    // Load and display the patient details
                    LoadPatientDetails(username);
                }
            }
        }

        private void LoadPatientDetails(string username)
        {
            // Connection string should ideally be retrieved from a configuration file
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PatientConnectionStringName"].ConnectionString;

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    string query = @"
                    SELECT FirstName, LastName, DateOfBirth, Gender,Age, PrimaryContactNumber, Email, MedicalConditions, Allergies
                    FROM [dbo].[Patient_Data]
                    WHERE Username = @Username";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Username", username);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                // Bind the data to the labels on the page
                                lblFullName.Text = $"{reader["FirstName"]} {reader["LastName"]}";
                                lblDateOfBirth.Text = Convert.ToDateTime(reader["DateOfBirth"]).ToString("dd/MM/yyyy");
                                lblGender.Text = reader["Gender"].ToString();
                                lblAge.Text = reader["Age"].ToString(); // Calculate age based on DateOfBirth and current date

                                lblContactNumber.Text = reader["PrimaryContactNumber"].ToString();
                                lblEmail.Text = reader["Email"].ToString();
                                
                                lblMedicalConditions.Text = reader["MedicalConditions"].ToString();
                                lblAllergies.Text = reader["Allergies"].ToString();
                                

                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Log the exception and show a user-friendly message
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('An error occurred: {ex.Message}');", true);
            }
        }
    }
}
