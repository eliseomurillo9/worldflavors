import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../services/worldflavors_service.dart';

class CardWidget extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String categoryName;
  final double rating;
  final VoidCallback onPressed;
  final String id;

  const CardWidget({
    Key? key,
    required this.title,
    required this.id,
    required this.imageUrl,
    required this.categoryName,
    required this.rating,
    required this.onPressed,
  }) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  late double _rating;

  @override
  void initState() {
    super.initState();
    _rating = widget.rating;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8),
      child: InkWell(
        onTap: widget.onPressed,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.imageUrl,
              fit: BoxFit.cover,
              height: 150,
              width: 150,
            ),
            SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          color: Color(0xFFB12E23),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFF8B51E),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Text(
                        widget.categoryName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    RatingBar.builder(
                      initialRating: _rating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 20,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        setState(() {
                          _rating = rating;
                        });
                        // Call the updateRecipeNotation method when rating is updated
                        _updateNotation(widget.id, rating);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _updateNotation(String recipeId, double newNotation) async {
    try {
      print('working');
      print(recipeId);
      print(newNotation);
      await WorldFlavorsService().updateRecipeNotation(recipeId, newNotation);
    } catch (e) {
      // Handle any errors here
      print('Failed to update notation: $e');
    }
  }
}
