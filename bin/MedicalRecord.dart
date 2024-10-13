
class MedicalRecord {
  int recordId;
  int patientId;
  String diagnosis;
  String prescribedTreatment;
  DateTime dateOfVisit;

  MedicalRecord(this.recordId, this.patientId, this.diagnosis,
      this.prescribedTreatment, this.dateOfVisit);

  void updateRecord(String newDiagnosis, String newTreatment) {
    diagnosis = newDiagnosis;
    prescribedTreatment = newTreatment;
  }

  void viewRecord() {
    print(
        'Record ID: $recordId, Diagnosis: $diagnosis, Treatment: $prescribedTreatment, Date: $dateOfVisit');
  }
}
