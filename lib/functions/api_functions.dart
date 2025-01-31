import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:netflix/models/api.dart';
import 'package:netflix/models/categories.dart';
import 'package:netflix/models/movie_class.dart';

class Api {
  Dio dio = Dio();

  // Fetch trending movies
  Future<ContentCategories> getTrendingAll() async {
    try {
      final response = await dio.get(Constants.trendingAll, queryParameters: {
        'language': Constants.language,
        'api_key': Constants.apiKey,
      });
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['results'];
        List<Movie> movieList = data.map((json) => Movie.fromJson(json)).toList();
        return ContentCategories(title: 'Trending All', movieList: movieList);
      } else {
        throw Exception('Failed to load trending movies');
      }
    } catch (e) {
      log("Error: $e");
      return ContentCategories(title: 'Trending All', movieList: []);
    }
  }

  // Fetch subscription content (same URL as trending, modify if needed)
  Future<ContentCategories> getSubscriptionContent() async {
    try {
      final response = await dio.get(Constants.trendingAll, queryParameters: {
        'language': Constants.language,
        'api_key': Constants.apiKey,
      });
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['results'];
        List<Movie> movieList = data.map((json) => Movie.fromJson(json)).toList();
        return ContentCategories(title: 'Subscription Movies', movieList: movieList);
      } else {
        throw Exception('Failed to load subscription movies');
      }
    } catch (e) {
      log("Error: $e");
      return ContentCategories(title: 'Subscription Movies', movieList: []);
    }
  }

  Future<ContentCategories> getMoviesByGenre(List<int> genreIds) async {
    try {
      final response = await dio.get(Constants.discoverMovies, queryParameters: {
        'api_key': Constants.apiKey,
        'with_genres': genreIds.join(','), // Convert genre IDs to comma-separated values
        'language': Constants.language,
        'sort_by': Constants.sortBy, // Optional: Sort movies by popularity
      });

      if (response.statusCode == 200 && response.data != null) {
        final List<dynamic> data = response.data['results'] ?? [];
        final List<Movie> movieList = data.map((json) => Movie.fromJson(json)).toList();
        return ContentCategories(title: 'Genre Movies', movieList: movieList);
      } else {
        throw Exception('Failed to load genre movies');
      }
    } catch (e, stackTrace) {
      log("Error fetching genre movies: $e", stackTrace: stackTrace);
      return ContentCategories(title: 'Genre Movies', movieList: []);
    }
  }


   Future<ContentCategories> getTrendingPrime() async {
    ContentCategories trending = await Api().getTrendingAll();
    List<Movie> primeMovies =
        trending.movieList.where((movie) => movie.isPrime).toList();

    return ContentCategories(title: "Trending Prime", movieList: primeMovies);
  }

  Future<List<ContentCategories>> getPrimeContent() async {
    List<ContentCategories> allCategories = await Future.wait([
      
      Api().getNowPlayingMovies(),
      Api().getTopRatedMovies(),
      Api().getUpcomingMovies(),
      Api().getPopularMovies(),
    ]);

    List<ContentCategories> primeCategories = allCategories.map((category) {
      List<Movie> primeMovies =
          category.movieList.where((movie) => movie.isPrime).toList()..reversed;
      return ContentCategories(title: category.title, movieList: primeMovies);
    }).toList();

    return primeCategories;
  }

  Future<ContentCategories> searchMovies(String query) async {
    try {
      final response = await dio.get(Constants.searchMovies, queryParameters: {
        'api_key': Constants.apiKey,
        'language': Constants.language,
        'query': query,
      });

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['results'];
        List<Movie> movieList = data.map((json) => Movie.fromJson(json)).toList();
        return ContentCategories(title: 'Search Results for: $query', movieList: movieList);
      } else {
        throw Exception('Failed to search movies');
      }
    } catch (e) {
      log("Error searching for movies: $e");
      return ContentCategories(title: 'Search Results for: $query', movieList: []);
    }
  }

  Future<ContentCategories> getMoviesByLanguage(String languageCode, String title) async {
    try {
      final response = await dio.get(Constants.discoverMovies, queryParameters: {
        'api_key': Constants.apiKey,
        'with_original_language': languageCode,
        'sort_by': Constants.sortBy, // Optional: Sort movies by popularity
      });

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['results'] ?? [];
        List<Movie> movieList = data.map((json) => Movie.fromJson(json)).toList();
        return ContentCategories(title: title, movieList: movieList);
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      log("Error fetching movies in $languageCode: $e");
      return ContentCategories(title: title, movieList: []);
    }
  }

  // Fetch popular movies
  Future<ContentCategories> getPopularMovies() async {
    try {
      final response = await dio.get("${Constants.baseUrl}/movie/popular", queryParameters: {
        'api_key': Constants.apiKey,
        'language': Constants.language,
      });
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['results'];
        List<Movie> movieList = data.map((json) => Movie.fromJson(json)).toList();
        return ContentCategories(title: 'Popular Movies', movieList: movieList);
      } else {
        throw Exception('Failed to load popular movies');
      }
    } catch (e) {
      log("Error fetching popular movies: $e");
      return ContentCategories(title: 'Popular Movies', movieList: []);
    }
  }

  // Fetch now playing movies
  Future<ContentCategories> getNowPlayingMovies() async {
    try {
      final response = await dio.get("${Constants.baseUrl}/movie/now_playing", queryParameters: {
        'api_key': Constants.apiKey,
        'language': Constants.language,
      });
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['results'];
        List<Movie> movieList = data.map((json) => Movie.fromJson(json)).toList();
        return ContentCategories(title: 'Now Playing', movieList: movieList);
      } else {
        throw Exception('Failed to load now playing movies');
      }
    } catch (e) {
      log("Error fetching now playing movies: $e");
      return ContentCategories(title: 'Now Playing', movieList: []);
    }
  }

  // Fetch top rated movies
  Future<ContentCategories> getTopRatedMovies() async {
    try {
      final response = await dio.get("${Constants.baseUrl}/movie/top_rated", queryParameters: {
        'api_key': Constants.apiKey,
        'language': Constants.language,
      });
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['results'];
        List<Movie> movieList = data.map((json) => Movie.fromJson(json)).toList();
        return ContentCategories(title: 'Top Rated Movies', movieList: movieList);
      } else {
        throw Exception('Failed to load top rated movies');
      }
    } catch (e) {
      log("Error fetching top rated movies: $e");
      return ContentCategories(title: 'Top Rated Movies', movieList: []);
    }
  }

  // Fetch upcoming movies
  Future<ContentCategories> getUpcomingMovies() async {
    try {
      final response = await dio.get("${Constants.baseUrl}/movie/upcoming", queryParameters: {
        'api_key': Constants.apiKey,
        'language': Constants.language,
      });
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['results'];
        List<Movie> movieList = data.map((json) => Movie.fromJson(json)).toList();
        return ContentCategories(title: 'Upcoming Movies', movieList: movieList);
      } else {
        throw Exception('Failed to load upcoming movies');
      }
    } catch (e) {
      log("Error fetching upcoming movies: $e");
      return ContentCategories(title: 'Upcoming Movies', movieList: []);
    }
  }
}
