import 'dart:async';
import 'package:flutter/material.dart';
import 'package:turisamapp/drawer_main/drawer.dart';
import 'package:turisamapp/pages/Local_service_package/search_page.dart';
import '../Entity_models/item_search_page.dart';
import '../Utils/Colors.dart';
import '../Utils/Constants/constants.dart';
import '../adharAuth/ProfilePage.dart';
import 'Service_Page.dart';

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
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: appTitleSize),
        ),
        centerTitle: true,
        backgroundColor: appBarColor,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              icon: Icon(Icons.person_4_sharp, size: 30),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // Search bar
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlaceSearchPage()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  child: IgnorePointer(
                    child: TextFormField(
                      controller: SearchController,
                      decoration: InputDecoration(
                        hintText: "Search...",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.teal,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Auto Scroll Images
            const AutoScrollImages(),

            // Reviews Section
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
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
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
                              style: TextStyle(
                                  fontSize: 13, color: Colors.black87),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "₹ 250",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => FeedbackPage(
                                          title: "Pizza",
                                          imagePath: "assets/images/Food.png",
                                          price: 299,
                                          description:
                                          "A delightful dish loaded with rich, gooey cheese that melts in your mouth. Perfectly seasoned and cooked to perfection, offering a comforting and satisfying flavor that everyone will love.",
                                          rating: 4.5,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "View",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                )
                              ],
                            )
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
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
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
                              style: TextStyle(
                                  fontSize: 13, color: Colors.black87),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "₹ 300",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => FeedbackPage(
                                          title: "Spicy Curry",
                                          imagePath:
                                          "assets/images/SpiceCurry.png",
                                          price: 299,
                                          description:
                                          "Rich flavors with a perfect balance of spices, offering an authentic taste of traditional cuisine. Every dish is carefully prepared using fresh local ingredients, giving you a unique and memorable dining experience that reflects the culture and heritage of the region.",
                                          rating: 4.5,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text("View",
                                      style: TextStyle(fontSize: 17)),
                                )
                              ],
                            )
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
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: CustomCategoriesContainer(
                        icon: Icons.group,
                        text: "Culture & Arts",
                        width: 200,
                        height: 120,
                        color: Color(0xFFE8EAFF),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: CustomCategoriesContainer(
                        icon: Icons.restaurant,
                        text: "Food & Drinks",
                        width: 200,
                        height: 120,
                        color: Color(0xFFFAE8FF),
                      ),
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
                  Expanded(
                    child: InkWell(
                      child: CustomCategoriesContainer(
                        icon: Icons.landscape,
                        text: "Nature & Outdoors",
                        width: 200,
                        height: 120,
                        color: Color(0xFFFFF3D4),
                      ),
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: CustomCategoriesContainer(
                        icon: Icons.hiking,
                        text: "Adventure",
                        width: 200,
                        height: 120,
                        color: Color(0xFFD4E4FF),
                      ),
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

/// Auto Scroll Image Slider Widget
class AutoScrollImages extends StatefulWidget {
  const AutoScrollImages({Key? key}) : super(key: key);

  @override
  State<AutoScrollImages> createState() => _AutoScrollImagesState();
}

class _AutoScrollImagesState extends State<AutoScrollImages> {
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;

  final List<String> _images = [
    "assets/images/BhartNattaym.png",
    "assets/images/img.png",
    "assets/images/Food.png",
    "assets/images/Nattaym2.png",
    "assets/images/Diwali.png",
  ];

  @override
  void initState() {
    super.initState();

    // Start from a large page number so modulo works as circular
    _pageController = PageController(initialPage: _images.length * 1000);
    _currentPage = _images.length * 1000;

    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      _currentPage++;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 200,
        child: PageView.builder(
          controller: _pageController,
          itemBuilder: (context, index) {
            final actualIndex = index % _images.length; // circular effect
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 400,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(2, 4),
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage(_images[actualIndex]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
