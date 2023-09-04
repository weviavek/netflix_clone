import 'package:flutter/material.dart';
import 'package:netflix_clone/domain/core/movie_model.dart';
import 'package:netflix_clone/presentation/home_screen/custom_widgets/border_letter.dart';
import 'package:netflix_clone/presentation/home_screen/custom_widgets/custom_movie_card.dart';

class TopTenTile extends StatelessWidget {
  final Movie currentMovie;
  final int index;
  const TopTenTile({
    super.key,
    required this.currentMovie,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Stack(
        children: [
          Positioned(
              right: 0, child: CustomMovieCard(currentMovie: currentMovie)),
          Positioned(
            left: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: BorderLetter(index: index),
            ),
          )
        ],
      ),
    );
  }
}
