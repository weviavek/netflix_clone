import 'package:flutter/material.dart';
import 'package:netflix_clone/core/appbar_text_style.dart';
import 'package:netflix_clone/core/custom_space.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          widthSmall,
          Text(
            title,
            style: appBarTextStyle,
          ),
          const Spacer(),
          const Icon(Icons.cast),
          widthSmall,
          const Icon(Icons.more_vert),
          widthSmall
        ],
      ),
    );
  }
}
