import 'package:flutter/material.dart';

class RestaurantCards extends StatelessWidget {
  final String restaurantImagePath;
  final String rating;
  final String restaurantName;
  final String restaurantAdress;

  RestaurantCards({
    required this.restaurantImagePath,
    required this.rating,
    required this.restaurantName,
    required this.restaurantAdress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.black.withOpacity(0.8),
              Colors.black.withOpacity(0.6),
            ],
          ),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 1.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the column content
          children: [
            ClipOval(
              child: Image.asset(
                restaurantImagePath,
                height: 60, // Set a fixed height
                width: 60, // Set a fixed width
                fit: BoxFit.cover, // Ensure the image covers the area
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center the row content
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Text(
                  rating,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Adjust text color for visibility
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 10,
            ),

            Text(
              restaurantName,
              textAlign: TextAlign.center, // Center the text
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Adjust text color for visibility
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              restaurantAdress,
              textAlign: TextAlign.center, // Center the text
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.white, // Adjust text color for visibility
              ),
              maxLines: 5, // Allow up to 5 lines
              overflow: TextOverflow.ellipsis, // Add ellipsis if text overflows
            ),
          ],
        ),
      ),
    );
  }
}