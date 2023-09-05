import 'package:flutter/material.dart';
import 'package:netflix_clone/core/appbar_text_style.dart';
import 'package:netflix_clone/core/colors.dart';

class BannerButtons extends StatelessWidget {
  const BannerButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
           InkWell(
            onTap: (){},
            child:const Column(
              children: [Icon(Icons.add), Text('My List')],
            ),
          ),
          TextButton.icon(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
            onPressed: () {},
            label: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text('Play',style: defaultTextStyle.copyWith(color: kColorBlack),),
            ),
            icon: const Icon(Icons.play_arrow,color: kColorBlack,),
          ),
          InkWell(
            onTap: (){},
            child:const Column(
              children: [Icon(Icons.info_outline), Text('Info')],
            ),
          )
        ],
      ),
    );
  }
}
