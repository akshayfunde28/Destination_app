import 'package:flutter/material.dart';
import 'package:turisamapp/Utils/Colors.dart';
import '../pages/Bottom_Navigation_Bar.dart';
import 'Aadhar.dart';
import 'ProfilePageOtherData/ChangePassword.dart';
import 'ProfilePageOtherData/Logout.dart';
import 'ProfilePageOtherData/Settings.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: appBarColor,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) =>  MainPage()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/img_1.png'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Chaitanya Jadhav',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'chaitanyajadhva804@gmail.com',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Add edit profile functionality
              },
              icon: const Icon(Icons.edit),
              label: const Text('Edit Profile'),
            ),
            const Divider(height: 40),

            /// Settings
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            ),

            /// Change Password
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

            /// Aadhaar KYC
            ListTile(
              leading: const Icon(Icons.verified_user),
              title: const Text("Aadhaar KYC"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AdharPage()),
                );
              },
            ),

            /// Logout
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LogoutPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
