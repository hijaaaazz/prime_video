class Constants {
  // Your API key for The Movie Database API
  

  // Base URL for The Movie Database API
  static const baseUrl = "https://api.themoviedb.org/3";

  // Endpoints
  static const trendingAll = "$baseUrl/trending/movie/day";
  static const searchMovies = "$baseUrl/search/movie";
  static const discoverMovies = "$baseUrl/discover/movie";
  
  // Additional Query Parameters
  static const language = "en-US";
  static const sortBy = "popularity.desc";
}
