import 'package:flutter/material.dart';

import '../Utils/Colors.dart';
import '../pages/Home_Page.dart';
import 'ProfilePage.dart';

class VerificationSuccessPage extends StatelessWidget {
  final String aadhaarNumber;
  final String? name;
  final String? dob;

  const VerificationSuccessPage({
    Key? key,
    required this.aadhaarNumber,
    this.name,
    this.dob,
  }) : super(key: key);

  bool get _otpVerified => true;

  /// Mask Aadhaar number (xxxx xxxx 1234)
  String _maskAadhaar(String s) {
    if (s.length < 12) return s;
    return '${s.substring(0, 4)} xxxx xxxx ${s.substring(8)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Verification Success"),
        backgroundColor: appBarColor,

      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.verified, color: Colors.green, size: 80),
              const SizedBox(height: 16),
              const Text(
                "🎉 Aadhaar Verified Successfully!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              Text("Aadhaar: ${_maskAadhaar(aadhaarNumber)}",
                  style: const TextStyle(fontSize: 16)),

              if (name != null) ...[
                const SizedBox(height: 8),
                Text("Name: $name", style: const TextStyle(fontSize: 16)),
              ],
              if (dob != null) ...[
                const SizedBox(height: 8),
                Text("DOB: $dob", style: const TextStyle(fontSize: 16)),
              ],

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  if (_otpVerified) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                          (Route<dynamic> route) => false, // removes all previous routes
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please verify OTP first ❌")),
                    );
                  }
                },
                child: const Text("Continue"),
              )


            ],
          ),
        ),
      ),
    );
  }
}
