import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:food_system_app/checkout_page.dart';
import 'package:food_system_app/profile_page.dart';
import 'package:food_system_app/settings_page.dart';
import 'package:food_system_app/util/category_cards.dart';
import 'package:food_system_app/util/restaurants_cards.dart';
import 'package:lottie/lottie.dart'; 
import 'package:food_system_app/menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

    final List<Widget> _pages = [
      const HomePage(),
      const CheckoutPage(),
      const ProfilePage(),
      const SettingsPage(),
    ];

    void _onTabTapped(int index) {
      setState(() {
        _currentIndex = index;
      });
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 248, 242),
      body:
      _currentIndex == 0? 
       SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello,',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Your Name',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 153, 48, 0),
                          fontFamily: 'TodayShow',
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 248, 171, 71),
                      borderRadius: BorderRadius.circular(150.0),
                    ),
                    child: const Icon(Icons.person),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.grey.shade800,
                      Colors.black,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Lottie.network('https://lottie.host/7df65c1a-2869-434a-b1ff-8d3582f2ac21/ICYuS5VWB8.json'),
                    ),
                    const SizedBox(width: 25),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Explore Cafes in UM',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'Campus cafe directory',
                          style: TextStyle(
                            fontFamily: 'StudyClash',
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.orange,
                                Colors.deepOrange,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.orange.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SecondPage()),
                              );
                            },
                            child: const Center(
                              child: Text(
                                'Take a Look',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 233, 233, 233),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          border: InputBorder.none,
                          hintText: 'How can we help you?',
                          contentPadding: EdgeInsets.symmetric(vertical: 12.0), // Add vertical padding
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 248, 171, 71),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: const Icon(Icons.qr_code_scanner),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryCard(
                    categoryName: 'Green Dining',
                    iconImagePath: 'assets/images/green.png',
                  ),
                  CategoryCard(
                    categoryName: 'Food Waste',
                    iconImagePath: 'assets/images/stink.png', 
                  ),
                  CategoryCard(
                    categoryName: 'Rewards Program',
                    iconImagePath: 'assets/images/medal.png'
                  ),
                  SizedBox(width: 20),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Restaurants list',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      color: Color.fromARGB(255, 116, 116, 116),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  SizedBox(
                    width: 200, // Set the width of each card
                    child: RestaurantCards(
                      restaurantImagePath: 'assets/images/kimseng.png',
                      rating: '4.5',
                      restaurantName: 'Kim Seng Restaurant',
                      restaurantAdress: '607, Jalan 17/10, Seksyen 17, 46400 Petaling Jaya, Selangor',
                    ),
                  ),
                  SizedBox(
                    width: 200, // Set the width of each card
                    child: RestaurantCards(
                      restaurantImagePath: 'assets/images/khasiat.png',
                      rating: '4.0',
                      restaurantName: 'Khasiat Delivery',
                      restaurantAdress: 'G023A Dataran Millennium PJ, Jalan 14/1, Petaling Jaya, Selangor',
                    ),
                  ),
                  SizedBox(
                    width: 200, // Set the width of each card
                    child: RestaurantCards(
                      restaurantImagePath: 'assets/images/supabowl.png',
                      rating: '4.3',
                      restaurantName: 'SUPA Bowl Vege',
                      restaurantAdress: 'Cafeteria, Bestari Residential College (KK4), Universiti Malaya',
                    ),
                  ),
                  SizedBox(width: 20),
                ],
              ),
            ),

            // Add a SizedBox to create a gap between the last card and the bottom navigation bar
            const SizedBox(height: 20),
          ],
        ),
      )
      : _pages[_currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: GNav(
          backgroundColor: Colors.transparent,
          color: Colors.black,
          activeColor: Colors.black,
          tabBackgroundColor: const Color.fromARGB(255, 248, 171, 71),
          gap: 8,
          padding: const EdgeInsets.all(16),
          selectedIndex: _currentIndex,
          onTabChange: _onTabTapped,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.shopping_cart,
              text: 'Checkout',
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
      
    );
  }
}
