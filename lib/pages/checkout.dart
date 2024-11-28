import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:um_internal_hackathon/home_page.dart';
import 'package:um_internal_hackathon/pages/checkout_message.dart';

const String touchNGoImagePath = 'assets/tng-logo.png';
const String cashImagePath = 'assets/icons/cash-icon.png';
const String cardImagePath = 'assets/icons/credit-card-icon.png';

List<String> options = ['TouchNGo','Cash', 'Card'];

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool isSwitched = false;
  String currentOption = options[0];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: 
      Stack (
        children: [
          SingleChildScrollView (
          padding: const EdgeInsets.only(bottom: 80.0),
          child: Column(
            children:[
              
              // order summary title
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Aligns children along the main axis (horizontal)
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(left: 32.0, right: 32.0, bottom: 16.0, top: 23), // Adds horizontal padding
                  child: Text("Order Summary",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
                ),
                Container(
                  margin: EdgeInsets.only(right: 16),
                  child: TextButton(
                    onPressed: () { 
                      // Navigate to the CheckoutPage when the button is clicked
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePage()),
                      );
                    },
                    child: const Text('Add more items',
                    style: TextStyle(
                      color: Color.fromARGB(255,248, 171, 71),
                    ),)
                    ),
                ),
                ],
              ),
              
              // order summary content 
              //order
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0), // Add padding around the container
                margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),  // Add margin around the container
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
                            child: const Text('Edit',
                            style: TextStyle(
                              color: Color.fromARGB(255,248, 171, 71),
                            ),)
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
                color: Color.fromARGB(255, 234, 228, 218), // Color of the line
                indent: 20, // Indent from the left
                endIndent: 20, // Indent from the right
              ),
              // payment details
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0), // Add padding around the container
                margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),  // Add margin around the container
                child: const Column(
                  children: [
                    // Delivery fee
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Subtotal(incl. Tax)',
                        style: TextStyle(
                          fontSize: 13,
                        ),),
                        Text('RM1.50',
                        style: TextStyle(
                          fontSize: 13,
                        ),),
                      ],
                     
                    ),
                    //subtotal
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Delivery fee',
                        style: TextStyle(
                          fontSize: 13,
                        ),),
                        Text('5.00',
                        style: TextStyle(
                          fontSize: 13,
                        ),),
                      ],
                    ),
                  ],
                ), 
              ),
              const Divider(
                height: 20, // Height of the divider
                thickness: 3, // Thickness of the line
                color: Color.fromARGB(255, 234, 228, 218),
              ),
              //Option for cutlery
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0), 
                margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0), 
                child: 
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 13),
                        child: const Row(
                          children: [
                            Text('Eco-friendly options',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                                              ),
                          ],
                        ),
                      ),
                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Request for cutlery',
                                textAlign: TextAlign.left,
                                ),
                              Text('Help us reduce plastic waste!',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 13,
                                color: Color.fromARGB(255, 138, 138, 138),
                              ),),
                            ],
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Switch(
                            value: isSwitched, 
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                              });
                            },
                            activeColor: const Color.fromARGB(255,248, 171, 71), // Color when the switch is on
                            inactiveThumbColor: Colors.grey, // Thumb color when the switch is off
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ),
              Container(
                padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 16.0, bottom: 13),
                margin: const EdgeInsets.only(top: 18.0), 
                width: double.infinity,
                color: const Color.fromARGB(255, 254, 247, 236),
                child: const Text(
                  'Payment details',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),),
              ),
              Container(
                color: const Color.fromARGB(255, 254, 247, 236),
                padding: const EdgeInsets.only(bottom: 40.0, left: 32, right: 32), 
                child: Column(
                  children: [
                    paymentMethod(touchNGoImagePath, 'TouchNGo'),
                    paymentMethod(cashImagePath, 'Cash'),
                    paymentMethod(cardImagePath, 'Card'),
                  ],
                ),
              )
            ],
          ),
        ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Text('Total',
                        style: TextStyle(
                          fontSize: 18,
                        )),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 16),
                        child: Text('RM12.90',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                      )
                    ],
                  ),
                  Container (
                    width: double.infinity,
                    margin: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          builder: (context) {
                            return const CheckoutMessageView();
                          });
                      },
                      style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255,248, 171, 71), 
                      elevation: 5, // Shadow elevation
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Rounded corners
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16), // Padding
                    ),
                      child: const Text('Place Order',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
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

  Container paymentMethod(String imagePath, String paymentMethod) {
    return Container (
            margin: EdgeInsets.symmetric(vertical: 6.0),
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: 
                Row (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ 
                    Row(
                    children: [
                      Container(
                        width: 40,
                        height: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(paymentMethod)
                      ),
                    ],
                  ),
                  Container (
                    child: Radio<String>(
                      value: paymentMethod,
                      groupValue: currentOption,
                      onChanged: (value) {
                        setState(() {
                          currentOption = value!;
                        });
                      },
                      activeColor: Color.fromARGB(255,248, 171, 71), // Color when selected
                      fillColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {
                          if (states.contains(WidgetState.selected)) {
                            return Color.fromARGB(255,248, 171, 71); // Color when selected
                          }
                          return Colors.grey; // Color when not selected
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

AppBar appBar(BuildContext context){
  return AppBar(
    title: const Text('Checkout',
    style: TextStyle(
      fontWeight: FontWeight.bold,
    ),),
    bottom: PreferredSize(
            preferredSize: Size.fromHeight(4.0), // Adjust the height as needed
            child: Container(
              color: const Color.fromARGB(255, 237, 237, 237), // Adjust the color as needed
              height: 4.0, // Adjust the height as needed
            ),
          ),
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 0.0,
  ); 
}