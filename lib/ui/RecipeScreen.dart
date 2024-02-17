import 'package:flutter/material.dart';
import 'package:worldflavors/models/Recipes.dart';
import 'package:worldflavors/ui/share/appbar_widget.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class RecipeScreen extends StatefulWidget {
  final Recipes recipe;
  const RecipeScreen({Key? key, required this.recipe}) : super(key: key);

  @override
  RecipeScreenState createState() => RecipeScreenState();
}

class RecipeScreenState extends State<RecipeScreen> {
  int counter = 1; // Set initialValue to 1

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget('search'),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.75, // 75% of the screen width
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Title',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FractionallySizedBox(
                  widthFactor: 1.0,
                  child: Image.network(
                    'https://dxm.dam.savencia.com/api/wedia/dam/transform/fix635d9eidk6p661qfha99t5g7z8g6m3owhnda/original',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    const Text(
                      'Quantité:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    ItemCount(
                      initialValue: counter,
                      minValue: 1,
                      maxValue: 10,
                      decimalPlaces: 0,
                      color: Colors.orangeAccent,
                      onChanged: (value) {
                        setState(() {
                          counter = value.toInt();
                        });
                        print('Selected value: $value');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}