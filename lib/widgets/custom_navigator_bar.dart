import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/ui_provider.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;
    return BottomNavigationBar(
      onTap: (int i)=> uiProvider.selectedMenuOpt = i,
      currentIndex: currentIndex,
      elevation: 0, items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.location_on_outlined), label: 'Map'),
      BottomNavigationBarItem(
          icon: Icon(Icons.compass_calibration), label: 'Address'),
    ]);
  }
}
