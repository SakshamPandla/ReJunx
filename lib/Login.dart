// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:rejunx/homepage.dart';
import 'package:sizer/sizer.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  bool isBiometric = false;
  bool switchcust = false;
  bool _obscurePassword = true;
  late TabController _tabController;

  Future<bool> authenticateWithBiometric() async {
    final LocalAuthentication localAuthentication = LocalAuthentication();
    final bool isBiometricSupported = await localAuthentication.isDeviceSupported();
    final bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;
    bool isAuthenticated = false;

    if (isBiometricSupported && canCheckBiometrics) {
      isAuthenticated = await localAuthentication.authenticate(
          localizedReason: 'Please complete biometrics to proceed');
    }

    return isAuthenticated;
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text("Login", style: TextStyle(color: Color.fromRGBO(42, 183, 199, 1), fontWeight: FontWeight.bold, fontSize: 35))),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Color.fromRGBO(42, 183, 199, 1)), // Change app bar icon color
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: const [0, 0.9],
                colors: const [
                  Color.fromRGBO(255, 250, 243, 1),
                  Color.fromRGBO(236, 239, 255, 1),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.h),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: Color.fromRGBO(255, 255, 255, 0.32),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.5.h),
                    child: TabBar(
                      controller: _tabController,
                      labelColor: Colors.white,
                      labelStyle: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(42, 183, 199, 1), // Consistent blue color
                      ),
                      tabs: const [
                        Tab(text: 'Phone Number'),
                        Tab(text: 'Email Id'),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children: [
                      loginForm(context, "Phone Number"),
                      loginForm(context, "Email"),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget loginForm(BuildContext context, String hintText) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: hintText == "Phone Number" ? TextInputType.phone : TextInputType.emailAddress,
            ),
            SizedBox(height: 2.h),
            TextField(
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 2.h),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  fontSize: 11.sp,
                  color: Color.fromRGBO(42, 183, 199, 1),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Quick Login',
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                CupertinoSwitch(
                  activeColor: Color.fromRGBO(42, 183, 199, 1), // Same blue for the switch
                  value: switchcust,
                  onChanged: (value) async {
                    isBiometric = await authenticateWithBiometric();
                    setState(() {
                      switchcust = value;
                      if (switchcust) {
                        // Add the navigation logic here
                      }
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 5.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(42, 183, 199, 1), // Same blue color for the login button
                padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 24.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RecyclingApp()), // Navigating to RecycleLoc
                );
              },
              child: Text(
                'Login',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
