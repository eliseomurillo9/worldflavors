import 'Users.dart';
import 'Categories.dart';

class Recipes {

  final int id;
  final String title;
  final Users user;
  final int notation;
  final String preparation;
  final String image;
  final Categories category;

  Recipes(this.id, this.title, this.user, this.notation, this.preparation, this.image, this.category);

  Recipes.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      title = json['title'],
      user = json['user'],
      notation = json['notation'],
      preparation = json['preparation'],
      image = json['image'],
      category = json['category'];
}
