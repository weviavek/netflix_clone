import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:netflix_clone/domain/core/end_points.dart';
import 'package:netflix_clone/presentation/home_screen/main_banner/banner_buttons_bottom.dart';

import '../../../domain/core/image_path.dart';
import '../../../domain/core/movie_model.dart';
import '../../../domain/core/orgine.dart';
import '../../../infrastructure/api_details.dart';

class MainScreenBanner extends StatelessWidget {
  const MainScreenBanner({super.key});

  @override
  Widget build(BuildContext context) {
    Future<List<Movie>> getTopMovies(String currentEndPoint) async {
      final response = await get(
          Uri.parse('$orgineSite$currentEndPoint?api_key=$apiKey'),
          headers: {HttpHeaders.authorizationHeader: accessToken});
      List<Movie> movieList = json
          .decode(response.body)['results']
          .map<Movie>((json) => Movie.fromJson(json))
          .toList();
      return movieList;
    }

    return Stack(children: [
      SizedBox(
        height: 600,
        child: FutureBuilder(
          future: getTopMovies(popularMovies),
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.done
                  ? SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height: 600,
                      child: Image.network(
                        '$orginalImagePath${snapshot.data![0].posterPath}',
                        fit: BoxFit.cover,
                      ),
                    )
                  : const Center(
                      child: SizedBox(),
                    ),
        ),
      ),
     
      const BannerButtons()
    ]);
  }
}
