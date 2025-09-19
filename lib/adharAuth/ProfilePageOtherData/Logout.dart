import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../pages/Bottom_Navigation_Bar.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Show the dialog after the widget builds
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        barrierDismissible: false, // prevent closing by tapping outside
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white,
          title: const Text(
            "Confirm Logout",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black87,
            ),
          ),
          content: const Text(
            "Are you sure you want to logout?",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          actionsPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black54,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage())); // Close dialog
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF20C9A5),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                SystemNavigator.pop(); // closes the app
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      );
    });

    return Scaffold(
      body: const Center(
        child: CircularProgressIndicator(), // optional loading indicator
      ),
    );
  }
}
