import 'package:flutter/material.dart';
import 'package:turisamapp/adharAuth/ProfilePageOtherData/Settings/AboutApp.dart';
import '../../Utils/Colors.dart';
import 'ChangePassword.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
        backgroundColor: appBarColor,

      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text("Change Password"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChangePasswordPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text("Notification Settings"),
            onTap: () {
              // Add functionality
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("About App"),
            onTap: () {
              // Add functionality

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutAppPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
