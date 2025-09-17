import 'package:flutter/material.dart';
import '../Utils/Colors.dart';
import 'VerificationSuccessPage.dart';

class OtpVerificationPage extends StatefulWidget {
  final String aadhaarNumber;
  final String generatedOtp; // ✅ OTP passed from AdharPage

  const OtpVerificationPage({
    Key? key,
    required this.aadhaarNumber,
    required this.generatedOtp,
  }) : super(key: key);

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final TextEditingController _otpController = TextEditingController();
  bool _loading = false;
  String? _message;
  bool _bypassOtp = false; // ✅ checkbox state

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  /// ✅ Verify OTP entered by user OR bypass if checkbox ticked
  Future<void> _verifyOtp() async {
    setState(() {
      _loading = true;
      _message = null;
    });

    await Future.delayed(const Duration(seconds: 1)); // simulate API delay

    if (_bypassOtp || _otpController.text == widget.generatedOtp) {
      // ✅ Directly navigate to success page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => VerificationSuccessPage(
            aadhaarNumber: widget.aadhaarNumber,
            name: "Chaitanya Jadhav", // replace with data from Aadhaar page
            dob: "2002-05-12",       // replace with data from Aadhaar page
          ),
        ),
      );
    } else {
      setState(() {
        _message = "Invalid OTP ❌";
      });
    }

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Verification"),
        backgroundColor: appBarColor,

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "We’ve sent an OTP to your registered email.",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              "Aadhaar: ${widget.aadhaarNumber}",
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),

            /// OTP input
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: const InputDecoration(
                labelText: "Enter OTP",
                border: OutlineInputBorder(),
              ),
              enabled: !_bypassOtp, // disable input if bypass checked
            ),

            const SizedBox(height: 10),

            /// ✅ Checkbox for bypass
            Row(
              children: [
                Checkbox(
                  value: _bypassOtp,
                  onChanged: (val) {
                    setState(() {
                      _bypassOtp = val ?? false;
                    });
                  },
                ),
                const Expanded(
                  child: Text(
                    "Bypass OTP verification (for testing/demo)",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// Verify button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _loading ? null : _verifyOtp,
                child: _loading
                    ? const SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
                    : const Text("Verify OTP"),
              ),
            ),

            const SizedBox(height: 12),

            if (_message != null)
              Row(
                children: [
                  Icon(
                    _message!.contains("✅")
                        ? Icons.check_circle_outline
                        : Icons.error_outline,
                    color: _message!.contains("✅") ? Colors.green : Colors.red,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _message!,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
