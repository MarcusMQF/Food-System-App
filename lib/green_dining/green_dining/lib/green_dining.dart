import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

@override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  int totalPoints = 0;
  bool rescue = false, pickup = false, delivery = false, utensils = false;
  void _rescue(){
    setState(() {
      rescue = !rescue;
    });
    rescue? totalPoints+=20: totalPoints-=20;
  }
  void _pickup(){
    setState(() {
      pickup = !pickup;
    });
    pickup? totalPoints+=15: totalPoints-=15;
  }
  void _delivery(){
    setState(() {
      delivery = !delivery;
    });
    delivery? totalPoints+=10: totalPoints-=10;
  }
  void _utensils(){
    setState(() {
      utensils = !utensils;
    });
    utensils? totalPoints+=5: totalPoints-=5;
  }

Widget _totalpts(int points) {
  return Container(
    color: const Color.fromRGBO(217, 217, 217, 1), // Correct color usage
    child: SizedBox(
      height: 40,
      width: 80,
      child: Center(
        child: Text(
          '$points',  
          style: GoogleFonts.jua(fontSize: 14, color: Colors.black),
        ),
      ),
    ),
    
  );
}


  Widget _buildRewardCard(String imageUrl, String title, String description, String points,) {
    return GestureDetector(
        onTap: _rescue,
    child: Container(
      decoration: BoxDecoration(
        color: const Color(0xB6FFF8AB),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            width: 32,
            height: 32,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.48,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.57,
                    color: Color(0xFF666666),
                  ),
                ),
                ...[
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color:rescue? const Color.fromARGB(255, 248, 171, 71): const Color(0xFF2C2C2C),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFF2C2C2C)),
                  ),
                  child: Text(
                    '+$points pts',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
              ],
            ),
          ),
        ],
      ),
    )
    );
  }

  Widget _buildRewardCard1(String imageUrl, String title, String description, String points,) {
    return GestureDetector(
        onTap: _pickup,
    child: Container(
      decoration: BoxDecoration(
        color: const Color(0xB6FFF8AB),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            width: 32,
            height: 32,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.48,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.57,
                    color: Color(0xFF666666),
                  ),
                ),
                ...[
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color:pickup? const Color.fromARGB(255, 248, 171, 71): const Color(0xFF2C2C2C),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFF2C2C2C)),
                  ),
                  child: Text(
                    '+$points pts',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
              ],
            ),
          ),
        ],
      ),
    )
    );
  }

  Widget _buildRewardCard2(String imageUrl, String title, String description, String points,) {
    return GestureDetector(
        onTap: _delivery,
    child: Container(
      decoration: BoxDecoration(
        color: const Color(0xB6FFF8AB),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            width: 32,
            height: 32,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.48,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.57,
                    color: Color(0xFF666666),
                  ),
                ),
                ...[
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color:delivery? const Color.fromARGB(255, 248, 171, 71): const Color(0xFF2C2C2C),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFF2C2C2C)),
                  ),
                  child: Text(
                    '+$points pts',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
              ],
            ),
          ),
        ],
      ),
    )
    );
  }

  Widget _buildRewardCard3(String imageUrl, String title, String description, String points,) {
    return GestureDetector(
        onTap: _utensils,
    child: Container(
      decoration: BoxDecoration(
        color: const Color(0xB6FFF8AB),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            width: 32,
            height: 32,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.48,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.57,
                    color: Color(0xFF666666),
                  ),
                ),
                ...[
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color:utensils? const Color.fromARGB(255, 248, 171, 71): const Color(0xFF2C2C2C),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFF2C2C2C)),
                  ),
                  child: Text(
                    '+$points pts',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
              ],
            ),
          ),
        ],
      ),
    )
    );
  }

@override
Widget build(BuildContext context) {
  return Directionality(
    textDirection: TextDirection.ltr,
    child: Scaffold(
    backgroundColor: const Color(0xFFE4FDE7),
    body: SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(19, 56, 19, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.jua(
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                        ),
                        children: const [
                          TextSpan(
                            text: 'Green ',
                            style: TextStyle(color: Color(0xFF3E9034)),
                          ),
                          TextSpan(
                            text: 'Dining ',
                            style: TextStyle(color: Color(0xFF3E9034)),
                          ),
                          TextSpan(
                            text: 'Rewards',
                            style: TextStyle(color: Color.fromARGB(255, 248, 171, 71)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32, top: 25),
                    child: Text(
                      "Together, let's make the Earth a better place!",
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 36),

                  _buildRewardCard(
                    "assets/rescue_meals_icon.png",
                    "\"Rescue Meals\"",
                    "Nearing end of shelf life, but guaranteed safe and fresh to be consumed.",
                    "20",
                  ),
                  const SizedBox(height: 22),
                  _buildRewardCard1(
                    "assets/pickup_icon.png",
                    "In-store pickup",
                    "Bring your own container when picking up!",
                    "15",
                  ),
                  const SizedBox(height: 22),
                  _buildRewardCard2(
                    "assets/delivery.png",
                    "\"Saver\" Delivery",
                    "Longer wait, lesser CO₂.",
                    "10",
                  ),
                  const SizedBox(height: 22),
                  _buildRewardCard3(
                    "assets/utensils.png",
                    "No utensils",
                    "Use your own utensils!",
                    "5",
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            right: 20,
            child: _totalpts(totalPoints), 
          ),
        ],
      ),
    ),
  ),
  );
}
}