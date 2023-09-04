import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/search_screen/search_box.dart';
import 'package:netflix_clone/presentation/search_screen/search_results.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  getMovies()async{

  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: Column(children: [SearchBox(),SearchResult()],),
    ));
  }
}
