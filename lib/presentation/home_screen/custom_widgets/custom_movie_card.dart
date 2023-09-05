import 'package:flutter/material.dart';
import 'package:netflix_clone/domain/core/movie_model.dart';
import 'package:netflix_clone/presentation/movie_details/movie_details.dart';

class CustomMovieCard extends StatelessWidget {
  final Movie currentMovie;
  const CustomMovieCard({super.key, required this.currentMovie});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    MovieDetailsPage(currentMovie: currentMovie),
              ));
            },
            child: Column(
              children: [
                SizedBox(
                  width: width * .3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: currentMovie.posterPath != ''
                        ? Image.network(
                            "https://image.tmdb.org/t/p/w500${currentMovie.posterPath}",
                          )
                        : const Text('Loading...'),
                  ),
                ),
                SizedBox(
                  width: width * .3,
                  child: currentMovie.title != ''
                      ? Text(
                          currentMovie.title!,
                          overflow: TextOverflow.ellipsis,
                        )
                      : const Text('Loading...'),
                )
              ],
            )));
  }
}
