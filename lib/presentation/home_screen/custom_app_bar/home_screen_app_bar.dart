import 'package:flutter/material.dart';
import 'package:netflix_clone/core/text_button_style.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black,Colors.transparent])),
            height: 40,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15,top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/netflix_icon.png'),
                  const Icon(
                    Icons.cast,
                    size: 40,
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'TV Shows',
                    style: textButtomStyle,
                  )),
              TextButton(
                  onPressed: () {},
                  child: Text('Movies', style: textButtomStyle)),
              TextButton(
                  onPressed: () {},
                  child: Text('Categories', style: textButtomStyle))
            ],
          )
        ],
      ),
    );
  }
}
