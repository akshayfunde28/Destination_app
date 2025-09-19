import 'package:flutter/material.dart';
import 'package:turisamapp/Entity_models/package_search.dart';
import '../Utils/Constants/constants.dart';
import '../pages/Service_Page.dart';
import 'TempDB_class.dart'; // your TempDB with getPlaces()

class PlaceSearchPage extends StatefulWidget {
  const PlaceSearchPage({Key? key}) : super(key: key);

  @override
  _PlaceSearchPageState createState() => _PlaceSearchPageState();
}

class _PlaceSearchPageState extends State<PlaceSearchPage> {
  final List<Place> allPlaces = TempDB.getPlaces();
  List<Place> filteredPlaces = [];
  final TextEditingController searchController = TextEditingController();

  String selectedFilter = "All"; // default filter

  @override
  void initState() {
    super.initState();
    filteredPlaces = allPlaces; // show all by default
  }

  void filterPlaces() {
    final query = searchController.text.toLowerCase().trim();

    setState(() {
      filteredPlaces = allPlaces.where((place) {
        final matchesFilter =
            (selectedFilter == "All") || (place.filter == selectedFilter);

        final city = place.city.toLowerCase().trim();
        final title = place.title.toLowerCase().trim();
        final desc = place.description.toLowerCase().trim();
        final addr = place.address.toLowerCase().trim();

        final matchesQuery = query.isEmpty ||
            city.contains(query) ||
            title.contains(query) ||
            desc.contains(query) ||
            addr.contains(query);

        return matchesFilter && matchesQuery;
      }).toList();
    });
  }

  // Build star icons
  List<Widget> _buildStars(double rating) {
    final int fullStars = rating.floor().clamp(0, 5);
    final int emptyStars = (5 - fullStars).clamp(0, 5);
    final List<Widget> stars = [];
    for (int i = 0; i < fullStars; i++) {
      stars.add(const Icon(Icons.star, size: 14, color: Colors.amber));
    }
    for (int i = 0; i < emptyStars; i++) {
      stars.add(const Icon(Icons.star_border, size: 14, color: Colors.amber));
    }
    return stars;
  }

  Widget buildFilterButton(String text, IconData icon) {
    final bool isSelected = selectedFilter == text;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = text;
        });
        filterPlaces();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.teal : Colors.blueGrey.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(icon, size: 16, color: Colors.white),
            const SizedBox(width: 4),
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Place Search"),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (val) => filterPlaces(),
              decoration: InputDecoration(
                hintText: "Search by city, title or address...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          // Filters Row
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildFilterButton("All", Icons.filter_alt),
                  buildFilterButton("Culture", Icons.group),
                  buildFilterButton("Food", Icons.attach_money),
                  buildFilterButton("Events", Icons.event),
                  buildFilterButton("Adventure", Icons.location_on),
                  buildFilterButton("OutDoors", Icons.landscape),
                ],
              ),
            ),
          ),

          // Grid of places
          Expanded(
            child: filteredPlaces.isEmpty
                ? const Center(
              child: Text(
                "No results found",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
                : GridView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: filteredPlaces.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                final place = filteredPlaces[index];

                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.25),
                        blurRadius: 6,
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: Image.asset(
                          place.imagePath,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 110,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 110,
                              color: Colors.grey[200],
                              alignment: Alignment.center,
                              child: const Icon(
                                  Icons.image_not_supported_outlined),
                            );
                          },
                        ),
                      ),

                      // Info
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title
                            Text(
                              place.title,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),

                            // Filter chip
                            Container(
                              margin: const EdgeInsets.only(top: 4),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.teal.shade100,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                place.filter,
                                style: const TextStyle(
                                    fontSize: 11, color: Colors.teal),
                              ),
                            ),

                            const SizedBox(height: 4),

                            // Rating
                            Row(
                              children: [
                                ..._buildStars(place.rating),
                                const SizedBox(width: 6),
                                Text(
                                  place.rating.toString(),
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black87),
                                ),
                              ],
                            ),

                            const SizedBox(height: 6),

                            // City
                            Text(
                              place.city,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.grey),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),

                            // Address
                            Text(
                              place.address,
                              style: const TextStyle(
                                  fontSize: 11, color: Colors.black54),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),

                            const SizedBox(height: 8),

                            // Price + View
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "₹${place.price.toStringAsFixed(0)}",
                                  style: const TextStyle(
                                      fontSize: 13, color: Colors.green),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.teal,
                                    textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => FeedbackPage(
                                          title: place.title,
                                          imagePath: place.imagePath,
                                          price: place.price,
                                          description:
                                          place.description,
                                          rating: place.rating,
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text("View"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
