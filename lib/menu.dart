import 'package:flutter/material.dart';

void main() {
  runApp(SecondPage());
}



class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cafe in UM',),
      ),
      body: MainWidget(),
    );
  }
}

Widget _buildCard({required Color color, required String text}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0), // Adjust the horizontal padding
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 4.0,
      child: Container(
        width: 300, // Adjust the width of the card
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class MainWidget extends StatelessWidget {
  final PageController _pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.8, // Adjust this value to control how much of the next card is visible
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // TextBox
            SizedBox(
              width: 279,
              child: Stack(
                children: [
                  TextField(
                    enabled: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 12, right: 34),
                      filled: true,
                      fillColor: Colors.grey[200], // Light grey background
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      height: 1.57,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                    onTap: () {
                      // Handle focus
                    },
                  ),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Icon(
                      Icons.cancel, // Replace with your icon
                      size: 16,
                      color: Colors.grey[700], // Dark grey icon
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16.0),

            // CustomButton
            
            
            const SizedBox(height: 10), // Add some spacing between the texts and the PageView
            SizedBox(
              height: 20, // Adjust the height as needed
              child: PageView.builder(
                controller: _pageController,
                physics: const PageScrollPhysics(), // Ensure swipe only moves to next/previous card
                itemCount: 4, // Number of cards
                itemBuilder: (context, index) {
                  return _buildCard(
                    color: [const Color.fromARGB(255,248, 171, 71), const Color.fromARGB(255,248, 171, 71), const Color.fromARGB(255,248, 171, 71),const Color.fromARGB(255,248, 171, 71)][index],
                    text: [
                      'KK',
                      'Faculty',
                      'Favourites',
                      'Near me',
                    ][index],
                  );
                },
              ),
            ),

            

            // TextWidget
            Container(
      width: 300, // Set the width of the box
      height: 600, // Set the height of the box
      color: const Color.fromARGB(255,248, 171, 71), // Set the background color to blue
      padding: const EdgeInsets.all(16.0), // Add padding around the content
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'KK12 NOVI Cafe',
            style: TextStyle(
              fontFamily: 'Archivo',
              fontSize: 14,
              height: 22 / 14,
              fontWeight: FontWeight.w600,
              color: Colors.black, // Black text
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            'Fresh Meals',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              height: 20 / 12,
              fontWeight: FontWeight.w400,
              color: Colors.grey[700], // Dark grey text
            ),
          ),
          Image.network(
            'https://fastly.4sqi.net/img/general/600x600/15044970_pKt5pLsj9WsVOaGFFbMfnsvvEJbOPE0s-Qy9TMm_E5c.jpg',
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16.0),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              // Additional properties can be added here
            ),
          ),
          const SizedBox(height: 16.0),
          const SizedBox(
            width: 157,
            child: Text(
              'Nasi Goreng Pataya',
              style: TextStyle(
                fontFamily: 'Archivo',
                fontSize: 12,
                height: 20 / 12,
                fontWeight: FontWeight.w400,
                color: Colors.black, // Black text
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'RM 5.00',
            style: TextStyle(
              fontFamily: 'Archivo',
              fontSize: 12.0,
              height: 1.67, // line-height is typically expressed as a multiplier of font size
              fontWeight: FontWeight.w600,
              color: Colors.black, // Black text
            ),
          ),
          const SizedBox(height: 16.0),
          const SizedBox(
            width: 157,
            child: Text(
              'Nasi Goreng Thai',
              style: TextStyle(
                fontFamily: 'Archivo',
                fontSize: 12,
                height: 20 / 12,
                fontWeight: FontWeight.w400,
                color: Colors.black, // Black text
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'RM 5.00',
            style: TextStyle(
              fontFamily: 'Archivo',
              fontSize: 12.0,
              height: 20.0 / 12.0, // line-height is relative to font-size
              fontWeight: FontWeight.w600,
              color: Colors.black, // Black text
            ),
          ),
        ],
      ),
          
    ),
          

            const SizedBox(height: 16.0),

            // LineWidget
            Container(
              width: 335,
              height: 0,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[300]!, // Light grey border
                  width: 1,
                ),
              ),
              transform: Matrix4.rotationZ(0), // rotate(0deg)
            ),

            const SizedBox(height: 16.0),

            // ImageWidget2
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                // Add border properties here if needed
              ),
            ),

            const SizedBox(height: 16.0),

            // TextStyleExample
            Container(
      width: 300, // Set the width of the box
      height: 600, // Set the height of the box
      color: const Color.fromARGB(255,248, 171, 71), // Set the background color to blue
      padding: const EdgeInsets.all(16.0), // Add padding around the content
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'KK8 Cafe',
            style: TextStyle(
              fontFamily: 'Archivo',
              fontSize: 14,
              height: 22 / 14,
              fontWeight: FontWeight.w600,
              color: Colors.black, // Black text
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            'Fresh Meals',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              height: 20 / 12,
              fontWeight: FontWeight.w400,
              color: Colors.grey[700], // Dark grey text
            ),
          ),
          Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSv_DuVO2bHFYDJkJ4uK2xDCYkYcF1QvAPTMi_hntRKJU2hEj0DSwjEvTNd0uNOHScw38M&usqp=CAU',
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16.0),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              // Additional properties can be added here
            ),
          ),
          const SizedBox(height: 16.0),
          const SizedBox(
            width: 157,
            child: Text(
              'Nasi Goreng USA',
              style: TextStyle(
                fontFamily: 'Archivo',
                fontSize: 12,
                height: 20 / 12,
                fontWeight: FontWeight.w400,
                color: Colors.black, // Black text
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'RM 5.00',
            style: TextStyle(
              fontFamily: 'Archivo',
              fontSize: 12.0,
              height: 1.67, // line-height is typically expressed as a multiplier of font size
              fontWeight: FontWeight.w600,
              color: Colors.black, // Black text
            ),
          ),
          const SizedBox(height: 16.0),
          const SizedBox(
            width: 157,
            child: Text(
              'Mee Celup',
              style: TextStyle(
                fontFamily: 'Archivo',
                fontSize: 12,
                height: 20 / 12,
                fontWeight: FontWeight.w400,
                color: Colors.black, // Black text
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'RM 5.00',
            style: TextStyle(
              fontFamily: 'Archivo',
              fontSize: 12.0,
              height: 20.0 / 12.0, // line-height is relative to font-size
              fontWeight: FontWeight.w600,
              color: Colors.black, // Black text
            ),
          ),
        ],
      ),
          
    ),

            const SizedBox(height: 16.0),

// TextStyleExample
            const Text(
              'KK3 Cafe',
              style: TextStyle(
                fontFamily: 'Archivo',
                fontSize: 14,
                height: 1.57, // line-height is a ratio of font size
                fontWeight: FontWeight.w600,
                color: Colors.black, // Black text
              ),
            ),

            const SizedBox(height: 16.0),

            // MyTextWidget3
            Container(
      width: 300, // Set the width of the box
      height: 600, // Set the height of the box
      color: const Color.fromARGB(255,248, 171, 71), // Set the background color to blue
      padding: const EdgeInsets.all(16.0), // Add padding around the content
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'KK12 NOVI Cafe',
            style: TextStyle(
              fontFamily: 'Archivo',
              fontSize: 14,
              height: 22 / 14,
              fontWeight: FontWeight.w600,
              color: Colors.black, // Black text
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            'Fresh Meals',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              height: 20 / 12,
              fontWeight: FontWeight.w400,
              color: Colors.grey[700], // Dark grey text
            ),
          ),
          Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT08frinqxfzvUuELG_r4XKKe3EE_dgFbyh_8U4C_861y3QQtKtlBaEvPTP6ZAzlnhKIu8&usqp=CAU',
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16.0),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              // Additional properties can be added here
            ),
          ),
          const SizedBox(height: 16.0),
          const SizedBox(
            width: 157,
            child: Text(
              'Char Keuy Teow (Udang)',
              style: TextStyle(
                fontFamily: 'Archivo',
                fontSize: 12,
                height: 20 / 12,
                fontWeight: FontWeight.w400,
                color: Colors.black, // Black text
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'RM 5.00',
            style: TextStyle(
              fontFamily: 'Archivo',
              fontSize: 12.0,
              height: 1.67, // line-height is typically expressed as a multiplier of font size
              fontWeight: FontWeight.w600,
              color: Colors.black, // Black text
            ),
          ),
          const SizedBox(height: 16.0),
          const SizedBox(
            width: 157,
            child: Text(
              'Char Kuey Teow (Kerang)',
              style: TextStyle(
                fontFamily: 'Archivo',
                fontSize: 12,
                height: 20 / 12,
                fontWeight: FontWeight.w400,
                color: Colors.black, // Black text
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'RM 5.00',
            style: TextStyle(
              fontFamily: 'Archivo',
              fontSize: 12.0,
              height: 20.0 / 12.0, // line-height is relative to font-size
              fontWeight: FontWeight.w600,
              color: Colors.black, // Black text
            ),
          ),
        ],
      ),
          
    ),
            const SizedBox(height: 16.0),

            // ImageWidget4
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                // border: Border.all(...) // Uncomment for border styles
              ),
            ),

            const SizedBox(height: 16.0),


            // TabBarMenu
            
          ],
        ),
      ),
    );
  }
}