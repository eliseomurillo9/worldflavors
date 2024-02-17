import 'package:flutter/material.dart';
import 'package:worldflavors/models/Recipes.dart';
import 'package:worldflavors/ui/share/appbar_widget.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class RecipeScreen extends StatefulWidget {
  final Recipes _recipes;

  const RecipeScreen(this._recipes, {Key? key}) : super(key: key);

  @override
  RecipeScreenState createState() => RecipeScreenState();
}

class RecipeScreenState extends State<RecipeScreen>  {
  int counter = 1; // Set initialValue to 1

  final List<Map<String, dynamic>> ingredients = [
    {
      "quantity": 250,
      "unit": "g",
      "ingredient": "pain rassis"
    },
    {
      "quantity": 1,
      "unit": "œuf",
      "ingredient": "œufs"
    },
    {
      "quantity": 25,
      "unit": "cl",
      "ingredient": "lait"
    },
    {
      "quantity": 0.5,
      "unit": "unité",
      "ingredient": "oignon"
    },
    {
      "quantity": 0.5,
      "unit": "gousse",
      "ingredient": "ail"
    },
    {
      "quantity": 0,
      "unit": "",
      "ingredient": "Persil"
    },
    {
      "quantity": 0,
      "unit": "",
      "ingredient": "Sel"
    },
    {
      "quantity": 0,
      "unit": "",
      "ingredient": "Poivre"
    }
  ];

  final List<String> preparation = [
    "Émiettez le pain dans un saladier.",
    "Faites chauffer le lait et versez-le sur le pain.",
    "Ajoutez les œufs, l'oignon et l'ail hachés, le persil, le sel et le poivre.",
    "Mélangez bien le tout.",
    "Laissez reposer la préparation pendant environ 30 minutes.",
    "Façonnez des boules avec la préparation et faites-les cuire dans de l'eau bouillante salée pendant 20 minutes."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget('search'),
      body: SingleChildScrollView(
        child: Center(
          child: FractionallySizedBox(
            widthFactor: 0.75, // 75% of the screen width
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Title',
                  style: TextStyle(
                    color: Colors.red, // Change title color to red
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
                const SizedBox(height: 16),
                const Text(
                  'Ingredients:',
                  style: TextStyle(
                    color: Colors.red, // Change title color to red
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Center( // Center the ingredients section
                  child: SizedBox(
                    height: 200, // Set a specific height
                    child: ListView.builder(
                      itemCount: (ingredients.length / 2).ceil(),
                      itemBuilder: (context, index) {
                        final firstIngredientIndex = index * 2;
                        final secondIngredientIndex = index * 2 + 1;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                '${ingredients[firstIngredientIndex]['ingredient']}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                '- ${ingredients[firstIngredientIndex]['quantity']} ${ingredients[firstIngredientIndex]['unit']}',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(width: 16), // Add some spacing between the columns
                            Expanded(
                              child: Text(
                                '${ingredients[secondIngredientIndex]['ingredient']}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                '- ${ingredients[secondIngredientIndex]['quantity']} ${ingredients[secondIngredientIndex]['unit']}',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Préparation:',
                  style: TextStyle(
                    color: Colors.red, // Change title color to red
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: preparation.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${index + 1}\n',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              preparation[index],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}