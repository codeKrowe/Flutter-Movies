class Movie {
  int id;
  String title;
  double voteAverage;
  String releaseDate;
  String overview;
  String posterPath;

  Movie(this.id, this.title, this.voteAverage, this.releaseDate, this.overview, this.posterPath);

  // dynamic: can change TYPE of the variable, & can change VALUE of the variable later in code.
  // var: can't change TYPE of the variable, but can change VALUE of the variable later in code.
  // final: can't change TYPE of the variable, & can't change VALUE of the variable later in code.
  Movie.fromJson(Map<String, dynamic> parsedJson) {
    this.id = parsedJson['id'];
    this.title = parsedJson['title'];
    this.voteAverage = parsedJson['vote_average'] * 1.0;
    this.releaseDate = parsedJson['release_date'];
    this.overview = parsedJson['overview'];
    this.posterPath = parsedJson['poster_path'];
  }
}
