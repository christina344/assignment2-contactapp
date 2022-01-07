class Contact {
  int id;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;

  Contact({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
  });

  Contact.fromJson(json)
      : id = json['id'],
        firstName = json['firstName'],
        lastName = json['lastName'],
        email = json['email'],
        phoneNumber = json['phoneNumber'];
}
