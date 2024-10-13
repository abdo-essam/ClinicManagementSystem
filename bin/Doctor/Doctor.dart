class Doctor {
  static int _idCounter = 0; // Static counter for unique IDs
  int id;
  String name;
  String specialization;
  int yearsOfExperience;
  String contactInfo;
  bool available;

  Doctor(this.name, this.specialization, this.yearsOfExperience,
      this.contactInfo, this.available)
      : id = ++_idCounter {
    // Assigns ID and increments counter
    print('Doctor created with ID: $id');
  }

  void viewDoctorDetails() {
    print('Doctor ID: $id, Name: $name, Specialization: $specialization, Experience: $yearsOfExperience years, Contact Info: $contactInfo, Available: $available');
  }
  void updateAvailability(bool availability) {
    available = availability;
  }

  bool isAvailable() {
    return available;
  }
}
