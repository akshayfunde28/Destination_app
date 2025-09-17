import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double appTitleSize = 25.0;

void ShowSnakBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      clipBehavior: Clip.antiAlias,
      content: Text(msg),
      duration: Duration(seconds: 2),
      dismissDirection: DismissDirection.horizontal,
    ),
  );
}

//  below Search Bar container...
class CustomContainer extends StatelessWidget {
  final double height;
  final double borderRadius;
  final Color color ;
  final IconData icon ;
  final String text ;

  const CustomContainer({
    super.key,
    required this.icon,
    required this.text,
    required this.height,
    required this.color ,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(

        height: height,
        decoration: BoxDecoration(
          color: Colors.white70, // example color
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: Colors.teal,width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              size: 20,
              color:color,
            ),
            Text(text,style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.black87),)
          ],
          ),
        ),
      ),
    );
  }
}

// Explore Categories...
class CustomCategoriesContainer extends StatelessWidget {
  final IconData icon;
  final String text;
  final double width;
  final double height;
  final double borderRadius;
  final Color color;

  const CustomCategoriesContainer({
    Key? key,
    required this.icon,
    required this.text,
    required this.width,
    required this.height,
    this.borderRadius = 15,
    required this.color ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 60,
                color: Colors.black87,
              ),
              SizedBox(width: 5),
              Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Package Provider
class ItemCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String address;
  final int price;
  final double rating;
// 👈 rating can be int/double

  const ItemCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.address,
    required this.price,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int fullStars = rating.floor(); // full stars
    bool hasHalfStar = (rating - fullStars) >= 0.5; // check half star

    return Container(
      width: 200,
      // height: 247,
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Row(
            children: List.generate(5, (index) {
              if (index < fullStars) {
                return Icon(Icons.star, color: Colors.amber, size: 16);
              } else if (index == fullStars && hasHalfStar) {
                return Icon(Icons.star_half, color: Colors.amber, size: 16);
              } else {
                return Icon(Icons.star_border, color: Colors.amber, size: 16);
              }
            }),
          ),
          Text(
            address,
            style: TextStyle(fontSize: 13, color: Colors.black87),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "₹ $price",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),

               Text(
                  "View",
                  style: TextStyle(fontSize: 17,color: Colors.deepPurpleAccent),
                ),

            ],
          ),
        ],
      ),
    );
  }
}
