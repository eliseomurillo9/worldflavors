class Users {

  final int id;
  final String role;

  Users(this.id, this.role);

  Users.fromJson(Map<String, dynamic> json)
  : id = json['id'],
    role = json['role'];

}