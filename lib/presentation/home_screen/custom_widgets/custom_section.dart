import 'package:flutter/material.dart';
import 'package:netflix_clone/core/appbar_text_style.dart';
import 'package:netflix_clone/domain/core/movie_model.dart';
import 'package:netflix_clone/presentation/home_screen/custom_widgets/custom_movie_card.dart';

class CustomSection extends StatelessWidget {
  final List<Movie> currentList;
  final String title;
  const CustomSection(
      {super.key, required this.currentList, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title,style: defaultTextStyle,),
      SizedBox(
        height: 220,
        child: ListView.builder(
          itemBuilder: (context, index) =>
              CustomMovieCard(currentMovie: currentList[index]),
          itemCount: currentList.length,
          scrollDirection: Axis.horizontal,
        ),
      ),
    ]);
  }
}
