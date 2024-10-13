import 'dart:io';

import '../Utils.dart';
import 'Doctor.dart';

class DoctorUtils {
  static void manageDoctors(List<Doctor> doctors) {
    while (true) {
      Utils.clearConsole();
      print('\n----- Manage Doctors -----');
      print('1. Add Doctor');
      print('2. View Doctor Details');
      print('3. View Doctors');
      print('4. Update Doctor Availability');
      print('5. Back to Main Menu');
      stdout.write('Enter your choice: ');
      String? input = stdin.readLineSync();
      int choice = int.tryParse(input ?? '0') ?? 0;

      switch (choice) {
        case 1:
          // Add a new doctor
          stdout.write('Enter Doctor Name: ');
          String name = stdin.readLineSync()!;
          stdout.write('Enter Specialization: ');
          String specialization = stdin.readLineSync()!;
          stdout.write('Enter Years of Experience: ');
          int experience = int.parse(stdin.readLineSync()!);
          stdout.write('Enter Contact Info: ');
          String contact = stdin.readLineSync()!;
          stdout.write('Is the doctor available (true/false)? ');
          bool available = stdin.readLineSync()!.toLowerCase() == 'true';

          Doctor newDoctor =
              Doctor(name, specialization, experience, contact, available);
          doctors.add(newDoctor);
          print('Doctor added successfully.');
          break;

        case 2:
          // View doctor details
          stdout.write('Enter Doctor ID to view details: ');
          int id = int.parse(stdin.readLineSync()!);
          Doctor? doctor;
          for (var d in doctors) {
            if (d.id == id) {
              doctor = d;
              break;
            }
          }

          if (doctor != null) {
            doctor.viewDoctorDetails();
          } else {
            print('Doctor not found.');
          }
          break;

        case 3:
          // View doctors
          print('\n----- List of Doctors -----');
          for (var doctor in doctors) {
            doctor.viewDoctorDetails();
          }
          break;

        case 4:
          // Update doctor availability
          stdout.write('Enter Doctor ID to update availability: ');
          int id = int.parse(stdin.readLineSync()!);
          Doctor? doctorToUpdate;
          for (var d in doctors) {
            if (d.id == id) {
              doctorToUpdate = d;
              break;
            }
          }

          if (doctorToUpdate != null) {
            stdout.write('Is the doctor available now (true/false)? ');
            bool newAvailability =
                stdin.readLineSync()!.toLowerCase() == 'true';
            doctorToUpdate.available = newAvailability;
            print('Doctor availability updated successfully.');
          } else {
            print('Doctor not found.');
          }
          break;

        case 5:
          // Go back to the main menu
          return;

        default:
          print('Invalid choice. Please try again.');
      }
    }
  }
}
