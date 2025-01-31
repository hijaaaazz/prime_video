class Movie {
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String posterPath; // Full URL for poster
  final String backdropPath;
  final String mediaType;
  final bool adult;
  final String originalLanguage;
  final List<int> genreIds;
  final double popularity;
  final String releaseDate;
  final bool video;
  final double voteAverage;
  final int voteCount;
  final bool isPrime; 

  Movie({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.mediaType,
    required this.adult,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  }) : isPrime = voteAverage >= 7.0; // If rating is 7.0 or higher, mark as Prime

  factory Movie.fromJson(Map<String, dynamic> json) {
    double voteAvg = (json['vote_average'] as num).toDouble();
    
    return Movie(
      id: json['id'],
      title: json['title'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      posterPath: "https://image.tmdb.org/t/p/w500${json['poster_path']}",
      backdropPath: "https://image.tmdb.org/t/p/w500${json['backdrop_path']}",
      mediaType: json['media_type'] ?? "",
      adult: json['adult'] ?? false,
      originalLanguage: json['original_language'],
      genreIds: List<int>.from(json['genre_ids'] ?? []),
      popularity: (json['popularity'] as num).toDouble(),
      releaseDate: json['release_date'] ?? "",
      video: json['video'] ?? false,
      voteAverage: voteAvg,
      voteCount: json['vote_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'original_title': originalTitle,
      'overview': overview,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'media_type': mediaType,
      'adult': adult,
      'original_language': originalLanguage,
      'genre_ids': genreIds,
      'popularity': popularity,
      'release_date': releaseDate,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'is_prime': isPrime, // Added to JSON output
    };
  }
}
