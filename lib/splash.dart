import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rejunx/Login.dart'; // Ensure Login page exists
import 'package:rejunx/homepage.dart'; // Ensure Homepage exists
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;

  Future<void> invokeTimer() async {
    Timer(const Duration(seconds: 3), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? isLoggedIn = prefs.getString("token");

      // If token doesn't exist, show Login, otherwise go to Homepage
      if (isLoggedIn == null || isLoggedIn.isEmpty) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Login()), // Go to Login
              (route) => false,
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Homepage()), // Go to Homepage
              (route) => false,
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    invokeTimer();

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Quick animation
    );

    // Define the opacity animation (quick fade-in)
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    // Define the scale animation (subtle zoom-in effect)
    _scaleAnimation = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(222, 238, 254, 1), // Soft blue
              Color.fromRGBO(222, 238, 254, 1), // Soft pink
            ],
          ),
        ),
        child: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Opacity(
                opacity: _opacityAnimation.value, // Quick fade-in
                child: Transform.scale(
                  scale: _scaleAnimation.value, // Slight zoom-in
                  child: Image.asset(
                    "assets/images/ReJunx logo.png", // Ensure high resolution
                    height: 460,
                    width: 460,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
