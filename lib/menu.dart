import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buy Food Button Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: BuyFoodButton(),
      ),
    );
  }
}

class BuyFoodButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        // Navigate to the SecondPage when the button is pressed
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SecondPage()),
        );
      },
      icon: Icon(Icons.add, color: Colors.white), // Plus icon
      label: Text('Buy food', style: TextStyle(color: Colors.white)), // Text label
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), backgroundColor: Colors.blue,
        textStyle: TextStyle(fontSize: 18), // Button background color
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cafe in UM'),
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
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // TextBox
            Container(
              width: 279,
              child: Stack(
                children: [
                  TextField(
                    enabled: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 12, right: 34),
                      filled: true,
                      fillColor: Colors.grey[200], // Light grey background
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(
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

            SizedBox(height: 16.0),

            // CustomButton
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                backgroundColor: Colors.blue, // Button background color
                minimumSize: Size(52, 44),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                elevation: 0,
              ).copyWith(
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (states) {
                    if (states.contains(MaterialState.hovered)) {
                      return Colors.blue[700];
                    }
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.blue[800];
                    }
                    return null; // Use the default value.
                  },
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back_ios_new_rounded, size: 20, color: Colors.white), // White icon
                ],
              ),
            ),
            const SizedBox(height: 10), // Add some spacing between the texts and the PageView
            SizedBox(
              height: 200, // Adjust the height as needed
              child: PageView.builder(
                controller: _pageController,
                physics: const PageScrollPhysics(), // Ensure swipe only moves to next/previous card
                itemCount: 4, // Number of cards
                itemBuilder: (context, index) {
                  return _buildCard(
                    color: [Colors.red, Colors.green, Colors.blue,Colors.red][index],
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
            Text(
              'KK12 NOVI Cafe',
              style: TextStyle(
                fontFamily: 'Archivo',
                fontSize: 14,
                height: 22 / 14,
                fontWeight: FontWeight.w600,
                color: Colors.black, // Black text
              ),
            ),

            SizedBox(height: 16.0),

            // TextWidget1
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

            SizedBox(height: 16.0),

            // ImageWidget1
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                // Additional properties can be added here
              ),
            ),

            SizedBox(height: 16.0),

            // MyTextWidget
            Container(
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

            SizedBox(height: 16.0),

            // MyTextWidget1
            Text(
              'RM 5.00',
              style: TextStyle(
                fontFamily: 'Archivo',
                fontSize: 12.0,
                height: 1.67, // line-height is typically expressed as a multiplier of font size
                fontWeight: FontWeight.w600,
                color: Colors.black, // Black text
              ),
            ),

            SizedBox(height: 16.0),

            // TextWidget2
            Container(
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

            SizedBox(height: 16.0),

            // MyTextWidget2
            Text(
              'RM 5.00',
              style: TextStyle(
                fontFamily: 'Archivo',
                fontSize: 12.0,
                height: 20.0 / 12.0, // line-height is relative to font-size
                fontWeight: FontWeight.w600,
                color: Colors.black, // Black text
              ),
            ),

            SizedBox(height: 16.0),

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

            SizedBox(height: 16.0),

            // ImageWidget2
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                // Add border properties here if needed
              ),
            ),

            SizedBox(height: 16.0),

            // TextStyleExample
            Text(
              'KK8 Cafe',
              style: TextStyle(
                fontFamily: 'Archivo',
                fontSize: 14,
                height: 1.57, // line-height is a ratio of font size
                fontWeight: FontWeight.w600,
                color: Colors.black, // Black text
              ),
            ),

            SizedBox(height: 16.0),

            // MyTextWidget3
            Text(
              'Fresh Meals',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 12,
                height: 20 / 12, // line-height in Dart is set via height
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

            SizedBox(height: 16.0),

            // ImageWidget3
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                // Add border properties here if needed
              ),
            ),

            SizedBox(height: 16.0),

            // TextWidget4
            Text(
              'Nasi Goreng USA',
              style: TextStyle(
                fontFamily: 'Archivo',
                fontSize: 12,
                height: 20 / 12,
                fontWeight: FontWeight.w400,
                color: Colors.black, // Black text
              ),
            ),

            SizedBox(height: 16.0),

            // TextWidget5
            Text(
              'RM 5.00',
              style: TextStyle(
                fontFamily: 'Archivo',
                fontSize: 12,
                height: 20 / 12,
                fontWeight: FontWeight.w600,
                color: Colors.black, // Black text
              ),
            ),

            SizedBox(height: 16.0),

            // ImageWidget4
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                // border: Border.all(...) // Uncomment for border styles
              ),
            ),

            SizedBox(height: 16.0),

            // TextStyleExample1
            Container(
              width: 157,
              child: Text(
                'Mee Celup',
                style: TextStyle(
                  fontFamily: 'Archivo',
                  fontSize: 12,
                  height: 20 / 12, // line-height
                  fontWeight: FontWeight.w400,
                  color: Colors.black, // Black text
                ),
              ),
            ),

            SizedBox(height: 16.0),

            // MyTextWidget4
            Text(
              'RM 5.00',
              style: TextStyle(
                fontFamily: 'Archivo',
                fontSize: 12,
                height: 20 / 12, // line-height
                fontWeight: FontWeight.w600,
                color: Colors.black, // Black text
              ),
            ),

            SizedBox(height: 16.0),

// TextStyleExample
            Text(
              'KK3 Cafe',
              style: TextStyle(
                fontFamily: 'Archivo',
                fontSize: 14,
                height: 1.57, // line-height is a ratio of font size
                fontWeight: FontWeight.w600,
                color: Colors.black, // Black text
              ),
            ),

            SizedBox(height: 16.0),

            // MyTextWidget3
            Text(
              'Fresh Meals',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 12,
                height: 20 / 12, // line-height in Dart is set via height
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

            SizedBox(height: 16.0),

            // ImageWidget3
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                // Add border properties here if needed
              ),
            ),

            SizedBox(height: 16.0),

            // TextWidget4
            Text(
              'Char Kuey Teow (Udang)',
              style: TextStyle(
                fontFamily: 'Archivo',
                fontSize: 12,
                height: 20 / 12,
                fontWeight: FontWeight.w400,
                color: Colors.black, // Black text
              ),
            ),

            SizedBox(height: 16.0),

            // TextWidget5
            Text(
              'RM 5.00',
              style: TextStyle(
                fontFamily: 'Archivo',
                fontSize: 12,
                height: 20 / 12,
                fontWeight: FontWeight.w600,
                color: Colors.black, // Black text
              ),
            ),

            SizedBox(height: 16.0),

            // ImageWidget4
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                // border: Border.all(...) // Uncomment for border styles
              ),
            ),

            SizedBox(height: 16.0),

            // TextStyleExample1
            Container(
              width: 157,
              child: Text(
                'Char Kuey Teow (Kerang)',
                style: TextStyle(
                  fontFamily: 'Archivo',
                  fontSize: 12,
                  height: 20 / 12, // line-height
                  fontWeight: FontWeight.w400,
                  color: Colors.black, // Black text
                ),
              ),
            ),

            SizedBox(height: 16.0),

            // MyTextWidget4
            Text(
              'RM 5.00',
              style: TextStyle(
                fontFamily: 'Archivo',
                fontSize: 12,
                height: 20 / 12, // line-height
                fontWeight: FontWeight.w600,
                color: Colors.black, // Black text
              ),
            ),

            SizedBox(height: 16.0),

            // TabBarMenu
            Container(
              alignment: Alignment.topLeft,
              width: 375,
              height: 48,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _tabBarMenuItem(context, true, 'Home', Icons.home),
                  _tabBarMenuItem(context, false, 'Search', Icons.search),
                  _tabBarMenuItem(context, false, 'Item 3', Icons.settings),
                  _tabBarMenuItem(context, false, 'Item 4', Icons.settings),
                  _tabBarMenuItem(context, false, 'Item 5', Icons.settings),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabBarMenuItem(BuildContext context, bool isSelected, String title, IconData icon) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 15.5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[200], // Blue background for selected, light grey for unselected
          borderRadius: BorderRadius.zero,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28, color: isSelected ? Colors.white : Colors.blue), // White icon for selected, blue for unselected
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                color: isSelected ? Colors.white : Colors.blue, // White text for selected, blue for unselected
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget TagItem({required bool isActive, required bool isDisabled, required Widget child}) {
    Color backgroundColor = isDisabled
        ? Colors.grey[200]!
        : isActive
        ? Colors.blue[100]!
        : Colors.grey[200]!;
    Color textColor = isDisabled ? Colors.grey[700]! : Colors.black;

    return GestureDetector(
      onTap: isDisabled ? null : () {},
      child: Container(
        height: 28,
        padding: EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: child,
            ),
          ],
        ),
      ),
    );
  }

  Widget TagItem3({required String label, required Color backgroundColor, required Color hoverColor, required Color pressedColor}) {
    return TagItem3Stateful(
      label: label,
      backgroundColor: backgroundColor,
      hoverColor: hoverColor,
      pressedColor: pressedColor,
    );
  }

  Widget TagItem4({required String text, required VoidCallback onPressed, required bool isDisabled}) {
    return GestureDetector(
      onTap: isDisabled ? null : onPressed,
      child: Container(
        height: 28,
        padding: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: isDisabled ? Colors.grey[200]! : Colors.grey[200]!,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              height: 20 / 12,
              fontWeight: FontWeight.w400,
              color: isDisabled ? Colors.grey[700]! : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget TagItem5() {
    return Container(
      height: 28,
      padding: EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.grey[200]!, // Light grey background
      ),
      child: Center(
        child: Text(
          'Near me', // Placeholder text
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 12,
            height: 20 / 12,
            fontWeight: FontWeight.w400,
            color: Colors.black, // Black text
          ),
        ),
      ),
    );
  }
}

class TagItem3Stateful extends StatefulWidget {
  final String label;
  final Color backgroundColor;
  final Color hoverColor;
  final Color pressedColor;

  const TagItem3Stateful({
    required this.label,
    required this.backgroundColor,
    required this.hoverColor,
    required this.pressedColor,
  });

  @override
  _TagItem3State createState() => _TagItem3State();
}

class _TagItem3State extends State<TagItem3Stateful> {
  bool isHovering = false;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => isPressed = true),
        onTapUp: (_) => setState(() => isPressed = false),
        onTapCancel: () => setState(() => isPressed = false),
        child: Container(
          height: 28,
          padding: EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            color: isPressed ? widget.pressedColor : (isHovering ? widget.hoverColor : widget.backgroundColor),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Center(
            child: Text(
              widget.label,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.black, // Black text
              ),
            ),
          ),
        ),
      ),
    );
  }
}