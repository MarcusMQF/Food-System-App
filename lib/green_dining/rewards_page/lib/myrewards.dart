import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class myRewards extends StatelessWidget{
  final List<String> redeemedRewards;

  const myRewards({super.key, required this.redeemedRewards});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Rewards',
            style: GoogleFonts.jua(fontSize: 30, color: const Color(0xFF3E9034)),
          ),
          const SizedBox(height: 20),
          redeemedRewards.isEmpty
              ? Text('No rewards redeemed yet!',
                  style: GoogleFonts.jua(fontSize: 16, color: Colors.black54))
              : Column(
                  children: redeemedRewards.map((reward) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF8AB),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFFF29A1E)),
                      ),
                      child: Text(
                        reward,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }).toList(),
                ),
        ],
      ),
    );
  }
}
