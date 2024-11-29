import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String iconImagePath;
  final String categoryName;

  const CategoryCard({super.key, 
    required this.iconImagePath, 
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.orange,
              Colors.deepOrange,
            ],
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center the row content horizontally
          children: [
            Image.asset(
              iconImagePath,
              height: 30, // Increase the height of the image
              width: 30,  // Increase the width of the image
            ),
            const SizedBox(
              width: 12, // Increase the spacing between the image and text
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center the text vertically
              crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
              children: [
                const SizedBox(height: 4), // Add some vertical space above the text
                Text(
                  categoryName,
                  style: const TextStyle(
                    fontSize: 18, // Increase the font size of the text
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Workspace',
                    color: Colors.black, // Change text color to white for better visibility
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}