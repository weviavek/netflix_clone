import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_clone/core/api_details.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/presentation/downloads_screen/widgets/custom_image_tile.dart';
import 'package:tmdb_api/tmdb_api.dart';

class CenterStackImages extends StatelessWidget {
  final double width;
  const CenterStackImages({super.key, required this.width});
  Future<List> getMovies() async {
    TMDB tmdb = TMDB(ApiKeys(apiKey, accessToken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trending = await tmdb.v3.trending.getTrending();
    return trending['results'];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getMovies(),
      builder: (context, movieList) =>
          movieList.connectionState == ConnectionState.done
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: width * .37,
                      backgroundColor: kColorGray,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: CustomImageTile(
                        size: 1,
                        angle: 15 * pi / 180,
                        imageURL: movieList.data![2]['poster_path'],
                        paddingLeft: 150,
                        paddingRight: 0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: CustomImageTile(
                        size: 1,
                        angle: -15 * pi / 180,
                        imageURL: movieList.data![1]['poster_path'],
                        paddingLeft: 0,
                        paddingRight: 150,
                      ),
                    ),
                    CustomImageTile(
                      size: 1.15,
                      angle: 0 * pi / 180,
                      imageURL: movieList.data![0]['poster_path'],
                      paddingLeft: 0,
                      paddingRight: 0,
                    )
                  ],
                )
              : CircleAvatar(
                  radius: width * .34,
                ),
    );
  }
}
