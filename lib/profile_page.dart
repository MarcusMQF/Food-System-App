import 'package:flutter/material.dart';
import 'package:um_internal_hackathon/util/text_box.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _usernameController = TextEditingController(text: 'Marcus Mah');
  final TextEditingController _bioController = TextEditingController(text: 'empty bio');

  Future<void> editField(BuildContext context, String field, TextEditingController controller) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit $field"),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: "Enter new $field",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(controller.text);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    ).then((newValue) {
      if (newValue != null) {
        setState(() {
          controller.text = newValue;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 248, 242),
      appBar: AppBar(
        title: const Text('Profile Page'),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 40),
          const Icon(
            Icons.person,
            size: 72,
          ),
          const SizedBox(height: 10),
          const Text(
            'Marcus Mah',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto',
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 50),
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              'My Details',
              style: TextStyle(color: Color.fromARGB(255, 122, 122, 122)),
            ),
          ),
          MyTextBox(
            text: _usernameController.text,
            sectionName: 'Username',
            onPressed: () => editField(context, 'Username', _usernameController),
          ),
          MyTextBox(
            text: _bioController.text,
            sectionName: 'Bio',
            onPressed: () => editField(context, 'Bio', _bioController),
          ),
        ],
      ),
    );
  }
}