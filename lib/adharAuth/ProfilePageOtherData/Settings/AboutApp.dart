import 'package:flutter/material.dart';

import '../../../Utils/Colors.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About App"),
        centerTitle: true,
        backgroundColor: appBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "About This App",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              "This app is designed to help users manage their profile, "
                  "perform Aadhaar KYC verification, and access secure features "
                  "like password change and settings management.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              "Version:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              "1.0.0",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              "Developer:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Akshay & Chaitanya",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              "Contact:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              "chaitanyajadhva804@gmail.com",
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              "akshayfunde564@gmail.com",
              style: TextStyle(fontSize: 16),
            ),
            const Spacer(),

          ],
        ),
      ),
    );
  }
}
