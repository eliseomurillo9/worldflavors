import 'Categories.dart';
import 'Ingredients.dart';

class Recipes {
  final String id;
  final String title;
  late double notation;
  final List<String> preparation;
  final String image;
  final Categories category;
  final List<Ingredients> ingredients;

  Recipes(
      this.id,
      this.title,
      this.notation,
      this.preparation,
      this.image,
      this.category,
      this.ingredients,
      );

  Recipes.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        notation = json['notation'].toDouble(),
        preparation = List<String>.from(json['preparation']),
        image = json['image'],
        category = Categories.fromJson(json['category']),
        ingredients = (json['ingredients'] as List<dynamic>)
            .map((ingredientJson) => Ingredients.fromJson(ingredientJson))
            .toList();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'notation': notation,
      'preparation': preparation,
      'image': image,
      'category': category.toJson(),
      'ingredients': ingredients.map((ingredient) => ingredient.toJson()).toList(),
    };
  }
}
