class User {
  String nom;
  String prenom;
  String numCni;
  String numTel;
  String profession;
  String lieuTaf;
  String situationMatri;
  User(
      {required this.nom,
      required this.prenom,
      required this.numCni,
      required this.numTel,
      required this.profession,
      required this.lieuTaf,
      required this.situationMatri});

  Map<String, dynamic> toJson() {
    return {
      "nom": nom,
      "prénoms": prenom,
      "numéro de CNI": numCni,
      "numéro de téléphone": numTel,
      "profession": profession,
      "lieu de travail/ école": lieuTaf,
      "situation matrimoniale": situationMatri
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        nom: json['nom'],
        prenom: json['prénoms'],
        numCni: json["numéro de CNI"],
        numTel: json["numéro de téléphone"],
        profession: json["profession"],
        lieuTaf: json["lieu de travail/ école"],
        situationMatri: json["situation matrimoniale"]);
  }
}
