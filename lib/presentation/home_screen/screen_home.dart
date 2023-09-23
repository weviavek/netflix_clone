// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart';
import 'package:netflix_clone/domain/core/end_points.dart';
import 'package:netflix_clone/domain/core/movie_model.dart';
import 'package:netflix_clone/domain/core/orgine.dart';
import 'package:netflix_clone/presentation/dialogs/erroe_dialog.dart';
import 'package:netflix_clone/presentation/home_screen/custom_widgets/custom_section.dart';
import 'package:netflix_clone/presentation/home_screen/custom_widgets/trending_section.dart';
import 'package:netflix_clone/presentation/home_screen/main_banner/main_banner.dart';

import '../../core/notifiers.dart';
import '../../infrastructure/api_details.dart';
import 'custom_app_bar/home_screen_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  Future<List<Movie>> getTopMovies(String currentEndPoint,BuildContext context) async {
    final response = await get(
        Uri.parse('$orgineSite$currentEndPoint?api_key=$apiKey'),
        headers: {HttpHeaders.authorizationHeader: accessToken});
    List<Movie> movieList = json
        .decode(response.body)['results']
        .map<Movie>((json) => Movie.fromJson(json))
        .toList();
    if (response.statusCode != 200&&!showingDialog) {
      showErrorDialog(context);
    }
    return movieList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          if (notification.direction == ScrollDirection.forward) {
            homeAppBarNotifier.value = true;
          }
          if (notification.direction == ScrollDirection.reverse) {
            homeAppBarNotifier.value = false;
          }
          return true;
        },
        child: Stack(children: [
          ListView(
            children: [
              const MainScreenBanner(),
              FutureBuilder(
                  future: getTopMovies(topMovies,context),
                  builder: (context, snapshot) =>
                      snapshot.connectionState == ConnectionState.done
                          ? CustomSection(
                              currentList: snapshot.data!,
                              title: 'Top Movies',
                            )
                          : const SizedBox()),
              FutureBuilder(
                  future: getTopMovies(trendingMovies,context),
                  builder: (context, snapshot) =>
                      snapshot.connectionState == ConnectionState.done &&
                              snapshot.hasData
                          ? TrendingSection(
                              currentList: snapshot.data!,
                              title: 'Trending Shows',
                            )
                          : const SizedBox()),
              FutureBuilder(
                  future: getTopMovies(popularMovies,context),
                  builder: (context, snapshot) =>
                      snapshot.connectionState == ConnectionState.done
                          ? CustomSection(
                              currentList: snapshot.data!,
                              title: 'Popular Movies',
                            )
                          : const SizedBox()),
              FutureBuilder(
                  future: getTopMovies(upcomingMovies,context),
                  builder: (context, snapshot) =>
                      snapshot.connectionState == ConnectionState.done
                          ? CustomSection(
                              currentList: snapshot.data!,
                              title: 'Upcoming Movies',
                            )
                          : const SizedBox())
            ],
          ),
          ValueListenableBuilder(
              valueListenable: homeAppBarNotifier,
              builder: (context, value, _) =>
                  value == true ? const HomeScreenAppBar() : const SizedBox()),
        ]),
      ),
    );
  }
}
