import 'package:flutter/material.dart';

import '../../Utils/Colors.dart';
import '../../Utils/Constants/constants.dart';
import '../Service_Page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController SearchController = TextEditingController();
  late String imagePath;
  late String title;
  late String address;
  late int price;
  late double rating;

  final FocusNode _searchFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    // Request focus after the page is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_searchFocus);
    });
    address = "FC Road, Pune, Maharashtra";
    imagePath = "assets/images/Food.png";
    title = "Delicious Food";
    price = 450;
    rating = 3.8;
  }

  @override
  void dispose() {
    SearchController.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: appTitleSize),
        ),
        centerTitle: true,
        // centers the title
        backgroundColor: appBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Search Bar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 45,
                child: TextFormField(
                  controller: SearchController,
                  focusNode: _searchFocus,
                  decoration: InputDecoration(
                    hintText: "Search...",
                    prefixIcon: Icon(Icons.search), // search icon at the start
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.teal,
                        width: 2,
                      ), // highlight on focus
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter something to search';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width, // full screen width
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomContainer(
                      icon: Icons.filter_alt,
                      text: "All     ",
                      height: 37,
                      color: Colors.blueGrey.shade300,
                      borderRadius: 20,
                    ),
                    CustomContainer(
                      icon: Icons.group,
                      text: "Culture",
                      height: 37,
                      color: Colors.blueGrey.shade300,
                      borderRadius: 20,
                    ),
                    CustomContainer(
                      icon: Icons.attach_money,
                      text: "Budget",
                      height: 37,
                      color: Colors.blueGrey.shade300,
                      borderRadius: 20,
                    ),
                    CustomContainer(
                      icon: Icons.event,
                      text: "Events",
                      height: 37,
                      color: Colors.blueGrey.shade300,
                      borderRadius: 20,
                    ), // new one
                    CustomContainer(
                      icon: Icons.location_on,
                      text: "Location",
                      height: 37,
                      color: Colors.blueGrey.shade300,
                      borderRadius: 20,
                    ),
                  ],
                ),
              ),
            ),

            if (price != 0)
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => FeedbackPage(
                            title: "title",
                            imagePath: "assets/images/Food.png",
                            price: 12000,
                            description: "description",
                            rating: 4,
                          ),
                    ),
                  );
                },
                child: Row(
                  children: [
                    ItemCard(
                      imagePath: imagePath,
                      title: title,
                      address: address,
                      price: price,
                      rating: rating,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
