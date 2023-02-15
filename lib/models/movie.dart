class Movie {
  String title;
  String year;
  String poster;
  String plot;
  String realesed;
  String rottenRating;

  Movie(
      {required this.title,
      required this.year,
      required this.poster,
      required this.realesed,
      required this.rottenRating,
      required this.plot});

  factory Movie.fromJson(Map<String, dynamic> json) {
    String poster = "N/A";

    if (json['Poster'] != null) {
      poster = json['Poster'];
    }

    List<dynamic> ratings = json['Ratings'];
    Iterable<dynamic> rottenInfo =
        ratings.where((rating) => rating["Source"] == 'Rotten Tomatoes');

    return Movie(
        title: json['Title'],
        year: json['Year'],
        poster: poster,
        plot: json['Plot'],
        rottenRating: rottenInfo.first["Value"],
        realesed: json['Released']);
  }
}
