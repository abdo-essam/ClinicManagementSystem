
class Staff {
  int id;
  String name;
  String role;
  String contactInfo;

  Staff(this.id, this.name, this.role, this.contactInfo);

  void viewStaffDetails() {
    print('Staff ID: $id, Name: $name, Role: $role, Contact Info: $contactInfo');
  }

  void updateContactInfo(String newContactInfo) {
    contactInfo = newContactInfo;
  }
}
