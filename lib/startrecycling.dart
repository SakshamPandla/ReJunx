import 'package:flutter/material.dart';
import 'package:rejunx/recyclenow.dart';
import 'package:sizer/sizer.dart';

class StartRecyclingPage extends StatefulWidget {
  @override
  _StartRecyclingPageState createState() => _StartRecyclingPageState();
}

class _StartRecyclingPageState extends State<StartRecyclingPage> {
  final Color primaryColor = Color.fromRGBO(42, 183, 199, 1);
  final Color backgroundColor = Color.fromRGBO(240, 248, 255, 1);

  // This map will track selected items and their quantities
  Map<String, int> selectedEwaste = {
    'Mobile Phone': 0,
    'Laptop': 0,
    'Batteries': 0,
    'TV': 0,
    'Chargers': 0,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Recycle E-Waste",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        color: backgroundColor,
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How to Recycle?',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 1.h),
            Text(
              'Select the type of e-waste you are recycling and provide details.',
              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
            ),
            SizedBox(height: 2.h),

            // E-Waste Categories Section with expansion
            Text(
              'Choose E-Waste Category',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 2.h),
            Expanded(
              child: ListView(
                children: [
                  eWasteCategoryCard(
                      Icons.phone_android, 'Small Electronics', ['Mobile Phone', 'Laptop', 'Tablet']),
                  eWasteCategoryCard(Icons.tv, 'Consumer Electronics', ['TV', 'Monitor', 'Speaker']),
                  eWasteCategoryCard(Icons.battery_full, 'Batteries', ['AAA', 'AA', 'Power Banks']),
                  eWasteCategoryCard(Icons.power, 'Cables & Chargers', ['USB Cable', 'Chargers', 'HDMI Cable']),
                ],
              ),
            ),
            SizedBox(height: 2.h),

            // Submit Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to RecyclingConfirmationPage and pass the selectedEwaste data
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StartRecyclingPage(
                        selectedEwaste: selectedEwaste,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 2.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Recycle Now',
                  style: TextStyle(fontSize: 14.sp, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }

  // E-Waste category widget with expansion and item selection
  Widget eWasteCategoryCard(IconData icon, String label, List<String> subItems) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.h),
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ExpansionTile(
        leading: Icon(icon, size: 24.sp, color: primaryColor),
        title: Text(
          label,
          style: TextStyle(fontSize: 14.sp, color: Colors.black),
        ),
        children: subItems.map((subItem) {
          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(subItem, style: TextStyle(fontSize: 12.sp, color: Colors.black)),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove_circle_outline, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          if (selectedEwaste[subItem]! > 0) {
                            selectedEwaste[subItem] = selectedEwaste[subItem]! - 1;
                          }
                        });
                      },
                    ),
                    Text(
                      '${selectedEwaste[subItem]}',
                      style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: Icon(Icons.add_circle_outline, color: Color.fromRGBO(42, 183, 199, 1)),
                      onPressed: () {
                        setState(() {
                          selectedEwaste[subItem] = selectedEwaste[subItem]! + 1;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
