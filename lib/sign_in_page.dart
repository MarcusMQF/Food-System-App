import 'package:flutter/material.dart';
import 'input_field.dart'; // Import the InputField widget
import 'home_page.dart'; // Import the HomePage widget

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
  bool _isLoading = false; // Add this boolean to manage loading state

  Future<void> _validateCredentials() async {
    setState(() {
      _isLoading = true; // Start loading animation
    });

    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay

    setState(() {
      _isLoading = false; // Stop loading animation
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
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

              const SizedBox(height: 35),
              ElevatedButton(
                onPressed: _isLoading ? null : _validateCredentials,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(243, 255, 114, 96), 
                  minimumSize: const Size(320, 50), // Increase the width and height of the button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0), // Reduce the curve of the button
                  ),
                ),
                child: _isLoading 
                  ? const CircularProgressIndicator(color: Colors.white) 
                  : const Text('Login',
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