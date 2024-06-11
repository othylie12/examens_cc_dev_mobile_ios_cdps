class User {
  String phoneNumber;
  String identityInfo;
  String educationInfo;
  String employmentInfo;
  String maritalStatus;
  String confirmationCode;

  User({
    required this.phoneNumber,
    required this.identityInfo,
    required this.educationInfo,
    required this.employmentInfo,
    required this.maritalStatus,
    this.confirmationCode = '',
  });
}
