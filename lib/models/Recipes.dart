import 'Categories.dart';
import 'Ingredients.dart';

class Recipes {

  final String id;
  final String title;
  final double notation;
  final List<String> preparation;
  final String image;
  final Categories category;
  final List<Ingredients> ingredients;


  Recipes(this.id, this.title, this.notation, this.preparation, this.image, this.category, this.ingredients);

  Recipes.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        notation = json['notation'],
        preparation = List<String>.from(json['preparation']), // Convertir en liste de chaînes
        image = json['image'],
        category = Categories.fromJson(json['category']),
        ingredients = (json['ingredients'] as List<dynamic>) // Convertir chaque élément en Ingredients
            .map((ingredientJson) => Ingredients.fromJson(ingredientJson))
            .toList();


}
