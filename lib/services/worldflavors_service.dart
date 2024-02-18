import 'dart:convert';

import 'package:worldflavors/models/Categories.dart';
import 'package:worldflavors/models/Ingredients.dart';

import '../models/Recipes.dart';
import 'package:http/http.dart' as http;

class WorldFlavorsService {

  static const String uri = "https://65bca915b51f9b29e931f8fc.mockapi.io/api/v1";

  Future<List<Recipes>> fetchRecipes() async {
    List<Recipes> list = [];

    try {
      final response = await http.get(Uri.parse('$uri/recepes'));

      if(response.statusCode == 200){
        var json = jsonDecode(utf8.decode(response.bodyBytes));

        for(final value in json){
          list.add(Recipes.fromJson(value));
        }
      } else {
        throw Exception('Impossible de récupérer les recettes.');
      }
    } catch(e){
      throw e;
    }
    return list;
  }

  Future<List<Recipes>> fetchRecipesByCategory(String category) async {
    try {
      final List<Recipes> allRecipes = await fetchRecipes();
      final List<Recipes> recipesByCountry =
      allRecipes.where((recipe) => recipe.category.name == category).toList();
      return recipesByCountry;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateRecipeNotation(String recipeId, double newNotation) async {
    final url = Uri.parse('$uri/recepes/$recipeId');

    try {
      final List<Recipes> allRecipes = await fetchRecipes();
      final Recipes recipeToUpdate = allRecipes.firstWhere((recipe) => recipe.id == recipeId);
      recipeToUpdate.notation = newNotation;

      final response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(recipeToUpdate.toJson()),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to update notation.');
      }
    } catch (e) {
      throw e;
    }
  }


  Future<List<Categories>> fetchCategories() async {
    List<Categories> list = [];

    try {
      final response = await http.get(Uri.parse('$uri/category'));

      if(response.statusCode == 200){
        var json = jsonDecode(utf8.decode(response.bodyBytes));

        for(final value in json){
          list.add(Categories.fromJson(value));
        }
      } else {
        throw Exception('Impossible de récupérer les categories.');
      }
    } catch(e){
      throw e;
    }
    return list;
  }

  Future<List<Ingredients>> fetchIngredients() async {
    List<Ingredients> list = [];

    try {
      final response = await http.get(Uri.parse('$uri/ingredients'));

      if(response.statusCode == 200){
        var json = jsonDecode(utf8.decode(response.bodyBytes));

        for(final value in json){
          list.add(Ingredients.fromJson(value));
        }
      } else {
        throw Exception('Impossible de récupérer les ingredients.');
      }
    } catch(e){
      throw e;
    }
    return list;
  }


}