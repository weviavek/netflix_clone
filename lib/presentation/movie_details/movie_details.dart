import 'package:flutter/material.dart';
import 'package:netflix_clone/core/appbar_text_style.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/custom_space.dart';
import 'package:netflix_clone/domain/core/movie_model.dart';
import 'package:netflix_clone/presentation/movie_details/custom_widget/image_banner.dart';

class MovieDetailsPage extends StatelessWidget {
  final Movie currentMovie;
  const MovieDetailsPage({super.key, required this.currentMovie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          MovieBanner(currentMovie: currentMovie),
          heightMedium,
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Release Date : ${currentMovie.releaseDate}",
                  style: defaultTextStyle,
                ),
                heightSmall,
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .8,
                  child: Text(
                    "${currentMovie.title}",
                    overflow: TextOverflow.ellipsis,
                    style: defaultTextStyle.copyWith(fontSize: 25),
                  ),
                ),
                heightMedium,
                const Text(
                  'Overview',
                  style: TextStyle(fontSize: 20),
                ),
                heightSmall,
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .9,
                  child: Text(
                    
                    "${currentMovie.overview}",
                    style: defaultTextStyle.copyWith(color: kColorGray,),textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
