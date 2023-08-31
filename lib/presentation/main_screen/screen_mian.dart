import 'package:flutter/material.dart';
import 'package:netflix_clone/core/notifiers.dart';
import 'package:netflix_clone/presentation/main_screen/main_screen_items/mian_screen_items.dart';
import 'package:netflix_clone/presentation/main_screen/widgets/bottom_navigation.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: mainScreenIndexNotifier,
          builder: (context, int index, _) => mainScreenItems[index],
        ),
      ),
      bottomNavigationBar: const MainBottomNavigationBar(),
    );
  }
}
