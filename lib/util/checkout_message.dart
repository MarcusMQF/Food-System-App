import 'package:flutter/material.dart';
import 'package:food_system_app/home_page.dart';

class CheckoutMessageView extends StatefulWidget {
  const CheckoutMessageView({super.key});

  @override
  State<CheckoutMessageView> createState() => _CheckoutMessageViewState();
}

class _CheckoutMessageViewState extends State<CheckoutMessageView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return  Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      width: media.width,
      height: 400,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)
        )
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30),
            width: 120,
            height: 120,
            decoration: 
            const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/order-completed.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: const Text('Thank You for your order!',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),),
          ),
          const Text('We will notify you once your order has arrived.'),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30),
            child: TextButton(onPressed: () { 
                      // Navigate to the homepage when the button is clicked
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePage()),
                      );
                    }, child: const Text('Back to home page',
                    style: TextStyle(
                      color: Color.fromARGB(255,248, 171, 71),
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                    ),),
            ),
          )
        ],
      ),
    );
  }
}