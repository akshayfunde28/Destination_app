import 'package:flutter/material.dart';
import '../Utils/Colors.dart';
import '../Utils/Constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController SearchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    SearchController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu, size: 25),
          onPressed: () {
            ShowSnakBar(context, "खूप मस्ती रे तुला अजून नाही add केले काही.");
          },
        ),
        title: Text(
          "Home",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: appTitleSize),
        ),
        centerTitle: true,
        // centers the title
        backgroundColor: appBarColor,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              icon: Icon(Icons.person_4_sharp, size: 30),
              onPressed: () {
                ShowSnakBar(
                  context,
                  "खूप मस्ती रे तुला अजून नाही add केले काही.",
                );
              },
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // Search Controller >>>>>>>>>>>>>>
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: SearchController,
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
            // Below search bar filters
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
                      height: 40,
                      color: Colors.blueGrey.shade300,
                      borderRadius: 20,
                    ),
                    CustomContainer(
                      icon: Icons.group,
                      text: "Culture",
                      height: 40,
                      color: Colors.blueGrey.shade300,
                      borderRadius: 20,
                    ),
                    CustomContainer(
                      icon: Icons.attach_money,
                      text: "Budget",
                      height: 40,
                      color: Colors.blueGrey.shade300,
                      borderRadius: 20,
                    ),
                    CustomContainer(
                      icon: Icons.event,
                      text: "Events",
                      height: 40,
                      color: Colors.blueGrey.shade300,
                      borderRadius: 20,
                    ), // new one
                    CustomContainer(
                      icon: Icons.location_on,
                      text: "Location",
                      height: 40,
                      color: Colors.blueGrey.shade300,
                      borderRadius: 20,
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 400, // full width
                          height: 200, // fixed height
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 8,
                                offset: Offset(2, 4),
                              ),
                            ],
                            image: const DecorationImage(
                              image: AssetImage(
                                "assets/images/BhartNattaym.png", // 👈 your manual image
                              ),
                              fit: BoxFit.cover, // cover full container
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 400, // full width
                          height: 200, // fixed height
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 8,
                                offset: Offset(2, 4),
                              ),
                            ],
                            image: const DecorationImage(
                              image: AssetImage(
                                "assets/images/img.png", // 👈 your manual image
                              ),
                              fit: BoxFit.cover, // cover full container
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 400, // full width
                          height: 200, // fixed height
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 8,
                                offset: Offset(2, 4),
                              ),
                            ],
                            image: const DecorationImage(
                              image: AssetImage(
                                "assets/images/Food.png", // 👈 your manual image
                              ),
                              fit: BoxFit.cover, // cover full container
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 400, // full width
                          height: 200, // fixed height
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 8,
                                offset: Offset(2, 4),
                              ),
                            ],
                            image: const DecorationImage(
                              image: AssetImage(
                                "assets/images/Nattaym2.png", // 👈 your manual image
                              ),
                              fit: BoxFit.cover, // cover full container
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 400, // full width
                          height: 200, // fixed height
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 8,
                                offset: Offset(2, 4),
                              ),
                            ],
                            image: const DecorationImage(
                              image: AssetImage(
                                "assets/images/GoutamiPatil.png", // 👈 your manual image
                              ),
                              fit: BoxFit.cover, // cover full container
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Column(
              children: [
                Row(
                  children: [
                    // Review 1
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(8),
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
                                "assets/images/Food.png",
                                width: double.infinity,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Delicious Food",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: List.generate(
                                5,
                                    (index) => Icon(
                                  index < 4 ? Icons.star : Icons.star_border,
                                  color: Colors.amber,
                                  size: 16,
                                ),
                              ),
                            ),
                            Text(
                              "Amazing taste and presentation. Would definitely recommend!",
                              style: TextStyle(fontSize: 13, color: Colors.black87),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "₹ 250",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Review 2
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(8),
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
                                "assets/images/SpiceCurry.png",
                                width: double.infinity,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Spicy Curry",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: List.generate(
                                5,
                                    (index) => Icon(
                                  index < 5 ? Icons.star : Icons.star_border,
                                  color: Colors.amber,
                                  size: 16,
                                ),
                              ),
                            ),
                            Text(
                              "Rich flavor with a perfect balance of spices.",
                              style: TextStyle(fontSize: 13, color: Colors.black87),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "₹ 300",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Explore categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Explore Categories",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      ShowSnakBar(
                        context,
                        "खूप मस्ती रे तुला अजून नाही add केले काही.",
                      );
                    },
                    child: CustomCategoriesContainer(
                      icon: Icons.group,
                      text: "Culture & Arts",
                      width: 200,
                      height: 120,
                      color: Color(0xFFE8EAFF),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      ShowSnakBar(
                        context,
                        "खूप मस्ती रे तुला अजून नाही add केले काही.",
                      );
                    },
                    child: CustomCategoriesContainer(
                      icon: Icons.restaurant,
                      text: "Food & Drinks",
                      width: 200,
                      height: 120,
                      color: Color(0xFFFAE8FF),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    child: CustomCategoriesContainer(
                      icon: Icons.landscape,
                      text: "Nature & Outdoors",
                      width: 200,
                      height: 120,
                      color: Color(0xFFFFF3D4),
                    ),
                    onTap: () {
                      ShowSnakBar(
                        context,
                        "खूप मस्ती रे तुला अजून नाही add केले काही.",
                      );
                    },
                  ),
                  InkWell(
                    onTap: () {
                      ShowSnakBar(
                        context,
                        "खूप मस्ती रे तुला अजून नाही add केले काही.",
                      );
                    },
                    child: CustomCategoriesContainer(
                      icon: Icons.hiking,
                      text: "Adventure",
                      width: 200,
                      height: 120,
                      color: Color(0xFFD4E4FF),
                    ),
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
