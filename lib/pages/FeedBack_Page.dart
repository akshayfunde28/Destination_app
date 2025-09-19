import 'package:flutter/material.dart';

import 'Bottom_Navigation_Bar.dart';


class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  // Checkbox states
  bool appCrashes = false;
  bool gpsTracking = false;
  bool slowPerformance = false;
  bool otherIssue = false;

  // Controller for comment box
  final TextEditingController _commentController = TextEditingController();

  // Selected emoji index
  int selectedEmoji = -1;

  // Emoji list
  final List<String> emojis = ["😡", "😕", "😊", "😍"];

  void _submitFeedback() {
    showDialog(
      context: context,
      barrierDismissible: false, // prevent closing instantly
      builder: (context) {
        // Auto close after 1 second
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.of(context).pop(); // close dialog
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
        });

        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.verified,
                color: Color(0xFF20C9A5),
                size: 50,
              ),
              SizedBox(height: 10),
              Text(
                "Feedback Submitted!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFF20C9A5),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feedback"),
        backgroundColor: const Color(0xFF20C9A5),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              const Text(
                "How was your Experience 😊",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF20C9A5),
                ),
              ),
              const SizedBox(height: 16),

              // Emoji row (clickable)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(emojis.length, (index) {
                  final bool isSelected = selectedEmoji == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedEmoji = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFF20C9A5).withOpacity(0.1) : null,
                        border: isSelected
                            ? Border.all(color: const Color(0xFF20C9A5), width: 2)
                            : null,
                        borderRadius: BorderRadius.circular(50), // circular radius
                      ),
                      child: Text(
                        emojis[index],
                        style: const TextStyle(fontSize: 36),
                      ),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 24),

              // Common issues
              const Text(
                "Select The Issues You've Experiences:",
                style: TextStyle(
                  color: Color(0xFF20C9A5),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              CheckboxListTile(
                activeColor: const Color(0xFF20C9A5),
                title: const Text("App Crashes"),
                value: appCrashes,
                onChanged: (value) {
                  setState(() => appCrashes = value ?? false);
                },
              ),
              CheckboxListTile(
                activeColor: const Color(0xFF20C9A5),
                title: const Text("GPS Tracking"),
                value: gpsTracking,
                onChanged: (value) {
                  setState(() => gpsTracking = value ?? false);
                },
              ),
              CheckboxListTile(
                activeColor: const Color(0xFF20C9A5),
                title: const Text("Slow Performance"),
                value: slowPerformance,
                onChanged: (value) {
                  setState(() => slowPerformance = value ?? false);
                },
              ),
              CheckboxListTile(
                activeColor: const Color(0xFF20C9A5),
                title: const Text("Other"),
                value: otherIssue,
                onChanged: (value) {
                  setState(() => otherIssue = value ?? false);
                },
              ),
              const SizedBox(height: 16),

              // Comment box
              TextField(
                controller: _commentController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: "Write your feedback",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF20C9A5)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Submit button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF20C9A5),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _submitFeedback,
                  child: const Text(
                    "Submit Feedback",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
