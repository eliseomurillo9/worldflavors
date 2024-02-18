import 'package:flutter/material.dart';
import 'package:worldflavors/models/Recipes.dart';
import 'package:worldflavors/services/worldflavors_service.dart';
import 'package:worldflavors/ui/share/appbar_widget.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class RecipeScreen extends StatefulWidget {
  final Recipes recipe;
  const RecipeScreen({Key? key, required this.recipe}) : super(key: key);

  @override
  RecipeScreenState createState() => RecipeScreenState();
}

class RecipeScreenState extends State<RecipeScreen>  {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget('search'),
      body: SingleChildScrollView(
        child: Center(
          child: FractionallySizedBox(
            widthFactor: 0.75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.recipe.title,
                  style: const TextStyle(
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
                      widget.recipe.image,
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
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: SizedBox(
                    height: 90,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: (widget.recipe.ingredients.length / 2).ceil(),
                      itemBuilder: (context, index) {
                        final firstIngredientIndex = index * 2;
                        final secondIngredientIndex = index * 2 + 1;

                        final firstIngredientExists = firstIngredientIndex < widget.recipe.ingredients.length;

                        final secondIngredientExists = secondIngredientIndex < widget.recipe.ingredients.length;

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: firstIngredientExists ? Text(
                                '${widget.recipe.ingredients[firstIngredientIndex].ingredient}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ) : const SizedBox(),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: firstIngredientExists ? Text(
                                '${widget.recipe.ingredients[firstIngredientIndex].quantity} ${widget.recipe.ingredients[firstIngredientIndex].unit}',
                                textAlign: TextAlign.center,
                              ) : SizedBox(),
                            ),
                            const SizedBox(width: 50),
                            Expanded(
                              child: secondIngredientExists ? Text(
                                '${widget.recipe.ingredients[secondIngredientIndex].ingredient}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ) : SizedBox(),
                            ),
                            Expanded(
                              child: secondIngredientExists ? Text(
                                '${widget.recipe.ingredients[secondIngredientIndex].quantity} ${widget.recipe.ingredients[secondIngredientIndex].unit}',
                                textAlign: TextAlign.center,
                              ) : SizedBox(),
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
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: widget.recipe.preparation.length,
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
                              widget.recipe.preparation[index],
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
