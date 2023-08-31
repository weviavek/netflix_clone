import 'package:netflix_clone/presentation/downloads_screen/srcreen_downloads.dart';
import 'package:netflix_clone/presentation/fast_laugh_screen/screen_fast_laugh.dart';
import 'package:netflix_clone/presentation/home_screen/screen_home.dart';
import 'package:netflix_clone/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix_clone/presentation/search_screen/screen_search.dart';

List mainScreenItems = const[
  HomeScreen(),
  NewAndHotScreen(),
  FastLaughScreen(),
  SearchScreen(),
  DownloadsScreen()
];
