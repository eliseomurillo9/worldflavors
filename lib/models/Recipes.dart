import 'package:worldflavors/models/User.dart';

class Recipes {

  final int id;
  final String title;
  final User user;
  int notation;
  String preparation;
  String image;

  Recipes(this.id, this.title, this.user, this.notation, this.preparation, this.image);

  Recipes.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      title = json['title'],
      user = json['user'],
      notation = json['notation'],
      preparation = json['preparation'],
      image = json['image'];
}
