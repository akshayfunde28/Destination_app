import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(

          children: [
            Container(
              height: 200,
              // color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/LOGO.png"),
                ],
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: const Icon(Icons.person_2),
              title: const Text('Profile'),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: const Icon(Icons.book),
              title: const Text('Booking')
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: const Icon(Icons.feedback),
              title: const Text('Feedback'),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: const Icon(Icons.call),
              title: const Text('Contact Us '),
            ),
            ListTile(
              onTap: () {

              },
              leading: const Icon(Icons.logout),
              title: const Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}
