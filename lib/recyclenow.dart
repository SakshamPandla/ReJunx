import 'package:flutter/material.dart';
import 'package:rejunx/startrecycling.dart';

class RecycleEWastePage extends StatefulWidget {
  @override
  _RecycleEWastePageState createState() => _RecycleEWastePageState();
}

class _RecycleEWastePageState extends State<RecycleEWastePage> {
  final List<String> ewasteCategories = [
    "Smartphone Battery",
    "Laptop Screen",
    "Hard Disk Drive",
    "LED Monitor",
    "Power Supply Unit",
    "DVD Drive",
    "Graphics Card",
    "Motherboard",
    "Keyboard",
    "RAM Module",
    "CPU",
    "Printer",
    "Router",
    "Modem",
    "Smartwatch",
    "Tablet Screen",
    "Smart Speaker",
    "Wi-Fi Adapter",
    "External Hard Drive",
    "USB Flash Drive",
    "Bluetooth Headset",
    "Electric Kettle",
    "Digital Camera",
    "Gaming Console",
    "Smart TV",
    "Power Bank",
    "Home Assistant",
    "Wireless Charger",
    "Smart Light Bulb",
    "Fitness Tracker",
    "Smart Thermostat",
    "VR Headset",
    "Dash Cam",
    "Electric Scooter Battery",
    "3D Printer",
    "Portable Projector",
    "Smart Doorbell",
    "E-Reader",
    "Drone",
    "Robot Vacuum",
    "Portable Speaker",
    "Smart Lock"
  ];

  late String selectedCategory;
  late int selectedYear;
  late double productWeight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recycle E-Waste'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How to Recycle?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Select the type of e-waste you are recycling and provide details.',
            ),
            SizedBox(height: 16),

            // Search bar for E-Waste Category
            TextField(
              decoration: InputDecoration(
                labelText: 'Search E-Waste Category',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (query) {
                setState(() {
                  selectedCategory = ewasteCategories.firstWhere(
                        (category) => category.toLowerCase().contains(query.toLowerCase()),
                    orElse: () => StartRecyclingPage(),
                  );
                });
              },
            ),
            SizedBox(height: 16),

            // Display the selected category
            if (selectedCategory != null) ...[
              Text(
                'Selected Category: $selectedCategory',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),

              // Year of manufacture selection
              Text('Select the year of manufacture:'),
              DropdownButton<int>(
                value: selectedYear,
                hint: Text('Year'),
                items: List.generate(30, (index) {
                  int year = DateTime.now().year - index;
                  return DropdownMenuItem(
                    value: year,
                    child: Text('$year'),
                  );
                }),
                onChanged: (value) {
                  setState(() {
                    selectedYear = value!;
                  });
                },
              ),
              SizedBox(height: 16),

              // Weight of the product
              Text('Enter the weight of the product (in kg):'),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter weight',
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    productWeight = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              SizedBox(height: 16),

              // Recycle Now button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle recycling action
                    if (selectedCategory != null &&
                        selectedYear != null &&
                        productWeight > 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Recycling $selectedCategory from year $selectedYear weighing $productWeight kg.'),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please provide all the required details.'),
                        ),
                      );
                    }
                  },
                  child: Text('Recycle Now'),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
