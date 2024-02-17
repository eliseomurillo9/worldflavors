import 'package:flutter/material.dart';

import 'package:worldflavors/ui/share/CategoryItem.dart';
import 'package:worldflavors/ui/share/Card_widget.dart';
import 'package:worldflavors/services/worldflavors_service.dart';
import 'package:worldflavors/ui/share/appbar_widget.dart';

import 'models/Categories.dart';
import 'models/Recipes.dart';


void main() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WorldFlavorsService _service = WorldFlavorsService();
  late List<Recipes> _recipes = [];
  late List<Categories> _categories = [];
  late List<Recipes> _filteredRecipes = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final recipes = await _service.fetchRecipes();
      final categories = await _service.fetchCategories();
      setState(() {
        _recipes = recipes;
        _categories = categories;
      });
    } catch (e) {
      print('Erreur de récupération de données : $e');
    }
  }

  List<Recipes> filterRecipesByCategory(String categoryName) {
    return _recipes.where((recipe) => recipe.category.name == categoryName).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget('WorldFlavors'),
      body: ListView(
        children: [
          Row(
            children: _categories.map((category) {
              return CategoryItem(
                categoryName: category.name,
                onPressed: () {
                  print(category.name);
                },
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          _recipes != null
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _recipes.map((recipe) {
              return CardWidget(
                title: recipe.title,
                imageUrl: recipe.image,
                categoryName: recipe.category.name,
                rating: recipe.notation,
                onPressed: () {
                  //
                },
              );
            }).toList(),
          )
              : Center(
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}

