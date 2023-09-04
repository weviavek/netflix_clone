import 'package:flutter/material.dart';
import 'package:netflix_clone/domain/core/movie_model.dart';

class CustomMovieCard extends StatelessWidget {
  final Movie currentMovie;
  const CustomMovieCard({Key? key, required this.currentMovie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        height: 220,
        width: 150,
        child: InkWell(
          onTap: () {},
          child: SizedBox(
            width: width * 0.3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: currentMovie.posterPath != null
                  ? Image.network(
                      "https://image.tmdb.org/t/p/w500${currentMovie.posterPath}",
                    )
                  : Image.asset("assets/images/no_image.png"),
            ),
          ),
        ),
      ),
    );
  }
}
