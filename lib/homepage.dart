import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class RecyclingHomePage extends StatelessWidget {
  final Color primaryColor = Color.fromRGBO(42, 183, 199, 1);
  final Color secondaryColor = Color.fromRGBO(42, 183, 199, 1);
  final Color backgroundColor = Color.fromRGBO(240, 248, 255, 1);
  final Color boxColor = Color.fromRGBO(42, 183, 199, 1);
  final Color cardColor = Color.fromRGBO(42, 183, 199, 1); // New color code

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/profile_image.png'),
              radius: 20,
            ),
            SizedBox(width: 2.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Good Morning',
                  style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                ),
                Text(
                  'Start Recycling Today!',
                  style: TextStyle(fontSize: 12.sp, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: backgroundColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.h),
              // My Statistics Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  statisticsCard('3400', 'RX Points', cardColor),
                  statisticsCard('27', 'Products', cardColor),
                ],
              ),
              SizedBox(height: 2.h),
              // Waste Category Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Waste Category',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(fontSize: 12.sp, color: primaryColor),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              // Waste Category Icons with horizontal scroll
              SizedBox(
                height: 15.h,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          wasteCategoryCard(Icons.phone_iphone, 'Small E', primaryColor),
                          wasteCategoryCard(Icons.tv, 'Consumer E', primaryColor),
                          wasteCategoryCard(Icons.computer, 'IT & Telecom', primaryColor),
                          wasteCategoryCard(Icons.battery_full, 'Batteries', primaryColor),
                          wasteCategoryCard(Icons.power, 'Cables & Chargers', primaryColor),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 3.h),
              // Nearby Bin Station Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nearby Bin Station',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(fontSize: 12.sp, color: primaryColor),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return nearbyBinStation(cardColor);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget statisticsCard(String value, String label, Color color) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(3.w),
        margin: EdgeInsets.symmetric(horizontal: 2.w),
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white), // Updated to white
            ),
            SizedBox(height: 1.h),
            Text(
              label,
              style: TextStyle(fontSize: 12.sp, color: Colors.white), // Updated to white
            ),
          ],
        ),
      ),
    );
  }

  Widget wasteCategoryCard(IconData iconData, String label, Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Icon(iconData, size: 24.sp, color: Colors.white),
          ),
          SizedBox(height: 1.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget nearbyBinStation(Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
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
        child: Row(
          children: [
            Container(
              width: 15.w,
              height: 15.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: color, // Updated to cardColor
              ),
              child: Icon(Icons.location_on, size: 20.sp, color: Colors.white), // Updated to white
            ),
            SizedBox(width: 4.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'OGG Bin Station',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(height: 1.h),
                Text(
                  'Sesame Street 223, Washington DC',
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                ),
                SizedBox(height: 1.h),
                Text(
                  '2.3 Km',
                  style: TextStyle(fontSize: 12.sp, color: color),
                ),
              ],
            ),
            Spacer(),
            Icon(Icons.more_vert),
          ],
        ),
      ),
    );
  }
}
