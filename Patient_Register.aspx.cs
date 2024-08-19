using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Hospital_patient
{
    public partial class Patient_Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Code for page load event (if needed)
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            DateTime dateOfBirth;
            int age;

            // Validate date format
            if (!DateTime.TryParse(txtDateOfBirth.Text, out dateOfBirth))
            {
                // Notify user of invalid date
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid date format.');", true);
                return;
            }

            // Calculate age
            age = DateTime.Now.Year - dateOfBirth.Year;
            if (dateOfBirth > DateTime.Now.AddYears(-age))
            {
                age--;
            }

            if (age < 0 || age > 120)
            {
                // Notify user of invalid age
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid age. Please enter a valid age between 0 and 120.');", true);
                return;
            }

            // Retrieve values from form controls
            string firstName = txtFirstName.Text.Trim();
            string lastName = txtLastName.Text.Trim();
            string gender = ddlGender.SelectedValue;
            string primaryContactNumber = txtPrimaryContactNumber.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim(); // Consider hashing the password
            string medicalConditions = txtMedicalConditions.Text.Trim();
            string allergies = txtAllergies.Text.Trim();
            string username = txtUsername.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim(); // Ensure you have a field for confirm password

            // Validate password and confirm password match
            if (password != confirmPassword)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Passwords do not match.');", true);
                return;
            }

            // Connection string should ideally be retrieved from a configuration file
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PatientConnectionStringName"].ConnectionString;

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open(); // Open the connection

                    string query = @"
                        INSERT INTO [dbo].[Patient_Data] 
                        ([FirstName], [LastName], [DateOfBirth], [Gender], [PrimaryContactNumber], [Email], [MedicalConditions], [Allergies], [Username], [Password],[ConfirmPassword],[Age])
                        VALUES
                        (@FirstName, @LastName, @DateOfBirth, @Gender, @PrimaryContactNumber, @Email, @MedicalConditions, @Allergies, @Username, @Password, @ConfirmPassword, @Age)";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        // Add parameters to prevent SQL injection
                        cmd.Parameters.AddWithValue("@FirstName", firstName);
                        cmd.Parameters.AddWithValue("@LastName", lastName);
                        cmd.Parameters.AddWithValue("@DateOfBirth", dateOfBirth);
                        
                        cmd.Parameters.AddWithValue("@Gender", gender);
                        cmd.Parameters.AddWithValue("@PrimaryContactNumber", primaryContactNumber);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@MedicalConditions", medicalConditions);
                        cmd.Parameters.AddWithValue("@Allergies", allergies);
                        cmd.Parameters.AddWithValue("@Username", username);
                        cmd.Parameters.AddWithValue("@Password", password); // Ideally, hash the password here
                        cmd.Parameters.AddWithValue("@ConfirmPassword", confirmPassword); // Ensure you have a field for confirm password
                        cmd.Parameters.AddWithValue("@Age", age);

                        cmd.ExecuteNonQuery(); // Execute the query
                    }
                }

                // Notify user of successful registration
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Patient Registered Successfully.');", true);
                Response.Redirect("Patient_login.aspx");
            }
            catch (Exception ex)
            {
                // Log the exception (you might want to log this to a file or monitoring system)
                // Show a user-friendly message
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('An error occurred while registering the patient. Please try again later.');", true);
            }
        }
    }
}
