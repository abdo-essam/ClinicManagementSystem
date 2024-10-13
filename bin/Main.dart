import 'dart:io';

import 'package:untitled1/untitled1.dart' as untitled1;

import 'Appointment/Appointment.dart';
import 'Appointment/AppointmentUtils.dart';
import 'Billing.dart';
import 'Doctor/Doctor.dart';
import 'Doctor/DoctorUtils.dart';
import 'MedicalRecord.dart';
import 'Patient/Patient.dart';
import 'Patient/PatientUtils.dart';
import 'Staff.dart';
import 'Utils.dart';

// To Do
// Work on Unique ID Generation for (Doctors, Patients, Appointments,Bill)
// Implement Multi-User Access with roles for (Admin,Receptionist,Doctor)
// Work on Date Handling for appointments and scheduling.
// Work on Doctor Availability: Assign time slots for doctors.

void main() {
  List<Patient> patients = [];
  List<Doctor> doctors = [];
  List<Appointment> appointments = [];
  List<Billing> bills = [];
  List<MedicalRecord> records = [];
  List<Staff> staff = [];

  while (true) {
    Utils.clearConsole();
    print('\n----- Clinic Management System -----');
    print('1. Patients');
    print('2. Doctors');
    print('3. Appointments');
    print('4. Medical Records');
    print('5. Staff');
    print('6. Generate a Bill');
    print('7. Exit');
    stdout.write('Enter your choice: ');
    String? input = stdin.readLineSync();

    int choice = int.tryParse(input ?? '0') ?? 0;

    switch (choice) {
      case 1:
        // Manage Patients
        PatientUtils.managePatients(patients);
        break;

      case 2:
        // Manage Doctors
        DoctorUtils.manageDoctors(doctors);
        break;

      case 3:
        // Manage Appointments
        AppointmentUtils.manageAppointments(appointments, doctors, patients);
        break;

      case 4:
        // Manage Medical Records
        //MedicalRecordUtils.manageMedicalRecords(records);
        break;

      case 5:
        //Manage Staff
        //StaffUtils.manageStaff(staff);
        break;

      case 6:
      // Generate a bill
        stdout.write('Enter Bill ID: ');
        int billId = int.parse(stdin.readLineSync()!);

        // Get patient details
        stdout.write('Enter Patient ID: ');
        int patientId = int.parse(stdin.readLineSync()!);

        // Find the patient by ID
        Patient? patient;
        for (var p in patients) {
          if (p.id == patientId) {

            stdout.write('Enter Consultation Fee: ');
            double consultationFee = double.parse(stdin.readLineSync()!);
            stdout.write('Enter Medication Fee: ');
            double medicationFee = double.parse(stdin.readLineSync()!);
            stdout.write('Enter Other Services Fee: ');
            double otherServicesFee = double.parse(stdin.readLineSync()!);

            // Create a new billing object
            Billing newBill = Billing(
              p,
              consultationFee,
              medicationFee,
              otherServicesFee,
            );

            newBill.displayBill(); // Display the bill with patient information
            bills.add(newBill); // Add the bill to the list
            print('Bill generated successfully.');


            patient = p;
            break;
          }
        }
        if (patient == null){
          print('Patient not found.');
        }
        break;

      case 7:
        // Exit the program
        print('Exiting the system. Goodbye!');
        exit(0);

      default:
        print('Invalid choice. Please try again.');
    }
  }
}
