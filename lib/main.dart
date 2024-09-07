import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:rejunx/Login.dart';
import 'package:rejunx/Splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer( // Wrap MaterialApp in Sizer
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ReJunx',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const Splash(), // Start with the splash screen
        );
      },
    );
  }
}
