import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false;
  String responseMessage = "";

  Future<void> sendNotification() async {
    final String email = emailController.text.trim();

    if (email.isEmpty) {
      setState(() {
        responseMessage = "Please enter an email.";
      });
      return;
    }

    setState(() {
      isLoading = true;
      responseMessage = "";
    });

    const String apiUrl =
        "https://notification-microservice-1-vuj3.onrender.com/api/notifications";

    final Map<String, dynamic> body = {
      "type": "email",
      "recipient": email,
      "message": "Hello! This is a test SMS sent via Twilio, Chaitanya here"
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          "Content-Type": "application/json",
          "x-api-key":
          "7BvYxF9q2z0sD1k9L6hP3m8Xv4Qw9a2R5uX8vC1eN4fG7jK0lM3pS6tY9wZ2"
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        setState(() {
          responseMessage = "✅ Notification sent successfully!";
        });
      } else {
        setState(() {
          responseMessage =
          "❌ Failed! Status: ${response.statusCode}, Body: ${response.body}";
        });
      }
    } catch (e) {
      setState(() {
        responseMessage = "⚠️ Error: $e";
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Send Notification"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Enter recipient email",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: isLoading ? null : sendNotification,
              child: isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text("Send Notification"),
            ),
            const SizedBox(height: 16),
            Text(
              responseMessage,
              style: TextStyle(
                color: responseMessage.contains("✅")
                    ? Colors.green
                    : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
