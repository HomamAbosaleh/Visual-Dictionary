class FirebaseUser {
  String name;
  String surname;
  String email;

  FirebaseUser({
    required this.name,
    required this.surname,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'surname': surname,
      'email': email,
    };
  }

  factory FirebaseUser.fromJson(Map<String, dynamic> map) {
    return FirebaseUser(
      name: map['name'] ?? '',
      surname: map['surname'] ?? '',
      email: map['email'] ?? '',
    );
  }
}
