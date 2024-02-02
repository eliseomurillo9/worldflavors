class User {

  final int id;
  final String role;

  User(this.id, this.role);

  User.fromJson(Map<String, dynamic> json)
  : id = json['id'],
    role = json['role'];

}