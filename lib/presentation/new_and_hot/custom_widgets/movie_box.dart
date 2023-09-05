import 'package:flutter/material.dart';
import 'package:netflix_clone/core/appbar_text_style.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/custom_space.dart';
import 'package:netflix_clone/domain/core/image_path.dart';
import 'package:netflix_clone/domain/core/movie_model.dart';

class MovieBox extends StatelessWidget {
  final Movie currentMovie;
  const MovieBox({super.key, required this.currentMovie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network('$imagePath${currentMovie.mainImage}'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width: MediaQuery.sizeOf(context).width * .5,
                child: Text(
                  currentMovie.title!,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 30, letterSpacing: -3),
                )),
            const Spacer(),
            const Column(
              children: [
                Icon(Icons.notification_add_outlined),
                Text(
                  'Remind me',
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
            widthSmall,
            const Column(
              children: [
                Icon(Icons.info_outline_rounded),
                Text('Info', style: TextStyle(fontSize: 10))
              ],
            )
          ],
        ),
        Text(
          'Release Date : ${currentMovie.releaseDate}',
        ),
        Text(
          '${currentMovie.title}',style: defaultTextStyle.copyWith(fontSize: 20),
        ),
        Text('${currentMovie.overview}',style:const TextStyle(color: kColorGray),),
        heightLarge
      ],
    );
  }
}
