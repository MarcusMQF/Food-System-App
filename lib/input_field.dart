import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final bool isFocused;
  final ValueChanged<bool> onFocusChange;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final VoidCallback? onSuffixIconTap;

  const InputField({
    super.key,
    required this.hintText,
    required this.isFocused,
    required this.onFocusChange,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.onSuffixIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 320), // Set a maximum width for the input field
      child: Focus(
        onFocusChange: onFocusChange,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            border: Border.all(
              color: isFocused ? const Color.fromARGB(255, 250, 148, 135) : Colors.grey,
              width: isFocused ? 2.0 : 1.0,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              obscureText: obscureText, // Set obscureText based on the parameter
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Roboto', // Assuming you have added Roboto font
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Add content padding to push hint text to the right
                prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null, // Add prefixIcon if provided
                suffixIcon: suffixIcon != null ? GestureDetector(
                  onTap: onSuffixIconTap, // Add onTap callback for the suffix icon
                  child: Icon(suffixIcon),
                ) : null, // Add suffixIcon if provided
              ),
            ),
          ),
        ),
      ),
    );
  }
}