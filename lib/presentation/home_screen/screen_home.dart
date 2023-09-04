import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:netflix_clone/domain/core/end_points.dart';
import 'package:netflix_clone/domain/core/movie_model.dart';
import 'package:netflix_clone/domain/core/orgine.dart';
import 'package:netflix_clone/presentation/home_screen/custom_widgets/custom_section.dart';

import '../../infrastructure/api_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          FutureBuilder(
              future: getTopMovies(topMovies),
              builder: (context, snapshot) =>
                  snapshot.connectionState == ConnectionState.done
                      ? CustomSection(
                          currentList: snapshot.data!,
                          title: 'Top Movies',
                        )
                      : const CircularProgressIndicator()),
          FutureBuilder(
              future: getTopMovies(trendingMovies),
              builder: (context, snapshot) =>
                  snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData
                      ? CustomSection(
                          currentList: snapshot.data!,
                          title: 'Trending Shows',
                        )
                      : const CircularProgressIndicator()),
          FutureBuilder(
              future: getTopMovies(popularMovies),
              builder: (context, snapshot) =>
                  snapshot.connectionState == ConnectionState.done
                      ? CustomSection(
                          currentList: snapshot.data!,
                          title: 'Popular Movies',
                        )
                      : const CircularProgressIndicator()),
          FutureBuilder(
              future: getTopMovies(upcomingMovies),
              builder: (context, snapshot) =>
                  snapshot.connectionState == ConnectionState.done
                      ? CustomSection(
                          currentList: snapshot.data!,
                          title: 'Upcoming Movies',
                        )
                      : const CircularProgressIndicator())
        ],
      ),
    );
  }
}
