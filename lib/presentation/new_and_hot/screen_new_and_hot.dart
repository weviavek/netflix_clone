import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:netflix_clone/core/appbar_text_style.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/domain/core/end_points.dart';
import 'package:netflix_clone/presentation/new_and_hot/custom_widgets/date_box.dart';
import 'package:netflix_clone/presentation/new_and_hot/custom_widgets/movie_box.dart';

import '../../domain/core/movie_model.dart';
import '../../domain/core/orgine.dart';
import '../../infrastructure/api_details.dart';
import '../downloads_screen/widgets/app_bar.dart';

class NewAndHotScreen extends StatelessWidget {
  const NewAndHotScreen({super.key, Key? ky});
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
      body: Column(
        children: [
          const CustomAppBar(
            title: "New & Hot",
          ),
          DefaultTabController(
            length: 2,
            child: TabBar(
              indicator: BoxDecoration(
                color: kColorWhite,
                borderRadius: BorderRadius.circular(25),
              ),
              labelColor: Colors.black,
              labelStyle: defaultTextStyle,
              tabs: const [
                Tab(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text('Coming Soon'),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text("Everyone's Watching"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: getTopMovies(upcomingMovies),
              builder: (context, snapshot) =>snapshot.connectionState==ConnectionState.done? ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        DateBox(
                          date: snapshot.data![index].releaseDate!,
                        ),
                        Expanded(
                          flex: 5,
                          child: MovieBox(currentMovie: snapshot.data![index])
                        ),
                      ],
                    ),
                  );
                },
              ):const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}
