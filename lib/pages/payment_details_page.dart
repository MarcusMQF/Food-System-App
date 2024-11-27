import 'package:flutter/material.dart';

class PaymentDetailsPage extends StatelessWidget {
  const PaymentDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: 
      Container(
        padding: EdgeInsets.all(16.0), // Add padding around the container
        margin: EdgeInsets.all(16.0),  // Add margin around the container
        child: const Column(
          children: [
            Row(
              children: [
                Text('Cash'),
              ],
            ),
            Row(
              children: [
                Text('Cards'),
              ],
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