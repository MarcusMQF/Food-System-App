import 'package:flutter/material.dart';
import 'package:um_internal_hackathon/home_page.dart';
import 'package:um_internal_hackathon/pages/checkout.dart';
import 'package:um_internal_hackathon/sign_in_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Eats',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const SignInPage(),
      home: const SignInPage(),
    );
    
  }
}