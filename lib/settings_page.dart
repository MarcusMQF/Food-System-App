import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 248, 242),
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Make the title text bold
          ),
        ),
        centerTitle: true, // Center the title
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false, // This line removes the back arrow icon
      ),
      body: ListView(
        children: [
          const SizedBox(height: 100),
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              'Account',
              style: TextStyle(color: Color.fromARGB(255, 90, 90, 90)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.red),
              title: const Text(
                'Sign Out',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                // Add sign out logic here
              },
            ),
          ),
          const Divider(
            height: 20,
            thickness: 1,
            indent: 20,
            endIndent: 20,
            color: Color.fromARGB(255, 234, 228, 218),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              'Help & Support',
              style: TextStyle(color: Color.fromARGB(255, 90, 90, 90)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: ListTile(
              leading: const Icon(Icons.description),
              title: const Text('Disclaimer'),
              onTap: () {
                // Add disclaimer logic here
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text('Privacy Policy'),
              onTap: () {
                // Add privacy policy logic here
              },
            ),
          ),
          const Divider(
            height: 20,
            thickness: 1,
            indent: 20,
            endIndent: 20,
            color: Color.fromARGB(255, 234, 228, 218),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              'App Info',
              style: TextStyle(color: Color.fromARGB(255, 90, 90, 90)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: ListTile(
              leading: const Icon(Icons.info),
              title: const Text('App Version'),
              subtitle: const Text('1.1.2'),
              onTap: () {
                // Add app version logic here
              },
            ),
          ),
        ],
      ),
    );
  }
}