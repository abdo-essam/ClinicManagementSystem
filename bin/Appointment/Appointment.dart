
class Appointment {
  static int _idCounter = 0; // Static counter for unique IDs
  int appointmentId;
  int patientId;
  int doctorId;
  DateTime dateTime;
  AppointmentStatus status;

  Appointment(this.patientId, this.doctorId, this.dateTime, this.status): appointmentId = ++_idCounter { // Assigns ID and increments counter
  print("Appointment created with ID: $appointmentId");
}

  // Method to update the appointment status
  void updateStatus(AppointmentStatus newStatus) {
    status = newStatus;
    print('Appointment status updated to: ${status.name}');
  }

  void rescheduleAppointment(DateTime newDateTime) {
    dateTime = newDateTime;
  }

  void viewAppointmentDetails() {
    print('Appointment ID: $appointmentId, Patient ID: $patientId, Doctor ID: $doctorId, Date: $dateTime, Status: $status');
  }
}

// Enum for Appointment Status
enum AppointmentStatus {
  Scheduled,
  Completed,
  Cancelled,
}

