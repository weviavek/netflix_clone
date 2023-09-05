import 'package:flutter/material.dart';
import 'package:netflix_clone/domain/core/image_path.dart';
import 'package:netflix_clone/domain/core/movie_model.dart';

import '../../movie_details/movie_details.dart';

class ResultTile extends StatelessWidget {
  final Movie currentMovie;
  const ResultTile({super.key, required this.currentMovie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    MovieDetailsPage(currentMovie: currentMovie),
              ));
      },
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: MediaQuery.sizeOf(context).width * .3,
                height: 80,
                child: currentMovie.mainImage != null
                    ? Image.network(
                        '$imagePath${currentMovie.mainImage}',
                      )
                    : Image.asset('assets/images/no_image.png')),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * .60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentMovie.title!,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Release Date : ${currentMovie.releaseDate!}',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
