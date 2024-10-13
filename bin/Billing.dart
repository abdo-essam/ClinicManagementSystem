import 'Patient/Patient.dart';

class Billing {
  static int _idCounter = 0; // Static counter for unique IDs
  int billId;
  Patient patient; // Link to the Patient object
  double consultationFee;
  double medicationFee;
  double otherServicesFee;
  double totalCost = 0;

  Billing(this.patient, this.consultationFee, this.medicationFee, this.otherServicesFee): billId = ++_idCounter {
    totalCost = consultationFee + medicationFee + otherServicesFee;
    // Assigns ID and increments counter
    print("Bill created with ID: $billId");
  }

  void applyDiscount(double discountPercent) {
    totalCost -= totalCost * (discountPercent / 100);
  }

  void displayBill() {
    print('Bill ID: $billId');
    patient.viewPatientDetails();
    print('Total Cost: \$${totalCost.toStringAsFixed(2)}');
  }
}
