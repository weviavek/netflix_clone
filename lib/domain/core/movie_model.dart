class Movie {
  final String? title;
  final String? overview;
  final String? posterPath;
  final String? releaseDate;
  final String? mainImage;

  Movie(
      {required this.title,
      required this.overview,
      required this.posterPath,
      required this.releaseDate,
      required this.mainImage});
  factory Movie.fromJson(Map<String, dynamic> json) {
    Movie currentMovie = Movie(
        title: json['original_title'] ?? json['name'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        releaseDate: json['release_date'],
        mainImage: json['backdrop_path']);
    return currentMovie;
  }
}
