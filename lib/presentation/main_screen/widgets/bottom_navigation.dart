import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/notifiers.dart';
import 'package:netflix_clone/presentation/main_screen/bottom_navigation_bar_items/bottom_navigation_bar_items.dart';

class MainBottomNavigationBar extends StatelessWidget {
  const MainBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: mainScreenIndexNotifier,
      builder: (context, int index, _) => BottomNavigationBar(
          onTap: (newIndex) {
            mainScreenIndexNotifier.value = newIndex;
          },
          currentIndex: index,
          backgroundColor: MyColors.mainBackgroundColor,
          selectedItemColor: BottomNavigationBarColors.selectedColor,
          unselectedItemColor: BottomNavigationBarColors.unselectedColor,
          type: BottomNavigationBarType.fixed,
          items: bottomNavigationBarItems),
    );
  }
}
