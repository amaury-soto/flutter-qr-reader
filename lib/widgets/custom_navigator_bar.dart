import 'package:flutter/material.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 1,
      elevation: 0, items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.location_on_outlined), label: 'Map'),
      BottomNavigationBarItem(
          icon: Icon(Icons.compass_calibration), label: 'Address'),
    ]);
  }
}
