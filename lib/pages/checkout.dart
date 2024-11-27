import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:um_internal_hackathon/home_page.dart';
import 'package:um_internal_hackathon/pages/payment_method_page.dart';

SwitchWidget switchWidget() {
  return const SwitchWidget();
}

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({super.key});

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Switch(
        value: isSwitched, 
        onChanged: (value) {
          setState(() {
            isSwitched = value;
          });
        },
        activeColor: const Color.fromARGB(255, 0, 108, 90), // Color when the switch is on
        inactiveThumbColor: Colors.grey, // Thumb color when the switch is off
      ),
    );
  }
}

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: 
      Stack (
        children: [
          SingleChildScrollView (
          child: Column(
            children:[
              // order summary title
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Aligns children along the main axis (horizontal)
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0), // Adds horizontal padding
                  child: Text("Order Summary",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
                ),
                TextButton(
                  onPressed: () { 
                    // Navigate to the CheckoutPage when the button is clicked
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  child: const Text('Add more items')
                  ),
                ],
              ),
              // order summary content 
              //order
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add padding around the container
                margin: const EdgeInsets.symmetric(horizontal: 16.0),  // Add margin around the container
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text('1x'),
                        const SizedBox(width: 30.0),
                        const Text('Chicken Burger'),
                        const SizedBox(width: 15.0),
                        TextButton(onPressed: () { 
                              
                            }, 
                            child: const Text('Edit')
                        ),
                      ]
                    ),
                    const SizedBox(width: 8.0),
                    const Text('1.50'),
                  ],
                ),
              ),
              const Divider(
                height: 20, // Height of the divider
                thickness: 2, // Thickness of the line
                color: Color.fromARGB(255, 221, 221, 221), // Color of the line
                indent: 20, // Indent from the left
                endIndent: 20, // Indent from the right
              ),
              // payment details
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add padding around the container
                margin: const EdgeInsets.symmetric(horizontal: 16.0),  // Add margin around the container
                child: const Column(
                  children: [
                    // Delivery fee
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Subtotal(incl. Tax)'),
                        Text('RM1.50'),
                      ],
                     
                    ),
                    //subtotal
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Delivery fee'),
                        Text('5.00'),
                      ],
                    ),
                  ],
                ), 
              ),
              const Divider(
                height: 20, // Height of the divider
                thickness: 2, // Thickness of the line
                color: Color.fromARGB(255, 221, 221, 221), // Color of the line
                indent: 20, // Indent from the left
                endIndent: 20, // Indent from the right
              ),
              //Option for cutlery
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add padding around the container
                margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),  // Add margin around the container
                
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text('Request for cutlery'),
                        Text('Reduce plastic waste!'),
                      ],
                    ),
                    SwitchWidget(),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 10.0),
                margin: const EdgeInsets.symmetric(vertical: 16.0), 
                width: double.infinity,
                color: const Color.fromARGB(255, 213, 224, 216),
                child: const Text(
                  'Payment details',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 16.0),
                            width: 60,
                            height: 30,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/tng-logo.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const Text("TouchNGo"),
                        ],
                      ), 
                      
                      TextButton(
                        onPressed: () { 
                          // Navigate to the PaymentMethodPage when the button is clicked
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PaymentDetailsPage()),
                          );
                        },  
                        child: const Text('Change payment method')
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total',
                      style: TextStyle(
                        fontSize: 16,
                      )),
                      Text('RM12.90',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ))
                    ],
                  ),
                  Container (
                    width: double.infinity,
                    margin: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                      },
                      style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 108, 90), 
                      elevation: 5, // Shadow elevation
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Rounded corners
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16), // Padding
                    ),
                      child: const Text('Place Order',
                      style: TextStyle(
                        color: Colors.white,
                      ),),
                    ),
                  ),
                ],
              ) 
            ),
          ),
        ],
      ),
    );
  }
}

AppBar appBar(BuildContext context){
  return AppBar(
    title: const Text('Checkout'),
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 0.0,
  ); 
}