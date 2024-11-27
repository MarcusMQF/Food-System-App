// home_page.dart
import 'package:flutter/material.dart';
import 'package:um_internal_hackathon/pages/checkout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 0, 95, 54),
            ),
            onPressed: () {
              // Navigate to the CheckoutPage when the button is clicked
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CheckoutPage()),
              );
            },
            child: const Text('Checkout',
            style: TextStyle(
              color: Colors.white,
            ),),
          ),
        ],
      ),
      body: const Center(
        child: Text('Welcome to the Home Page!'),
      ),
      
    );
  }
}