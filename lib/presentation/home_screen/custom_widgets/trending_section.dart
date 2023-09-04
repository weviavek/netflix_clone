import 'package:flutter/material.dart';
import 'package:netflix_clone/core/appbar_text_style.dart';
import 'package:netflix_clone/domain/core/movie_model.dart';
import 'package:netflix_clone/presentation/home_screen/custom_widgets/top_ten_tile.dart';

class TrendingSection extends StatelessWidget {
  final List<Movie> currentList;
  final String title;
  const TrendingSection(
      {super.key, required this.currentList, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          title,
          style: defaultTextStyle,
        ),
      ),
      SizedBox(
        height: 220,
        child: ListView.builder(
          itemBuilder: (context, index) => TopTenTile(
            currentMovie: currentList[index],
            index: index + 1,
          ),
          itemCount: 10,
          scrollDirection: Axis.horizontal,
        ),
      ),
    ]);
  }
}
