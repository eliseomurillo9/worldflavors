import 'dart:convert';

class Categories {
  final String name;
  final String id;

  Categories(this.name, this.id);

  Categories.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['id'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
    };
  }
}
