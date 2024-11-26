import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:csv/csv.dart';
import 'input_field.dart'; // Import the InputField widget

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isSiswaIdFocused = false;
  bool _isPasswordFocused = false;
  bool _isPasswordVisible = false; // Add this boolean to manage password visibility

  final TextEditingController _siswaIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final Map<String, String> _credentials = {};
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _loadCredentials();
  }

  Future<void> _loadCredentials() async {
    final String csvString = await rootBundle.loadString('assets/credentials.csv');
    final List<List<dynamic>> csvTable = const CsvToListConverter().convert(csvString);

    for (var i = 1; i < csvTable.length; i++) {
      final String siswaId = csvTable[i][0].toString();
      final String password = csvTable[i][1].toString();
      _credentials[siswaId] = password;
      print('Loaded credential: siswaId=$siswaId, password=$password');
    }

    // Debug print to verify credentials
    print('Loaded credentials: $_credentials');
  }

  void _validateCredentials() {
    final String siswaId = _siswaIdController.text;
    final String password = _passwordController.text;

    setState(() {
      if (_credentials.containsKey(siswaId) && _credentials[siswaId] == password) {
        _errorMessage = '';
        // Credentials are valid, navigate to the next screen or perform an action
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login successful')),
        );
      } else {
        // Credentials are invalid, show an error message
        _errorMessage = 'Invalid Password';
      }
    });

    // Debug print to verify input
    print('Entered siswaId: $siswaId, password: $password');
    print('Credentials map: $_credentials');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Transform.translate(
          offset: const Offset(0, 50), // Adjust the y value to shift the content down
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.translate(
                offset: const Offset(0, -35), // Adjust the y value to shift the text up
                child: const Text(
                  'Welcome to',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Roboto', 
                  ),
                ),
              ),

              Transform.translate(
                offset: const Offset(0, -40), // Adjust the y value to shift the text up
                child: const Text(
                  'Campus Eats!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    color: Color.fromARGB(255, 248, 171, 71),
                    fontWeight: FontWeight.w800,
                    fontFamily: 'TodayShow', 
                  ),
                ),
              ),

              Transform.translate(
                offset: const Offset(0, -20), // Adjust the y value to shift the text up
                child: const Text(
                  'Dining made easy on UM campus',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black, 
                    fontWeight: FontWeight.w200,
                    fontFamily: 'AwesomeFriday', 
                  ),
                ),
              ),

              const SizedBox(height: 16),
              InputField(
                hintText: 'Enter SISWAMAIL ID',
                isFocused: _isSiswaIdFocused,
                onFocusChange: (focused) {
                  setState(() {
                    _isSiswaIdFocused = focused;
                  });
                },
                prefixIcon: Icons.email, // Add envelope icon
              ),

              const SizedBox(height: 8), // Add some space between the input field and the text
              const Padding(
                padding: EdgeInsets.only(left: 25.0), // Adjust the left padding to align with the left side of the SizedBox border
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Without @um.edu.my/siswa.um.edu.my',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20), 
              InputField(
                hintText: 'Enter Your Password',
                isFocused: _isPasswordFocused, 
                onFocusChange:(focused){
                  setState(() {
                    _isPasswordFocused = focused;
                  });
                },
                prefixIcon: Icons.lock, // Add lock icon
                suffixIcon: _isPasswordVisible ? Icons.visibility : Icons.visibility_off, // Add eye icon
                obscureText: !_isPasswordVisible, // Set obscureText based on password visibility
                onSuffixIconTap: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible; // Toggle password visibility
                  });
                },
              ),

              if (_errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    _errorMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),

              const SizedBox(height: 35),
              ElevatedButton(
                onPressed: _validateCredentials,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(243, 255, 114, 96), 
                  minimumSize: const Size(320, 50), // Increase the width and height of the button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0), // Reduce the curve of the button
                  ),
                ),
                child: const Text('Login',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Roboto',
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 16),
              const Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}