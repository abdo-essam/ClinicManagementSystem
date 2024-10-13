import 'dart:io';
import '../Doctor/Doctor.dart';
import '../Patient/Patient.dart';
import '../Utils.dart';
import 'Appointment.dart';

class AppointmentUtils {
  static void manageAppointments(List<Appointment> appointments, List<Doctor> doctors, List<Patient> patients) {
    while (true) {
      Utils.clearConsole();
      print('\n----- Manage Appointments -----');
      print('1. Schedule Appointment');
      print('2. Reschedule Appointment');
      print('3. Cancel Appointment');
      print('4. Update Appointment Status');
      print('5. View Appointment Details');
      print('6. View All Appointments');
      print('7. Back to Main Menu');
      stdout.write('Enter your choice: ');
      String? input = stdin.readLineSync();
      int choice = int.tryParse(input ?? '0') ?? 0;

      switch (choice) {
        case 1:
        // Schedule a new appointment
          _scheduleAppointment(appointments, doctors, patients);
          break;

        case 2:
        // Reschedule an appointment
          _rescheduleAppointment(appointments, doctors);
          break;

        case 3:
        // Cancel an appointment
          _cancelAppointment(appointments);
          break;

        case 4:
        // Update appointment status
          _updateAppointmentStatus(appointments);
          break;

        case 5:
        // View appointment details
          _viewAppointmentDetails(appointments);
          break;

        case 6:
        // View all appointments
          _viewAllAppointments(appointments);
          break;

        case 7:
        // Go back to the main menu
          return;

        default:
          print('Invalid choice. Please try again.');
      }
    }
  }

  static void _scheduleAppointment(List<Appointment> appointments, List<Doctor> doctors, List<Patient> patients) {
    stdout.write('Enter Patient ID: ');
    int patientId = int.parse(stdin.readLineSync()!);

    // Manually search for the patient
    Patient? patient;
    for (var p in patients) {
      if (p.id == patientId) {
        patient = p;
        break;
      }
    }

    if (patient == null) {
      print('Patient not found.');
      return;
    }

    stdout.write('Enter Doctor ID: ');
    int doctorId = int.parse(stdin.readLineSync()!);

    // Manually search for the doctor
    Doctor? doctor;
    for (var d in doctors) {
      if (d.id == doctorId) {
        doctor = d;
        break;
      }
    }

    if (doctor == null ) {
      print('Doctor not found.');
      return;
    }else if(!doctor.isAvailable()){
      print('Doctor is not available at the requested time.');
      return;
    }

    stdout.write('Enter Appointment Date (YYYY-MM-DD): ');
    DateTime date = DateTime.parse(stdin.readLineSync()!);

    stdout.write('Enter Appointment Status (1: Scheduled, 2: Completed, 3: Cancelled): ');
    String statusInput = stdin.readLineSync()!;

    AppointmentStatus status;
    switch (statusInput) {
      case '1':
        status = AppointmentStatus.Scheduled;
        break;
      case '2':
        status = AppointmentStatus.Completed;
        break;
      case '3':
        status = AppointmentStatus.Cancelled;
        break;
      default:
        print('Invalid status! Defaulting to Scheduled.');
        status = AppointmentStatus.Scheduled;
    }

    Appointment newAppointment = Appointment(patientId, doctorId, date, status);
    appointments.add(newAppointment);
    print('Appointment scheduled successfully.');
  }

  static void _rescheduleAppointment(List<Appointment> appointments, List<Doctor> doctors) {
    stdout.write('Enter Appointment ID to reschedule: ');
    int appointmentId = int.parse(stdin.readLineSync()!);

    Appointment? appointment;
    for (var a in appointments) {
      if (a.appointmentId == appointmentId) {
        appointment = a;
        break;
      }
    }

    if (appointment == null) {
      print('Appointment not found.');
      return;
    }

    stdout.write('Enter new Appointment Date (YYYY-MM-DD): ');
    DateTime newDate = DateTime.parse(stdin.readLineSync()!);

    Doctor? doctor;
    for (var d in doctors) {
      if (d.id == appointment.doctorId) {
        doctor = d;
        break;
      }
    }

    if (doctor == null || !doctor.isAvailable()) {
      print('Doctor is not available for the selected date.');
      return;
    }

    appointment.dateTime = newDate;
    print('Appointment rescheduled successfully.');
  }

  static void _cancelAppointment(List<Appointment> appointments) {
    stdout.write('Enter Appointment ID to cancel: ');
    int appointmentId = int.parse(stdin.readLineSync()!);

    Appointment? appointment;
    for (var a in appointments) {
      if (a.appointmentId == appointmentId) {
        appointment = a;
        break;
      }
    }

    if (appointment == null) {
      print('Appointment not found.');
      return;
    }

    appointment.status = AppointmentStatus.Cancelled;
    print('Appointment cancelled successfully.');
  }

  static void _updateAppointmentStatus(List<Appointment> appointments) {
    stdout.write('Enter Appointment ID to update status: ');
    int appointmentId = int.parse(stdin.readLineSync()!);

    Appointment? appointment;
    for (var a in appointments) {
      if (a.appointmentId == appointmentId) {
        appointment = a;
        break;
      }
    }

    if (appointment == null) {
      print('Appointment not found.');
      return;
    }

    stdout.write('Enter new Status (1: Scheduled, 2: Completed, 3: Cancelled): ');
    String statusInput = stdin.readLineSync()!;

    switch (statusInput) {
      case '1':
        appointment.status = AppointmentStatus.Scheduled;
        break;
      case '2':
        appointment.status = AppointmentStatus.Completed;
        break;
      case '3':
        appointment.status = AppointmentStatus.Cancelled;
        break;
      default:
        print('Invalid status.');
        return;
    }

    print('Appointment status updated successfully.');
  }

  static void _viewAppointmentDetails(List<Appointment> appointments) {
    stdout.write('Enter Appointment ID to view details: ');
    int appointmentId = int.parse(stdin.readLineSync()!);

    Appointment? appointment;
    for (var a in appointments) {
      if (a.appointmentId == appointmentId) {
        appointment = a;
        break;
      }
    }

    if (appointment != null) {
      appointment.viewAppointmentDetails();
    } else {
      print('Appointment not found.');
    }
  }

  static void _viewAllAppointments(List<Appointment> appointments) {
    print('\n----- List of Appointments -----');
    for (var appointment in appointments) {
      appointment.viewAppointmentDetails();
    }
  }
}
