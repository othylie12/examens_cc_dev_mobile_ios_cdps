class User {
  final String name;
  final String id;
  final String education;
  final String profession;
  final String matrimonialStatus;

  User({
    required this.name,
    required this.id,
    required this.education,
    required this.profession,
    required this.matrimonialStatus,
  });

// Convert a User to a Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'education': education,
      'profession': profession,
      'maritalStatus': matrimonialStatus,
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      id: map['id'],
      education: map['education'],
      profession: map['profession'],
      matrimonialStatus: map['maritalStatus'],
    );
  }
}
