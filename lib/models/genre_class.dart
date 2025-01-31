class GenreConverter {
  static const Map<int, String> genreMap = {
    28: "Action",
    12: "Adventure",
    16: "Animation",
    35: "Comedy",
    80: "Crime",
    99: "Documentary",
    18: "Drama",
    10751: "Family",
    14: "Fantasy",
    36: "History",
    27: "Horror",
    10402: "Music",
    9648: "Mystery",
    10749: "Romance",
    878: "Science Fiction",
    10770: "TV Movie",
    53: "Thriller",
    10752: "War",
    37: "Western",
    // Add more as needed
  };

  static String getGenreName(int genreId) {
    return genreMap[genreId] ?? "Unknown Genre"; 
  }

  // Reversing the genre name back to genre ID
  static int? getGenreId(String genreName) {
    // Searching for the genre name and returning its corresponding ID
    for (var entry in genreMap.entries) {
      if (entry.value.toLowerCase() == genreName.toLowerCase()) {
        return entry.key;
      }
    }
    return null; // Return null if the genre name is not found
  }
}
