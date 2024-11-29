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




/*Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFE4FDE7),
      child: Directionality(
      textDirection: TextDirection.ltr,
      child: SafeArea(
        child: SingleChildScrollView(
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
                          style: TextStyle(color: Color(0xFFFF7260)),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32, top: 25),
                  child: Text(
                    textDirection: TextDirection.ltr,
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
                _buildRewardCard(
                  "assets/pickup_icon.png",
                  "In-store pickup",
                  "Bring your own container when picking up!",
                  "15",
                ),
                const SizedBox(height: 22),
                _buildRewardCard(
                  "assets/delivery.png",
                  "\"Saver\" Delivery",
                  "Longer wait, lesser CO₂.",
                  "10",
                ),
                const SizedBox(height: 22),
                _buildRewardCard(
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
            bottom: 20,
            right: 20,
            child: _totalpts(totalPoints),
      ),
      ],
      ),
      )
    );
  }*/
  /*Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Green Dining',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(255, 248, 171, 71)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Green Dining Rewards'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}*/
}