import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedbackPage extends StatefulWidget {
  final String title;
  final String imagePath;
  final double price;
  final String description;
  final double rating;

  const FeedbackPage({
    super.key,
    required this.title,
    required this.imagePath,
    required this.price,
    required this.description,
    required this.rating,
  });

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Experience Details",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                widget.imagePath,
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            /// TITLE + LOCATION
            Text(
              widget.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Row(
              children: const [
                Icon(Icons.location_on, color: Colors.grey, size: 18),
                SizedBox(width: 4),
                Text(
                  "Jaipur, Rajasthan",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),

            const SizedBox(height: 8),

            /// RATING
            Row(
              children: [
                Row(
                  children: List.generate(
                    5,
                        (index) => Icon(
                      index < widget.rating ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                      size: 18,
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Text("(${widget.rating.toStringAsFixed(1)})",
                    style: const TextStyle(fontSize: 14, color: Colors.black54))
              ],
            ),

            const SizedBox(height: 12),

            /// PRICE
            Text(
              "USD ${widget.price.toStringAsFixed(2)} / person",
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal),
            ),

            const SizedBox(height: 16),

            /// DESCRIPTION (highlighted box)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                widget.description,
                style: const TextStyle(fontSize: 15, color: Colors.black87),
              ),
            ),

            const SizedBox(height: 20),

            /// WHAT'S INCLUDED
            const Text(
              "What's Included",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                ListTile(
                  leading: Icon(Icons.map, color: Colors.teal),
                  title: Text("Guided market tour"),
                  contentPadding: EdgeInsets.zero,
                ),
                ListTile(
                  leading: Icon(Icons.fastfood, color: Colors.teal),
                  title: Text("Street food tasting"),
                  contentPadding: EdgeInsets.zero,
                ),
                ListTile(
                  leading: Icon(Icons.restaurant, color: Colors.teal),
                  title: Text("Hands-on cooking class"),
                  contentPadding: EdgeInsets.zero,
                ),
                ListTile(
                  leading: Icon(Icons.check_circle, color: Colors.teal),
                  title: Text("All ingredients provided"),
                  contentPadding: EdgeInsets.zero,
                ),
                ListTile(
                  leading: Icon(Icons.dinner_dining, color: Colors.teal),
                  title: Text("Traditional meal tasting"),
                  contentPadding: EdgeInsets.zero,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey,width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white30,
                    blurRadius: 6,
                    offset: Offset(2, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      /// HOST PHOTO
                      CircleAvatar(
                        radius: 34,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            "assets/images/Akshay.png", // host image path
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),

                      /// HOST INFO
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Akshay Funde", // host name
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Local Guide & Food Expert",
                            style: TextStyle(fontSize: 14, color: Colors.black54),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  /// CONTACT BUTTON (separate row below photo+name)
                  Align(
                    alignment: Alignment.center,

                    child: ElevatedButton.icon(

                      onPressed: () {
                      },
                      icon: const Icon(Icons.phone, size: 18,color: Colors.white),
                      label: const Text("Contact",style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Handle booking action here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Book Now",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}
