import 'package:flutter/material.dart';

class PaymentDetailsPage extends StatelessWidget {
  const PaymentDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: 
      Container(
        padding: const EdgeInsets.all(16.0), // Add padding around the container
        margin: const EdgeInsets.all(16.0),  // Add margin around the container
        child: Column(
          children: [
            Container (
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 231, 231, 231),
              ),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 40,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/icons/cash-icon.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0), // Adds horizontal padding
                    child: Text("Cash"),
                  ),
                ],
              ),
            ),
            Container (
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 231, 231, 231),
              ),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 40,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/icons/credit-card-icon.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0), // Adds horizontal padding
                    child: Text("Card"),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}

AppBar appBar(BuildContext context){
  return AppBar(
    title: const Text('Payment Method'),
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 0.0,
  ); 
}