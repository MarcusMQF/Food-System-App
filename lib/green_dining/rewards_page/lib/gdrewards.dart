import 'package:flutter/material.dart';
import 'points.dart';
import 'myrewards.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rewards Page',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 248, 171, 71)),
        useMaterial3: true,
      ),
      home: GDRewards(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GDRewards extends StatefulWidget {
  @override
  _GDRewardsState createState() => _GDRewardsState();
}

class _GDRewardsState extends State<GDRewards> {
  int totalPoints = 1000;
  List<String> redeemedRewards = [];

  void _redeemPoints(String reward, int points){
    setState(() {
      if (totalPoints >= points){
        totalPoints -= points;
        redeemedRewards.add(reward);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: const Color.fromARGB(255, 248, 171, 71),
          centerTitle: true,
          title: Text('Green Dining Rewards',
          style: GoogleFonts.jua(fontSize: 40),),
        ),
        body: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.card_giftcard,
                    color: Colors.black,
                  ),
                ),
              Tab(
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
              pointsTab(
                totalPoints: totalPoints,
                onRedeem: _redeemPoints,
              ),
              myRewards(redeemedRewards: redeemedRewards),  
            ]
            ),
          )
        ],
      ),
    )
    );
  }
}


 /* @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 248, 171, 71),
        centerTitle: true,
 
        title: Text(widget.title,
        style: GoogleFonts.jua(fontSize: 40, color: Colors.black)),
      ),
      body: Center(

      ),
 // This trailing comma makes auto-formatting nicer for build methods.
    );
  }*/

