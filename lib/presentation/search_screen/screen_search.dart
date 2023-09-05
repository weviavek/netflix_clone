import 'package:flutter/material.dart';
import 'package:netflix_clone/core/appbar_text_style.dart';
import 'package:netflix_clone/core/notifiers.dart';
import 'package:netflix_clone/presentation/search_screen/core.dart';
import 'package:netflix_clone/presentation/search_screen/search_box.dart';
import 'package:netflix_clone/presentation/search_screen/search_results.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  getMovies() async {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchBox(),
          ValueListenableBuilder(
            valueListenable: searchNotifier,
            builder: (context, value, _) => query == ''
                ? Text("Top Searches",style: defaultTextStyle.copyWith(fontSize: 20),)
                : Text("Top Matches",style: defaultTextStyle.copyWith(fontSize: 20)),
          ),
          const SearchResult()
        ],
      ),
    ));
  }
}
