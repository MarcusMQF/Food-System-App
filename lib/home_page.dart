import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.8, // Adjust this value to control how much of the next card is visible
  );

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 248, 242),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          color: Color.fromARGB(255, 36, 35, 35),
        ),
        title: const Text(
          'Campus Eats!',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromARGB(255, 36, 35, 35),
            fontSize: 25,
            fontWeight: FontWeight.w700,
            fontFamily: 'TodayShow'
          ),
        ),
      ),

      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, ',
                      style: TextStyle(
                        color: Color.fromARGB(255, 36, 35, 35),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Roboto'
                      ),
                    ),
                    Text(
                      'Marcus! 👋',
                      style: TextStyle(
                        color: Color.fromARGB(255, 177, 76, 73), // Different color for "Marcus"
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Roboto'
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5), // Add some spacing between the texts
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    color: Color.fromARGB(255, 36, 35, 35),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto'
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20), // Add some spacing between the texts and the PageView
          SizedBox(
            height: 200, // Adjust the height as needed
            child: PageView.builder(
              controller: _pageController,
              physics: const PageScrollPhysics(), // Ensure swipe only moves to next/previous card
              itemCount: 3, // Number of cards
              itemBuilder: (context, index) {
                return _buildCard(
                  color: [Colors.red, Colors.green, Colors.blue][index],
                  text: [
                    'Want a Pharmacy in UM?\nTAKE A QUICK SURVEY TO SHARE YOUR THOUGHTS',
                    'UNIVERSITI\nMALAYA\nMALAM ALUMNI\nUNIVERSITIMALAYA\n17DISTABER2024DEWANTUNKUCANSELOR',
                    'Card 3',
                  ][index],
                );
              },
            ),
          ),
        ],
      ),
      
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              //Color.fromARGB(255, 255, 178, 78),
              //Color.fromARGB(255, 255, 140, 0),
              Color.fromARGB(243, 255, 114, 96),
              Color.fromARGB(255, 255, 178, 78),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 8,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),

        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: GNav(
            backgroundColor: Colors.transparent, // Make the background transparent
            color: Colors.black,
            activeColor: Colors.black,
            tabBackgroundColor: Color.fromARGB(255, 255, 229, 229),
            gap: 8,
            padding: EdgeInsets.all(16),
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.shopping_cart,
                text: 'Cart',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
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
}