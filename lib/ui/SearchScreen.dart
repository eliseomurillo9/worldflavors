import 'package:flutter/material.dart';
import 'package:worldflavors/ui/share/CategoryItem.dart';
import 'package:worldflavors/ui/share/appbar_widget.dart';
import 'package:worldflavors/services/worldflavors_service.dart';
import 'package:worldflavors/models/Categories.dart';

import '../models/Recipes.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final WorldFlavorsService _service = WorldFlavorsService();
  late List<Categories> _categories = [];

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  Future<void> _fetchCategories() async {
    try {
      final categories = await _service.fetchCategories();
      setState(() {
        _categories = categories;
      });
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }

  Future<List<Recipes>> _fetchRecipesByCategory(String category) async {
    try {
      final recipes = await _service.fetchRecipesByCategory(category);
      return recipes;
    } catch (e) {
      print('Error fetching recipes by category: $e');
      throw e; // Re-throw the exception to handle it elsewhere if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget('search'),
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Rechercher',
                  style: TextStyle(
                    color: Color(0xFFB12E23),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F4F4),
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.search, color: Colors.orange),
                      onPressed: () {
                        print('Search button pressed');
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 70),
              const Text(
                'Trier par Pays',
                style: TextStyle(
                  color: Color(0xFFB12E23),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.0, // Reduce cross axis spacing
                  mainAxisSpacing: 10.0, // Reduce main axis spacing
                  childAspectRatio: 2,
                ),
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  final category = _categories[index];
                  return CategoryItem(
                    categoryName: category.name,
                    onPressed: () {
                      print(category.name);
                      _fetchRecipesByCategory(category.name).then((recipes) {
                        for (var recipe in recipes) {
                          print(recipe.title);
                        }
                      }).catchError((error) {
                        print('Error fetching recipes: $error');
                      });
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
