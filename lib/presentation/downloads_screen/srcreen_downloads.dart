import 'package:flutter/material.dart';
import 'package:netflix_clone/core/appbar_text_style.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/custom_space.dart';
import 'package:netflix_clone/presentation/downloads_screen/widgets/app_bar.dart';
import 'package:netflix_clone/presentation/downloads_screen/widgets/center_stack_images.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(
            title: "Downloads",
          )),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Row(
              children: [
                widthSmall,
                Icon(Icons.settings),
                widthSmall,
                Text(
                  "Smart Downloads",
                  style: defaultTextStyle,
                )
              ],
            ),
            heightMedium,
            const Text(
              "Intriducing Downloads for you",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 24,
              ),
            ),
            heightMedium,
            Text(
              "We'll download a personalised selection of\nmovies and shows for you, so there's\nalways something to watch on your\ndevice.",
              textAlign: TextAlign.center,
              style: defaultTextStyle.copyWith(color: kColorGray),
            ),
            heightMedium,
            CenterStackImages(
              width: width,
            ),
            heightLarge,
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: MaterialButton(
                minWidth: width,
                height: 50,
                onPressed: () {},
                color: Colors.blue,
                child: const Text(
                  "Set Up",
                  style: defaultTextStyle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: MaterialButton(
                minWidth: width,
                height: 50,
                onPressed: () {},
                color: Colors.white,
                child: Text(
                  "See What You Can Download",
                  style: defaultTextStyle.copyWith(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
