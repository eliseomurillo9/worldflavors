import 'package:flutter/material.dart';
import 'package:worldflavors/ui/RecipeScreen.dart';
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
  late String? selectedCountry;
  bool _hasLoadedCountryRecipes = false;

  @override
  void initState() {
    super.initState();
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


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (ModalRoute.of(context)!.settings.arguments != null) {
      selectedCountry = ModalRoute.of(context)!.settings.arguments as String;
      if (!_hasLoadedCountryRecipes) {
        _fetchRecipesByCountry(selectedCountry!);
      }
    } else {
      _fetchData();
    }
  }


  Future<void> _fetchRecipesByCountry(String country) async {
    try {
      final recipes = await _service.fetchRecipesByCategory(country);
      setState(() {
        _recipes = recipes;
        _hasLoadedCountryRecipes = true;
      });
    } catch (e) {
      print('Impossible de récupérer les recettes du pays sélectionné : $e');
    }
  }

  Future<void> _fetchAllRecipes() async {
    try {
      final recipes = await _service.fetchRecipes();
      setState(() {
        _recipes = recipes;
      });
    } catch (e) {
      print('Error fetching all recipes: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget('WorldFlavors'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CategoryItem(
                    categoryName: 'Tous les catégories',
                    onPressed: _fetchAllRecipes,
                  ),
                  const SizedBox(width: 3.0),
                  Wrap(
                    spacing: 3.0,
                    runSpacing: 3.0,
                    children: _categories.map((category) {
                      return CategoryItem(
                        categoryName: category.name,
                        onPressed: () {
                          _fetchRecipesByCountry(category.name);
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _recipes.isNotEmpty
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: _recipes.map((recipe) {
                return CardWidget(
                  title: recipe.title,
                  id: recipe.id,
                  imageUrl: recipe.image,
                  categoryName: recipe.category.name,
                  rating: recipe.notation.toDouble(),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RecipeScreen(recipe: recipe),
                      ),
                    );
                  },
                );
              }).toList(),
            )
                : const Center(
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
