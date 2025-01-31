import 'package:flutter/material.dart';
import 'package:netflix/functions/api_functions.dart'; 
import 'package:netflix/models/categories.dart'; 
import 'package:netflix/screens/widgets/appbar.dart';
import 'package:netflix/screens/widgets/loading_indicator.dart'; 
import 'package:netflix/screens/widgets/movie_listtile.dart';

enum FilterType {
  genre,
  language,
}

class ScreenFilterdList extends StatefulWidget {
  final String title;
  final FilterType filterType;
  final String? lang;
  final List<int> genreIds;

  const ScreenFilterdList({super.key, required this.title, required this.filterType, required this.genreIds,this.lang});

  @override
  State<ScreenFilterdList> createState() => _FilterdListState();
}

class _FilterdListState extends State<ScreenFilterdList> {
  Future<ContentCategories> fetchAllContentCategories() async {
    await Future.delayed(Duration(seconds: 2)); 

    switch (widget.filterType) {
      case FilterType.genre:

        return 
          await Api().getMoviesByGenre(widget.genreIds); 
         
      case FilterType.language:
        return 
          await Api().getMoviesByLanguage(widget.lang?? 'en-US',widget.title);

      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(title: widget.title),
            FutureBuilder<ContentCategories>(
              future: fetchAllContentCategories(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: LoadingCircle());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.movieList.isEmpty) {
                  return Center(child: Text('No content available.'));
                } else {
                  final contentCategories = snapshot.data!;
                  return SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height *0.9,
                    child: ListView.builder(
                      itemCount: contentCategories.movieList.length,
                      itemBuilder: (context, index) {
                        final movie = contentCategories.movieList[index];
                        return MovieListTile(movie: movie);
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
