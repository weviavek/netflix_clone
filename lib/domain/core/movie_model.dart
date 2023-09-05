class Movie {
  final String? title;
  final String? overview;
  final String? posterPath;
  final String? releaseDate;
  final String? mainImage;
  final String? rating;

  Movie(
      {required this.title,
      required this.overview,
      required this.posterPath,
      required this.releaseDate,
      required this.mainImage,
      required this.rating
      });
  factory Movie.fromJson(Map<String, dynamic> json) {
    Movie currentMovie = Movie(
        title: json['original_title'] ?? json['name']??'not available',
        overview: json['overview']??'not available',
        posterPath: json['poster_path'],
        releaseDate: json['release_date']??json['first_air_date']??'not available',
        mainImage: json['backdrop_path'],
        rating: json['vote_average'].toString()
        );
    return currentMovie;
  }
}
