import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/models/movie_class.dart';
import 'package:netflix/screens/ScreenDetails/screen_details.dart';

class MovieListTile extends StatefulWidget {
  final Movie movie;

  const MovieListTile({super.key, required this.movie});

  @override
  State<MovieListTile> createState() => _MovieListTileState();
}

class _MovieListTileState extends State<MovieListTile> {
  @override
  Widget build(BuildContext context) {
       if (widget.movie.title.isEmpty) {
      return Center(child: Text('No movie data available.'));
    }

    return GestureDetector(
      onTap: () {
        // Navigate to the details page, passing the movie object
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ScreenDetails(movie: widget.movie),
        ));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: widget.movie.backdropPath.isNotEmpty
                      ? Image.network(
                          widget.movie.backdropPath,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/images/placeholder.jpeg',
                              fit: BoxFit.cover,
                            );
                          },
                        )
                      : Image.asset(
                          'assets/images/placeholder.jpeg',
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.movie.title,
                      maxLines: 2,
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      widget.movie.releaseDate.isNotEmpty
                          ? widget.movie.releaseDate.substring(0, 4)
                          : 'N/A',
                      style: GoogleFonts.outfit(
                        fontSize: 14,
                        color: const Color.fromARGB(255, 219, 219, 219),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Icon(
                  Icons.more_vert,
                  color: const Color.fromARGB(255, 219, 219, 219),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
