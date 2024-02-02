import 'User.dart';
import 'Category.dart';

class Recipes {

  final int id;
  final String title;
  final User user;
  final int notation;
  final String preparation;
  final String image;
  final Category category;

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
