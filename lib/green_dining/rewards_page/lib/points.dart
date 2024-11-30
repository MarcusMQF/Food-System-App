import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/*class MyWidget extends StatefulWidget {

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool is_Redeemed = false;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}*/

class pointsTab extends StatefulWidget {
  final int totalPoints;
  final void Function(String reward, int points) onRedeem;
  
  const pointsTab({super.key, required this.totalPoints, required this.onRedeem});
  
  @override
  State<pointsTab> createState() => _pointsTabState();
}

class _pointsTabState extends State<pointsTab> {
  int get currentPoints => widget.totalPoints;

  /*int get currentPoints => totalPoints;
  void _updatePoints(int points){
    setState(() {
      totalPoints -= points;
    });
  }*/
  
  @override
  Widget build(BuildContext context) {
   return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(28, 74, 28, 131),
          child: Column(
            children: [
              Text(
                'Green Dining Points',
                style: GoogleFonts.jua(
                  fontSize: 36,
                  color: const Color(0xFF3E9034),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: 191,
                height: 191,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF8AB),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFF29A1E),
                    width: 6,
                  ),
                ),
                child: Center(
                    child: Text('${currentPoints}',             //THE POINTSSS need to link with green-dining page!
                    style: GoogleFonts.jua(fontSize: 50)),
                )
              ),
              const SizedBox(height: 38),
              RewardCard(
                discount: 'RM3 off',
                minSpend: 'Minimum spend RM7.',
                points: '300 pts',
                pointsValue: 300,
                checkPoints: () => widget.totalPoints,
                onRedeem: (points){
                  widget.onRedeem('RM3 off', points);
                },
              ),
              const SizedBox(height: 19),
              RewardCard(
                discount: 'RM5 off',
                minSpend: 'Minimum spend RM10.',
                points: '500 pts',
                pointsValue: 500,
                checkPoints: () => widget.totalPoints,
                onRedeem: (points){
                  widget.onRedeem('RM5 off', points);
                },
              ),
              const SizedBox(height: 19),
              RewardCard(
                discount: 'Free Delivery',
                minSpend: 'Minimum spend RM15.',
                points: ' 1000 pts',
                pointsValue: 1000,
                checkPoints: () => widget.totalPoints,
                onRedeem: (points){
                  widget.onRedeem('Free Delivery', points);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RewardCard extends StatefulWidget {
  final String discount;
  final String minSpend;
  final String points;
  final int pointsValue;
  final int Function() checkPoints;
  final void Function(int) onRedeem;

  const RewardCard({
    Key? key,
    required this.discount,
    required this.minSpend,
    required this.points,
    required this.pointsValue,
    required this.checkPoints,
    required this.onRedeem,
    }) : super(key: key);

  @override
  State<RewardCard> createState() => _RewardCardState();
}

class _RewardCardState extends State<RewardCard> {
  bool _isRedeemed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 31, 12, 19),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE3CD3D),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.discount,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      letterSpacing: 0.1,
                    ),
                  ),
                  Text(
                    widget.minSpend,
                    style: const TextStyle(
                      color: Color(0xFF606060),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.1,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: _isRedeemed || widget.pointsValue > widget.checkPoints()? null: () {
                  setState(() {
                    _isRedeemed = true;
                  });
                  widget.onRedeem(widget.pointsValue);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isRedeemed || widget.pointsValue > widget.checkPoints()? Colors.grey: const Color(0xFFF29A1E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                ),
                child: Text(
                  _isRedeemed? 'REDEEMED': 'REDEEM',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 21, top: 4),
              child: Text(
                widget.points,
                style: const TextStyle(
                  color: Color(0xFFF29A1E),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}