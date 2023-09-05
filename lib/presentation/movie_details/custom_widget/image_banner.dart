import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/domain/core/image_path.dart';
import 'package:netflix_clone/domain/core/movie_model.dart';

class MovieBanner extends StatelessWidget {
  final Movie currentMovie;
  const MovieBanner({super.key, required this.currentMovie});

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Container(
        height: MediaQuery.sizeOf(context).height * .45,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            image: DecorationImage(
                image: NetworkImage('$orginalImagePath${currentMovie.mainImage}'),
                fit: BoxFit.cover)),
      ),
      Positioned(
          top: 15,
          left: 15,
          child: IconButton(onPressed: () {}, icon: const Icon(Icons.list))),
      Positioned(
          top: 15,
          right: 15,
          child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border_rounded))),
      Positioned(
          bottom: 25,
          left: 15,
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * .75,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentMovie.title!,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text('TMDB Rating : ${currentMovie.rating!}')
              ],
            ),
          )),
      Positioned(
          bottom: -30,
          right: 15,
          child: CircleAvatar(
            backgroundColor: Colors.grey.withOpacity(.6),
            radius: 30,
            child: const Icon(
              Icons.play_arrow,
              size: 35,
              color: kColorWhite,
            ),
          )),
    ]);
  }
}
