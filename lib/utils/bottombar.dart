import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:rejunx/help.dart';
import 'package:rejunx/homepage.dart';

class Bottombar extends StatelessWidget {
  const Bottombar({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
            () {
          // Debugging log
          print("Selected index: ${controller.selectedIndex.value}");

          return NavigationBar(
            selectedIndex: controller.selectedIndex.value,
            indicatorColor: Color.fromRGBO(42, 183, 199, 150),
            onDestinationSelected: (index) {
              // Debugging log
              print("Selected destination index: $index");
              controller.selectedIndex.value = index;
            },
            destinations: [
              NavigationDestination(icon: FaIcon(FontAwesomeIcons.house), label: "Home"),
              NavigationDestination(icon: FaIcon(FontAwesomeIcons.history), label: "Activity"),
              NavigationDestination(icon: FaIcon(FontAwesomeIcons.userAlt), label: "Profile")
            ],
          );
        },
      ),
      body: Obx(
            () {
          // Debugging log
          print("Displaying screen at index: ${controller.selectedIndex.value}");
          return controller.screens[controller.selectedIndex.value];
        },
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final List<Widget> screens = [
    RecyclingHomePage(),
    Help(),
    Help(), // You might want to replace this with another widget if needed
  ];
}
