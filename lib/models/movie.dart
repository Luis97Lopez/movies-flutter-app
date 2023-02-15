class Movie {
  String title;
  String year;
  String poster;
  String plot;
  bool isEmpty;

  Movie(
      {required this.title,
      required this.year,
      required this.poster,
      required this.plot,
      this.isEmpty = false});

  factory Movie.fromJson(Map<String, dynamic> json) {
    String poster = "N/A";

    if (json['Poster'] != null) {
      poster = json['Poster'];
    }

    return Movie(
        title: json['Title'],
        year: json['Year'],
        poster: poster,
        plot: json['Plot']);
  }

  factory Movie.getEmpty() {
    return Movie(plot: '', title: '', poster: '', year: '', isEmpty: true);
  }
}
