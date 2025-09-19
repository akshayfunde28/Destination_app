import 'package:flutter/material.dart';

import '../adharAuth/ProfilePage.dart';
import '../adharAuth/ProfilePageOtherData/Logout.dart';
import '../pages/FeedBack_Page.dart';
import 'Contact_us_page.dart';

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
            Divider(),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
              },
              leading: const Icon(Icons.person_2),
              title: const Text('Profile'),
            ),


            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FeedbackPage()));
              },
              leading: const Icon(Icons.feedback),
              title: const Text('Feedback'),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactUsPage()),
                );
              },
              leading: const Icon(Icons.call),
              title: const Text('Contact Us '),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LogoutPage()),
                );
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
