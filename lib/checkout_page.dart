import 'package:flutter/material.dart';
import 'package:um_internal_hackathon/home_page.dart';
import 'package:um_internal_hackathon/util/checkout_message.dart';

const String touchNGoImagePath = 'assets/images/tng-logo.png';
const String cashImagePath = 'assets/icons/cash-icon.png';
const String cardImagePath = 'assets/icons/credit-card-icon.png';

List<String> paymentOptions = ['TouchNGo','Cash', 'Card'];
List<String> deliveryOption = ['Green Delivery','Standard'];
List<double> deliveryFee = [3.00, 5.00];
List<int> deliveryDuration = [30, 10];
List<String> deliveryDescription = ['A more eco-friendly option.', 'Directly delivered to you.'];

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool isSwitched = false;
  String currentOption = paymentOptions[0];
  bool isDeliverySelected = false;
  String deliveryOptions = deliveryOption[0];

  void toggleDeliveryOption(bool? isDelivery) {
    if (isDelivery != null) {
      setState(() {
        isDeliverySelected = isDelivery;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: 
      Stack (
        children: [
          SingleChildScrollView (
          padding: const EdgeInsets.only(bottom: 90.0),
          child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                  onPressed: () => toggleDeliveryOption(true),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDeliverySelected ? const Color.fromARGB(255, 255, 255, 255) : const Color.fromARGB(255, 237, 237, 237),
                  ),
                  child: Text('Delivery',
                  style: 
                  TextStyle(
                    color: isDeliverySelected ? const Color.fromARGB(255,248, 171, 71) : Colors.grey,
                    fontWeight: isDeliverySelected ? FontWeight.bold : FontWeight.normal,
                  ),),
                ),
                const SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () => toggleDeliveryOption(false),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: !isDeliverySelected ? const Color.fromARGB(255, 255, 255, 255) : const Color.fromARGB(255, 237, 237, 237),
                  ),
                  child: Text('Pick-up',
                  style: TextStyle(
                    color: !isDeliverySelected ? const Color.fromARGB(255,248, 171, 71) : Colors.grey,
                    fontWeight: !isDeliverySelected ? FontWeight.bold : FontWeight.normal,
                  ),),
                ),
                  ],
                )
              ],
            ),
          ),
          if (isDeliverySelected)
            Container(
              margin: const EdgeInsets.only(bottom: 25),
              padding: const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 16, top: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: const Text(
                      'Delivery Option',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  deliveryOptionsMethod(deliveryOption[0], deliveryFee[0], deliveryDuration[0], deliveryDescription[0]),
                  deliveryOptionsMethod(deliveryOption[1], deliveryFee[1], deliveryDuration[1], deliveryDescription[1]),
                  //deliveryOptions('Standard', 10.00, 10, 'Directly delivered to you.'),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: 
                        const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/location.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Text('Delivery Address:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                    ],
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your address',
                      hintStyle: TextStyle(
                        fontSize: 13,
                      )
                    ),
                  ),
                ],
              ),
            ),
          if (!isDeliverySelected)
            Container(
              margin: const EdgeInsets.only(bottom: 25),
              padding: const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 16, top: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: const Text(
                      'Pick-up Details',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text('Pick-up Location:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter pick-up location',
                      hintStyle: TextStyle(
                        fontSize: 13,),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
                height: 20, // Height of the divider
                thickness: 3, // Thickness of the line
                color: Color.fromARGB(255, 234, 228, 218),
              ),
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
                  margin: const EdgeInsets.only(right: 16),
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
                margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 10, bottom: 35),  // Add margin around the container
                child: Column(
                  children: [
                    // Delivery fee
                    const Row(
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
                        if (isDeliverySelected)
                        const Row(
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
                        )
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
                        margin: const EdgeInsets.only(bottom: 13),
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: 
                              const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/icons/eco-icon.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Text('Eco-friendly options',
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
                        margin: const EdgeInsets.only(left: 16),
                        child: const Text('Total',
                        style: TextStyle(
                          fontSize: 18,
                        )),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 16),
                        child: const Text('RM12.90',
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

  Container deliveryOptionsMethod(String option, double fee, int duration, String description){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 168, 168, 168), // Border color
          width: 2.0, // Border width
        ),
        borderRadius: BorderRadius.circular(20.0), 
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(option,
                  style: 
                  const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),),
                  Container(
                    margin: const EdgeInsets.only(left: 16),
                    child: Text('<${duration.toString()} mins')
                  ),
                ],
              ),
              Text(description)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 6.5, right: 13),
                child: Text(fee.toStringAsFixed(2))),
              Radio<String>(
                value: option,
                groupValue: deliveryOptions,
                onChanged: (value) {
                  setState(() {
                    deliveryOptions = value!;
                  });
                },
                activeColor: const Color.fromARGB(255,248, 171, 71), // Color when selected
                fillColor: WidgetStateProperty.resolveWith<Color>(
                  (Set<WidgetState> states) {
                    if (states.contains(WidgetState.selected)) {
                      return const Color.fromARGB(255,248, 171, 71); // Color when selected
                    }
                    return Colors.grey; // Color when not selected
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Container paymentMethod(String imagePath, String paymentMethod) {
    return Container (
            margin: const EdgeInsets.symmetric(vertical: 6.0),
            padding: const EdgeInsets.symmetric(horizontal: 8),
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
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(paymentMethod)
                      ),
                    ],
                  ),
                  Radio<String>(
                    value: paymentMethod,
                    groupValue: currentOption,
                    onChanged: (value) {
                      setState(() {
                        currentOption = value!;
                      });
                    },
                    activeColor: const Color.fromARGB(255,248, 171, 71), // Color when selected
                    fillColor: WidgetStateProperty.resolveWith<Color>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.selected)) {
                          return const Color.fromARGB(255,248, 171, 71); // Color when selected
                        }
                        return Colors.grey; // Color when not selected
                      },
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
            preferredSize: const Size.fromHeight(4.0), // Adjust the height as needed
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