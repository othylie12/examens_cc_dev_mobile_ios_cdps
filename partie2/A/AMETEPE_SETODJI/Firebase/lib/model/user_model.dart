class Users {
  final String phoneNumber;
  final String identity;
  final String education;
  final String employment;
  final String maritalStatus;

  Users({
    required this.phoneNumber,
    required this.identity,
    required this.education,
    required this.employment,
    required this.maritalStatus,
  });

  Map<String, String> toMap() {
    return {
      'phoneNumber': phoneNumber,
      'identity': identity,
      'education': education,
      'employment': employment,
      'maritalStatus': maritalStatus,
    };
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      phoneNumber: map['phoneNumber'] ?? '',
      identity: map['identity'] ?? '',
      education: map['education'] ?? '',
      employment: map['employment'] ?? '',
      maritalStatus: map['maritalStatus'] ?? '',
    );
  }
}
