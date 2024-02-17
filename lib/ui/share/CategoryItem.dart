import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String categoryName;
  final VoidCallback onPressed;

  const CategoryItem({
    required Key? key,
    required this.categoryName,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Call the onPressed callback when the widget is tapped
        if (onPressed != null) {
          onPressed();
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: Colors.grey, // Grey background color
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0), // Adjust padding as needed
            child: Text(
              categoryName ?? 'example 1', // Use provided category name or default to "example 1"
              style: const TextStyle(
                color: Colors.white, // White text color
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center, // Center text horizontally
              maxLines: 2, // Limit to 2 lines to prevent cutting off
              overflow: TextOverflow.ellipsis, // Handle overflow by showing ellipsis
            ),
          ),
        ),
      ),
    );
  }
}
