import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

SwitchWidget switchWidget() {
  return const SwitchWidget();
}

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({Key? key}) : super(key: key);

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
        activeColor: Color.fromARGB(255, 0, 108, 90), // Color when the switch is on
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
      appBar: appBar(),
      body: 
      Stack (
        children: [
          SingleChildScrollView (
          padding: EdgeInsets.all(16.0), // Add padding around the container
          child: Column(
            children:  <Widget> [
              // order summary title
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Aligns children along the main axis (horizontal)
              children: <Widget>[
                const Text('Order Summary',
                style: TextStyle(
                  fontSize: 20,
                ),),
                TextButton(
                  onPressed: () { 
          
                  },
                  child: const Text('Add more items')
                  ),
                ],
              ),
              // order summary content 
              //order
              Container(
                padding: EdgeInsets.all(16.0), // Add padding around the container
                margin: EdgeInsets.all(16.0),  // Add margin around the container
                decoration: BoxDecoration(
                  color: Colors.grey[200],     // Add a background color
                  borderRadius: BorderRadius.circular(8.0), // Add rounded corners
                  border: Border.all(color: Color.fromARGB(255, 0, 108, 90), width: 2.0), // Add a border
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text('1x'),
                        const SizedBox(width: 30.0),
                        const Text('Chicken Burger'),
                        SizedBox(width: 15.0),
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
              // payment details
              Container(
                padding: EdgeInsets.all(16.0), // Add padding around the container
                margin: EdgeInsets.all(16.0),  // Add margin around the container
                decoration: BoxDecoration(
                  color: Colors.grey[200],     // Add a background color
                  borderRadius: BorderRadius.circular(8.0), // Add rounded corners
                  border: Border.all(color: Color.fromARGB(255, 0, 108, 90), width: 2.0), // Add a border
                ),
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
              //Option for cutlery
              Container(
                padding: EdgeInsets.all(16.0), // Add padding around the container
                margin: EdgeInsets.all(16.0),  // Add margin around the container
                decoration: BoxDecoration(
                  color: Colors.grey[200],     // Add a background color
                  borderRadius: BorderRadius.circular(8.0), // Add rounded corners
                  border: Border.all(color: Color.fromARGB(255, 0, 108, 90), width: 2.0), // Add a border
                ),
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
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: const Color.fromARGB(255, 213, 224, 216),
                    padding: EdgeInsets.all(8.0),
                    child: const Text(
                      'Payment details',
                      style: TextStyle(
                        fontSize: 20,
                      ),),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('TouchNGo E-wallet'),
                      TextButton(
                        onPressed: () { 
                            
                          },  
                        child: SvgPicture.asset(
                          'assets/icons/left-arrow.svg',
                          height: 20,
                          width: 20
                      ),)
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
                      Text('Total'),
                      Text('RM12.90')
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
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16), // Padding
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

AppBar appBar(){
  return AppBar(
    title: const Text('Checkout'),
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 0.0,
    leading: 
      OutlinedButton(
        onPressed: () {
          // Action to perform when the leading widget is pressed
          print('Leading widget pressed');
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.white, width: 2), // Border color and width
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Rounded corners
          ),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Padding
        ),
        child: SvgPicture.asset(
          'assets/icons/left-arrow.svg',
          height: 20,
          width: 20,
        ),
      ),
    ); 
}