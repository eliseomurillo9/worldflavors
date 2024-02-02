class Ingredients {

  final int id;
  final String name;
  final int measure;

  Ingredients(this.id, this.name, this.measure);

  Ingredients.fromJson(Map<String, dynamic> json)
  : id = json['id'],
    name = json['name'],
    measure = json['measure'];

}