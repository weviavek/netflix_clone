import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:netflix_clone/core/notifiers.dart';
import 'package:netflix_clone/domain/core/end_points.dart';
import 'package:netflix_clone/domain/core/movie_model.dart';
import 'package:netflix_clone/domain/core/orgine.dart';
import 'package:netflix_clone/infrastructure/api_details.dart';
import 'package:netflix_clone/presentation/search_screen/custom_widgets/result_tile.dart';

import 'custom_widgets/custom_movie_card.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key, Key? ey});

  Future<List<Movie>> getMovies(String currentEndPoint) async {
    final response = await get(
      Uri.parse('$orgineSite$currentEndPoint?api_key=$apiKey'),
      headers: {HttpHeaders.authorizationHeader: accessToken},
    );
    List<Movie> movieList = json
        .decode(response.body)['results']
        .map<Movie>((json) => Movie.fromJson(json))
        .toList();
    return movieList;
  }

  Future<List<Movie>> searchMovies(String query) async {
    final response = await get(
      Uri.parse('$orgineSite$searchPoint$query&api_key=$apiKey'),
      headers: {HttpHeaders.authorizationHeader: accessToken},
    );
    List<Movie> movieList = json
        .decode(response.body)['results']
        .map<Movie>((json) => Movie.fromJson(json))
        .toList();

    return movieList;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: searchNotifier,
        builder: (context, value, child) {
          final query = value.toString();
          return FutureBuilder(
            future: query == '' ? getMovies(topMovies) : searchMovies(query),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.data!.isNotEmpty) {
                return query == ''
                    ? Expanded(
                        child: GridView.count(
                        childAspectRatio: 2.0 / 3.0,
                        crossAxisCount: 3,
                        children: List.generate(
                            snapshot.data!.length,
                            (index) => SizedBox(
                                height: 220,
                                child: CustomMovieCard(
                                    currentMovie: snapshot.data![index]))),
                      ))
                    : Expanded(
                      child: ListView.separated(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) =>
                              ResultTile(currentMovie: snapshot.data![index]),
                          separatorBuilder: (context, index) => const Divider(),
                        ),
                    );
              } else {
                return const SizedBox();
              }
            },
          );
        });
  }
}
