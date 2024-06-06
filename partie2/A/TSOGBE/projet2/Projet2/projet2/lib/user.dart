import 'dart:convert';

class User {
  final String phoneNumber;
  final String identity;
  final String education;
  final String employment;
  final String maritalStatus;

  User({
    required this.phoneNumber,
    required this.identity,
    required this.education,
    required this.employment,
    required this.maritalStatus,
  });

  static String _validatePhoneNumber(String phoneNumber) {
    if (phoneNumber.isEmpty) {
      throw ArgumentError('Phone number cannot be empty');
    }
    return phoneNumber;
  }

  Map<String, String> toMap() {
    return {
      'phoneNumber': phoneNumber,
      'identity': identity,
      'education': education,
      'employment': employment,
      'maritalStatus': maritalStatus,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      phoneNumber: map['phoneNumber'] ?? '',
      identity: map['identity'] ?? '',
      education: map['education'] ?? '',
      employment: map['employment'] ?? '',
      maritalStatus: map['maritalStatus'] ?? '',
    );
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  factory User.fromJson(String source) {
    return User.fromMap(jsonDecode(source));
  }
}
