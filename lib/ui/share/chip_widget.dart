import 'package:flutter/material.dart';

class ChipWidget extends StatelessWidget {
  final String categoryName;

  const ChipWidget({Key? key, required this.categoryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 4.0,
      ),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Text(
        categoryName,
        style: const TextStyle(
          fontSize: 4.0, // Set the font size to 12.0
          color: Colors.white,
        ),
      ),
    );
  }
}
