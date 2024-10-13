import 'dart:io';

import '../MedicalRecord.dart';
import '../Utils.dart';
import 'Patient.dart';

class PatientUtils {
  static void managePatients(List<Patient> patients) {
    while (true) {
      Utils.clearConsole();
      print('\n----- Manage Patients -----');
      print('1. Add Patient');
      print('2. Update Contact Information');
      print('3. View Patient Details');
      print('4. Add/View Medical History');
      print('5. View Patients');
      print('6. Back to Main Menu');
      stdout.write('Enter your choice: ');
      String? input = stdin.readLineSync();
      int choice = int.tryParse(input ?? '0') ?? 0;

      switch (choice) {
        case 1:
        // Add a new patient
          Utils.clearConsole();
          stdout.write('Enter Patient Name: ');
          String name = stdin.readLineSync()!;
          stdout.write('Enter Patient Age: ');
          int age = int.parse(stdin.readLineSync()!);
          stdout.write('Enter Patient Gender (Male/Female): ');
          String gender = stdin.readLineSync()!;
          stdout.write('Enter Contact Info: ');
          String contact = stdin.readLineSync()!;

          Patient newPatient = Patient(name, age, gender, contact);
          patients.add(newPatient);
          print('Patient added successfully.');
          break;

        case 2:
        // Update patient contact information
          stdout.write('Enter Patient ID to update contact info: ');
          int id = int.parse(stdin.readLineSync()!);
          Patient? patient ;
          for (var p in patients) {
            if (p.id == id) {
              patient = p;
              break;
            }
          }

          if (patient != null) {
            stdout.write('Enter new contact info: ');
            String newContactInfo = stdin.readLineSync()!;
            patient.updateContactInfo(newContactInfo);
          } else {
            print('Patient not found.');
          }
          break;

        case 3:
        // View patient details
          stdout.write('Enter Patient ID to view details: ');
          int id = int.parse(stdin.readLineSync()!);
          Patient? patient;
          for (var p in patients) {
            if (p.id == id) {
              patient = p;
              break;
            }
          }

          if (patient != null) {
            patient.viewPatientDetails();
          } else {
            print('Patient not found.');
          }
          break;

        case 4:
        // Add/view medical history
          stdout.write('Enter Patient ID to add/view medical history: ');
          int id = int.parse(stdin.readLineSync()!);
          Patient? patient;
          for (var p in patients) {
            if (p.id == id) {
              patient = p;
              break;
            }
          }

          if (patient != null) {
            print('1. Add Medical Record');
            print('2. View Medical History');
            stdout.write('Enter your choice: ');
            int historyChoice = int.parse(stdin.readLineSync()!);

            if (historyChoice == 1) {
              // Adding a new medical record
              stdout.write('Enter Record ID: ');
              int recordId = int.parse(stdin.readLineSync()!);
              stdout.write('Enter Diagnosis: ');
              String diagnosis = stdin.readLineSync()!;
              stdout.write('Enter Prescribed Treatment: ');
              String treatment = stdin.readLineSync()!;
              stdout.write('Enter Date of Visit (YYYY-MM-DD): ');
              DateTime dateOfVisit = DateTime.parse(stdin.readLineSync()!);

              MedicalRecord newRecord = MedicalRecord(recordId, patient.id, diagnosis, treatment, dateOfVisit);
              patient.addMedicalRecord(newRecord);
              print('Medical record added successfully.');
            } else if (historyChoice == 2) {
              // Viewing medical history
              patient.viewMedicalHistory();
            } else {
              print('Invalid choice.');
            }
          } else {
            print('Patient not found.');
          }
          break;


        case 5:
        // View patients
          print('\n----- List of Patients -----');
          for (var patient in patients) {
            patient.viewPatientDetails();
          }
          break;

        case 6:
        // Go back to the main menu
          return;

        default:
          print('Invalid choice. Please try again.');
      }
    }
  }
}