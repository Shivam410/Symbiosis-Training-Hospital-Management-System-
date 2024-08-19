using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Hospital_patient
{
    public partial class Appointments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAppointments();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string doctorName = txtDoctorName.Text.Trim();
            DateTime date = Convert.ToDateTime(txtDate.Text);
            TimeSpan time = TimeSpan.Parse(txtTime.Text);
            string reason = txtReason.Text.Trim();

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PatientConnectionStringName"].ConnectionString;

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    string query = "INSERT INTO Appointments (DoctorName, Date, Time, Reason) VALUES (@DoctorName, @Date, @Time, @Reason)";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@DoctorName", doctorName);
                        cmd.Parameters.AddWithValue("@Date", date);
                        cmd.Parameters.AddWithValue("@Time", time);
                        cmd.Parameters.AddWithValue("@Reason", reason);

                        cmd.ExecuteNonQuery();
                    }
                }

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Appointment booked successfully.');", true);
                LoadAppointments(); // Refresh the appointments list
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('An error occurred: {ex.Message}');", true);
            }
        }

        private void LoadAppointments()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PatientConnectionStringName"].ConnectionString;

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    string query = "SELECT AppointmentID, DoctorName, Date, Time, Reason FROM Appointments";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            gvAppointments.DataSource = reader;
                            gvAppointments.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('An error occurred: {ex.Message}');", true);
            }
        }

        protected void gvAppointments_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "CancelAppointment")
            {
                try
                {
                    // Get the index of the row that raised the command
                    int index = Convert.ToInt32(e.CommandArgument);

                    // Retrieve the AppointmentID from the DataKeys
                    int appointmentID = Convert.ToInt32(gvAppointments.DataKeys[index].Value);

                    string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PatientConnectionStringName"].ConnectionString;

                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        conn.Open();

                        string query = "DELETE FROM Appointments WHERE AppointmentID = @AppointmentID";

                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@AppointmentID", appointmentID);
                            cmd.ExecuteNonQuery();
                        }
                    }

                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Appointment canceled successfully.');", true);
                    LoadAppointments(); // Refresh the appointments list
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('An error occurred: {ex.Message}');", true);
                }
            }
        }

    }
}
