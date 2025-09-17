import 'dart:io';
import 'dart:math'; // ✅ for Random OTP
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:turisamapp/Utils/Colors.dart';
import 'OtpVerificationPage.dart';
import 'dart:convert';

class AdharPage extends StatefulWidget {
  const AdharPage({Key? key}) : super(key: key);

  @override
  State<AdharPage> createState() => _AdharPageState();
}

class _AdharPageState extends State<AdharPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _aadhaarController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  File? _aadhaarImage;
  bool _loading = false;
  String? _verificationMessage;
  String? _generatedOtp; // ✅ to store OTP for verification later
  bool _sendEmail = false; // ✅ checkbox state

  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    _aadhaarController.dispose();
    _nameController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  /// ✅ Generate random 6-digit OTP
  String _generateOtp([int length = 6]) {
    final random = Random();
    String otp = '';
    for (int i = 0; i < length; i++) {
      otp += random.nextInt(10).toString();
    }
    return otp;
  }

  String _maskAadhaar(String s) {
    if (s.length < 12) return s;
    return '${s.substring(0, 4)} **** **** ${s.substring(8)}';
  }

  Future<void> _pickImage() async {
    try {
      final XFile? file = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 70,
      );
      if (file == null) return;
      setState(() {
        _aadhaarImage = File(file.path);
      });
    } catch (e) {
      debugPrint('Image pick error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not pick image')),
      );
    }
  }

  /// 🔑 API call with headers and body
  Future<void> _sendVerificationRequest() async {
    setState(() {
      _loading = true;
      _verificationMessage = null;
    });

    // ✅ Generate OTP here
    _generatedOtp = _generateOtp();

    if (_sendEmail) {
      // ✅ If checkbox checked → send OTP email
      try {
        final uri = Uri.parse(
            "https://notification-microservice-1-vuj3.onrender.com/api/notifications");

        final resp = await http.post(
          uri,
          headers: {
            "Content-Type": "application/json",
            "x-api-key":
            "7BvYxF9q2z0sD1k9L6hP3m8Xv4Qw9a2R5uX8vC1eN4fG7jK0lM3pS6tY9wZ2",
          },
          body: jsonEncode({
            "type": "email",
            "recipient": "jadhavchaitanya804@gmail.com",
            "message": "Your OTP for Aadhaar verification is $_generatedOtp",
          }),
        );

        if (resp.statusCode == 200) {
          setState(() {
            _verificationMessage = "OTP sent successfully ✅";
          });

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OtpVerificationPage(
                aadhaarNumber: _aadhaarController.text,
                generatedOtp: _generatedOtp!,
              ),
            ),
          );
        } else {
          setState(() {
            _verificationMessage =
            "Failed to send OTP ❌ (Code: ${resp.statusCode}, Body: ${resp.body})";
          });
        }
      } catch (e) {
        setState(() {
          _verificationMessage = "Error: $e";
        });
      } finally {
        setState(() {
          _loading = false;
        });
      }
    } else {
      // ✅ If checkbox not checked → bypass email, go directly
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OtpVerificationPage(
            aadhaarNumber: _aadhaarController.text,
            generatedOtp: _generatedOtp!,
          ),
        ),
      );
      setState(() {
        _loading = false;
      });
    }
  }

  String? _aadhaarValidator(String? value) {
    if (value == null || value.isEmpty) return 'Enter Aadhaar number';
    if (value.length != 12) return 'Aadhaar must be 12 digits';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aadhaar Verification'),
        backgroundColor: appBarColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Enter Aadhaar details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),

              /// Aadhaar number
              TextFormField(
                controller: _aadhaarController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(12),
                ],
                decoration: const InputDecoration(
                  labelText: 'Aadhaar Number',
                  hintText: '123412341234',
                  border: OutlineInputBorder(),
                ),
                validator: _aadhaarValidator,
              ),
              const SizedBox(height: 8),

              if (_aadhaarController.text.isNotEmpty)
                Text('Preview: ${_maskAadhaar(_aadhaarController.text)}'),

              const SizedBox(height: 16),

              /// Name
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Full name (as on Aadhaar)',
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                (v == null || v.isEmpty) ? 'Enter name' : null,
              ),

              const SizedBox(height: 16),

              /// DOB
              TextFormField(
                controller: _dobController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Date of Birth',
                  hintText: 'YYYY-MM-DD',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: () async {
                  final dt = await showDatePicker(
                    context: context,
                    initialDate: DateTime(1995, 1, 1),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (dt != null) {
                    _dobController.text =
                    "${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}";
                  }
                },
                validator: (v) => (v == null || v.isEmpty) ? 'Select DOB' : null,
              ),

              const SizedBox(height: 20),

              /// Aadhaar image capture
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: _pickImage,
                    icon: const Icon(Icons.camera_alt),
                    label: const Text('Capture Aadhaar Photo'),
                  ),
                  const SizedBox(width: 12),
                  if (_aadhaarImage != null)
                    const Expanded(child: Text('Image ready'))
                  else
                    const Expanded(child: Text('No image selected')),
                ],
              ),

              if (_aadhaarImage != null)
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      _aadhaarImage!,
                      width: 200,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

              const SizedBox(height: 20),

              /// Checkbox for sending email
              CheckboxListTile(
                value: _sendEmail,
                onChanged: (val) {
                  setState(() {
                    _sendEmail = val ?? false;
                  });
                },
                title: const Text("Send OTP via Email"),
              ),

              /// Verify Aadhaar Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _loading ? null : _sendVerificationRequest,
                  child: _loading
                      ? const SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                      : const Text('Verify Aadhaar'),
                ),
              ),

              const SizedBox(height: 12),

              if (_verificationMessage != null)
                Row(
                  children: [
                    Icon(
                      _verificationMessage!.contains('✅')
                          ? Icons.check_circle_outline
                          : Icons.error_outline,
                      color: _verificationMessage!.contains('✅')
                          ? Colors.green
                          : Colors.red,
                    ),
                    const SizedBox(width: 8),
                    Expanded(child: Text(_verificationMessage!)),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
