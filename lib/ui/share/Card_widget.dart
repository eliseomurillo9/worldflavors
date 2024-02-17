import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'chip_widget.dart';

class CardWidget extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String categoryName;
  final double rating;
  final VoidCallback onPressed;

  const CardWidget({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.categoryName,
    required this.rating,
    required this.onPressed,
  }) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState(
    title: title,
    imageUrl: imageUrl,
    categoryName: categoryName,
    rating: rating,
    onPressed: onPressed,
  );
}

class _CardWidgetState extends State<CardWidget> {
  final String title;
  final String imageUrl;
  final String categoryName;
  final double rating;
  final VoidCallback onPressed;

  _CardWidgetState({
    required this.title,
    required this.imageUrl,
    required this.categoryName,
    required this.rating,
    required this.onPressed,
  });

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
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: widget.rating,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 20,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {

                          },
                        ),
                      ],
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
}