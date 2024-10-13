import '../MedicalRecord.dart';

class Patient {
  static int _idCounter = 0; // Static counter for unique IDs
  int id;
  String name;
  int age;
  String gender;
  String contactInfo;
  List<MedicalRecord> medicalHistory = []; // List of medical records

  Patient(this.name, this.age, this.gender, this.contactInfo)
      : id = ++_idCounter {
    // Assigns ID and increments counter
    print("Patient created with ID: $id");
  }

  void updateContactInfo(String newContactInfo) {
    contactInfo = newContactInfo;
  }

  void viewPatientDetails() {
    print(
        'Patient ID: $id, Name: $name, Age: $age, Gender: $gender, Contact Info: $contactInfo');
    viewMedicalHistory(); // Display medical history
  }

  void addMedicalRecord(MedicalRecord record) {
    medicalHistory
        .add(record); // Add a new medical record to the patient's history
  }

  void viewMedicalHistory() {
    print('Medical History:');
    for (var record in medicalHistory) {
      record.viewRecord(); // Display each medical record
    }
  }
}
