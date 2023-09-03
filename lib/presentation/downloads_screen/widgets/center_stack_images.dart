import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/domain/core/movie_model.dart';
import 'package:netflix_clone/infrastructure/api_details.dart';
import 'package:netflix_clone/presentation/downloads_screen/widgets/custom_image_tile.dart';

class CenterStackImages extends StatelessWidget {
  final double width;
  const CenterStackImages({super.key, required this.width});
  Future<List<Movie>> getMovies() async {
    // TMDB tmdb = TMDB(ApiKeys(apiKey, accessToken),
    //     logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));
    // Map trending = await tmdb.v3.trending.getTrending();
    final temp = await get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/popular?api_key=43079de59c035221053375c5e5d110f8'),
        headers: {HttpHeaders.authorizationHeader: accessToken});
    List<Movie> temp1 = json
        .decode(temp.body)['results']
        .map<Movie>((json) => Movie.fromJson(json))
        .toList();

    return temp1;
  }

  @override
  Widget build(BuildContext context) {
    return 
    FutureBuilder(
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
                        imageURL: movieList.data![2].posterPath,
                        paddingLeft: 150,
                        paddingRight: 0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: CustomImageTile(
                        size: 1,
                        angle: -15 * pi / 180,
                        imageURL: movieList.data![1].posterPath,
                        paddingLeft: 0,
                        paddingRight: 150,
                      ),
                    ),
                    CustomImageTile(
                      size: 1.15,
                      angle: 0 * pi / 180,
                      imageURL: movieList.data![0].posterPath,
                      paddingLeft: 0,
                      paddingRight: 0,
                    )
                  ],
                )
              : CircleAvatar(
                  radius:  width * .37,
                ),
    );
  }
}
