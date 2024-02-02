class Categories {

  final int id;
  final String name;

  Categories(this.id, this.name);

  Categories.fromJson(Map<String, dynamic> json)
  : id = json['id'],
    name = json['name'];

}