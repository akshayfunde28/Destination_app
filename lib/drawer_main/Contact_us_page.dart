import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  final String adminEmail = "fundeakshay459@gmail.com";
  final String phoneNumber = "7020071662";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF20C9A5),
        title: const Text("Contact Us"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Text
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "We’re here to make your travel experience smooth and hassle-free. If you have any queries about bookings, experiences, cultural activities, or if you face any issues while using the app — our team is always ready to help.",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 10,),
            // text
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Have any queries, or facing issues while using Destination App?",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
            ),

            // Message Form Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Text(
                        "Send us a Message",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF20C9A5),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: "Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: const Icon(Icons.person),
                        ),
                        validator:
                            (value) =>
                                value!.isEmpty
                                    ? "Please enter your name"
                                    : null,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: const Icon(Icons.email),
                        ),
                        validator:
                            (value) =>
                                value!.isEmpty
                                    ? "Please enter your email"
                                    : null,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _messageController,
                        maxLines: 5,
                        decoration: InputDecoration(
                          labelText: "Message",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignLabelWithHint: true,
                          prefixIcon: const Icon(Icons.message),
                        ),
                        validator:
                            (value) =>
                                value!.isEmpty
                                    ? "Please enter a message"
                                    : null,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF20C9A5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 14,
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Send message via email
                            final Uri emailLaunchUri = Uri(
                              scheme: 'mailto',
                              path: adminEmail,
                              query:
                                  'subject=App Message from ${_nameController.text}&body=${_messageController.text}\n\nSender Email: ${_emailController.text}',
                            );
                            launchUrl(emailLaunchUri);

                            // Clear fields after sending
                            _nameController.clear();
                            _emailController.clear();
                            _messageController.clear();
                          }
                        },
                        child: const Text(
                          "Send Message",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // email and mobile card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.email,
                        color: Color(0xFF20C9A5),
                      ),
                      title: const Text("Email"),
                      subtitle: Text(adminEmail),
                      onTap: () => launchUrl(Uri.parse("mailto:$adminEmail")),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(
                        Icons.phone,
                        color: Color(0xFF20C9A5),
                      ),
                      title: const Text("Phone"),
                      subtitle: Text(phoneNumber),
                      onTap: () => launchUrl(Uri.parse("tel:$phoneNumber")),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(
                        Icons.camera_alt, // Instagram-like icon
                        color: Color(0xFF20C9A5),
                      ),
                      title: const Text("Instagram"),
                      subtitle: const Text("Destination_01"),
                      onTap: () => launchUrl(
                        Uri.parse("https://instagram.com/Destination_01"),
                        mode: LaunchMode.externalApplication,
                      ),
                    ),


                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
