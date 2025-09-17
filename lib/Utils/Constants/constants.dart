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

//  below Search Bar container
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
