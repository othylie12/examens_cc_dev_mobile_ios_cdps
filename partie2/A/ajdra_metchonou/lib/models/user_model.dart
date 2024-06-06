class User {
  final String name;
  final String id;
  final String education;
  final String profession;
  final String maritalStatus;

  User({
    required this.name,
    required this.id,
    required this.education,
    required this.profession,
    required this.maritalStatus,
  });

  // Convert a User to a Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'education': education,
      'profession': profession,
      'maritalStatus': maritalStatus,
    };
  }

  // Create a User from a Map
  static User fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      id: map['id'],
      education: map['education'],
      profession: map['profession'],
      maritalStatus: map['maritalStatus'],
    );
  }
}