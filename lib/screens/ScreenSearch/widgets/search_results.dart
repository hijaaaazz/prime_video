import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/models/categories.dart';
import 'package:netflix/screens/widgets/loading_indicator.dart';
import 'package:netflix/screens/widgets/movie_listtile.dart'; // Assuming the Movie class is here


class SearchResultsList extends StatelessWidget {
  final String searchQuery;
  final ContentCategories? searchResults;
  final bool isLoading;

  const SearchResultsList({
    super.key,
    required this.searchQuery,
    required this.searchResults,
    required this.isLoading,
  });
@override
Widget build(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Results for: $searchQuery",
        style: GoogleFonts.outfit(
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),
      ),
      SizedBox(
        width: double.infinity,
        height: 500,
        child: isLoading
            ? Center(child: LoadingCircle())  // Show a loading spinner
            : (searchResults == null || searchResults!.movieList.isEmpty)
                ? Center(child: Text("No results found"))
                : ListView.builder(
                    // Ensure we're safely accessing the list here
                    itemCount: searchResults!.movieList.length, // Ensure the length is accurate
                    itemBuilder: (context, index) {
                      if (index >= searchResults!.movieList.length) {
                        return Container(); 
                      }
                      var movie = searchResults!.movieList[index];
                      return MovieListTile(movie: movie);
                    },
                  ),
      ),
    ],
  );
}
}