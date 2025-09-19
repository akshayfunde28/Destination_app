import 'package:flutter/material.dart';

import '../Utils/Colors.dart';
import 'Local_service_package/Payment_integration.dart';

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
    int fullStars = widget.rating.floor();
    bool hasHalfStar = (widget.rating - fullStars) >= 0.5;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Experience Details",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: appBarColor,
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

            /// TITLE
            Text(
              widget.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 6),

            /// RATING
            Row(
              children: [
                Row(
                  children: List.generate(5, (index) {
                    if (index < fullStars) {
                      return const Icon(Icons.star,
                          color: Colors.amber, size: 18);
                    } else if (index == fullStars && hasHalfStar) {
                      return const Icon(Icons.star_half,
                          color: Colors.amber, size: 18);
                    } else {
                      return const Icon(Icons.star_border,
                          color: Colors.amber, size: 18);
                    }
                  }),
                ),
                const SizedBox(width: 6),
                Text("(${widget.rating.toStringAsFixed(1)})",
                    style:
                    const TextStyle(fontSize: 14, color: Colors.black54)),
              ],
            ),

            const SizedBox(height: 12),

            /// PRICE
            Text(
              "RS ${widget.price.toStringAsFixed(2)} / person",
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal),
            ),

            const SizedBox(height: 16),

            /// DESCRIPTION
            Text(
              "Description",
              style: TextStyle(
                fontSize: 20,         // bigger text
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            Text(
              widget.description,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
            ),

            const SizedBox(height: 24),

            /// HOST SECTION (with icon instead of photo)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.teal, width: 1),
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
                      Icon(Icons.person, size: 50, color: appBarColor),
                      const SizedBox(width: 12),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                            style:
                            TextStyle(fontSize: 14, color: Colors.black54),
                          ),
                          Text(
                            "Karvenagar,Hingne Home Colony,Pune - 411052",
                            style:
                            TextStyle(fontSize: 14, color: Colors.black54),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  /// CONTACT BUTTON
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton.icon(
                      onPressed: () {

                      },
                      icon: const Icon(Icons.phone,
                          size: 18, color: Colors.white),
                      label: const Text(
                        "Contact",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: appBarColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// BOOK NOW BUTTON
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentPage(money: widget.price)));

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

