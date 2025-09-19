import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;

class MapSearchScreen extends StatefulWidget {
  @override
  _MapSearchScreenState createState() => _MapSearchScreenState();
}

class _MapSearchScreenState extends State<MapSearchScreen> {
  final MapController _mapController = MapController();
  LatLng _markerPosition = LatLng(19.0760, 72.8777); // Default: Mumbai
  String _address = 'search a place';
  TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _searchResults = [];

  /// Reverse geocode using Nominatim
  Future<void> _reverseGeocode(LatLng point) async {
    final String url =
        'https://nominatim.openstreetmap.org/reverse?lat=${point.latitude}&lon=${point.longitude}&format=json';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'User-Agent': 'FlutterMapApp/1.0 (example@email.com)'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _address = data['display_name'] ?? 'No address found';
        });
      } else {
        setState(() {
          _address = 'Failed to fetch address';
        });
      }
    } catch (e) {
      setState(() {
        _address = 'Error: $e';
      });
    }
  }

  /// Search places using Nominatim
  Future<void> _searchPlace(String query) async {
    if (query.isEmpty) return;

    final String url =
        'https://nominatim.openstreetmap.org/search?q=$query&format=json&limit=5';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'User-Agent': 'FlutterMapApp/1.0 (example@email.com)'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List<dynamic>;
        setState(() {
          _searchResults = data
              .map((place) => {
            'name': place['display_name'],
            'lat': double.parse(place['lat']),
            'lon': double.parse(place['lon']),
          })
              .toList();
        });
      } else {
        setState(() {
          _searchResults = [];
        });
      }
    } catch (e) {
      setState(() {
        _searchResults = [];
      });
    }
  }

  /// Move map to selected search result
  void _selectPlace(Map<String, dynamic> place) {
    final LatLng point = LatLng(place['lat'], place['lon']);
    _mapController.move(point, 15.0); // zoom in
    setState(() {
      _markerPosition = point;
      _address = place['name'];
      _searchResults = [];
      _searchController.text = place['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
        backgroundColor: Colors.teal,
      ),
      body: Stack(
        children: [
        FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCenter: _markerPosition,
          initialZoom: 12.0,
          onTap: (_, point) {
            _reverseGeocode(point);
            setState(() {
              _markerPosition = point;
            });
          },
        ),
        children: [
          TileLayer(
            urlTemplate:
            "https://cartodb-basemaps-a.global.ssl.fastly.net/light_all/{z}/{x}/{y}{r}.png",
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: _markerPosition,
                width: 80,
                height: 80,
                child: Icon(
                  Icons.location_pin,
                  color: Colors.red,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),

          // Search Bar UI
          Positioned(
            top: 15,
            left: 15,
            right: 15,
            child: Column(
              children: [
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10),
                  child: TextField(
                    controller: _searchController,
                    onChanged: _searchPlace,
                    decoration: InputDecoration(
                      hintText: 'Search place...',
                      prefixIcon: Icon(Icons.search, color: Colors.teal),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 0),
                    ),
                  ),
                ),
                if (_searchResults.isNotEmpty)
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        final place = _searchResults[index];
                        return ListTile(
                          title: Text(
                            place['name'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          onTap: () => _selectPlace(place),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
          // Address display at bottom
          Positioned(
            bottom: 20,
            left: 15,
            right: 15,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.teal.shade50.withOpacity(0.9),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Address: $_address',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
