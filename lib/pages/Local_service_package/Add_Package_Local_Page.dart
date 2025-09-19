import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:turisamapp/Utils/Colors.dart';
import 'package:turisamapp/pages/Bottom_Navigation_Bar.dart';

import '../../Entity_models/TempDB_class.dart';
import '../../Entity_models/package_search.dart';

class AddPlacePage extends StatefulWidget {
  const AddPlacePage({super.key});

  @override
  State<AddPlacePage> createState() => _AddPlacePageState();
}

class _AddPlacePageState extends State<AddPlacePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _filterController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  File? _pickedImage; // local variable for UI preview only

  // Pick image from gallery
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile =
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 70);

    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    }
  }

  void _savePlace() {
    if (_formKey.currentState!.validate()) {
      TempDB.getPlaces().add(
        Place(
          filter: _filterController.text,
          title: _titleController.text,
          address: _addressController.text,
          city: _cityController.text,
          description: _descriptionController.text,
          price: double.tryParse(_priceController.text) ?? 0.0,
          rating: 4.5, // default rating
          imagePath: "assets/images/SpiceCurry.png", // fixed path
        ),
      );

      // Show AlertDialog instead of SnackBar
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: const [
              Icon(Icons.verified, color: Colors.green, size: 30),
              SizedBox(width: 8),
              Text("Place Added"),
            ],
          ),
          content: const Text(
            "Your place has been successfully added and verified!",
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // close dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                );
              },
              child: const Text(
                "OK",
                style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Place"),
        backgroundColor: appBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Image Picker Box
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: _pickedImage == null
                        ? const Center(
                      child: Icon(
                        Icons.add_a_photo,
                        size: 50,
                        color: Colors.grey,
                      ),
                    )
                        : ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        _pickedImage!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Title
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: "Title",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                  value!.isEmpty ? "Please enter title" : null,
                ),

                // filter
                const SizedBox(height: 12),
                TextFormField(
                  controller: _filterController,
                  decoration: const InputDecoration(
                    labelText: "Type",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                  value!.isEmpty ? "Please enter Type " : null,
                ),
                const SizedBox(height: 12),
                // Address
                TextFormField(
                  controller: _addressController,
                  decoration: const InputDecoration(
                    labelText: "Address",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                  value!.isEmpty ? "Please enter address" : null,
                ),
                const SizedBox(height: 12),

                // City
                TextFormField(
                  controller: _cityController,
                  decoration: const InputDecoration(
                    labelText: "City",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                  value!.isEmpty ? "Please enter city" : null,
                ),
                const SizedBox(height: 12),

                // Description
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: "Description",
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                  validator: (value) =>
                  value!.isEmpty ? "Please enter description" : null,
                ),
                const SizedBox(height: 12),

                // Price
                TextFormField(
                  controller: _priceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Price",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                  value!.isEmpty ? "Please enter price" : null,
                ),
                const SizedBox(height: 20),

                // Save Button
                ElevatedButton(
                  onPressed: _savePlace,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    "Save Place",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
