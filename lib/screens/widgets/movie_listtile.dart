import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/models/movie_class.dart';
import 'package:netflix/screens/ScreenDetails/screen_details.dart';

// ignore: must_be_immutable
class MovieListTile extends StatefulWidget {
  Movie movie;
   MovieListTile({super.key, required this.movie});

  @override
  State<MovieListTile> createState() => _MovieListTileState();
}

class _MovieListTileState extends State<MovieListTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScreenDetails(movie: widget.movie)));
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
                                      child: Image.network(
                                        widget.movie.backdropPath,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) {
                                          return Image.asset(
                                            'assets/images/placeholder.jpeg', 
                                            fit: BoxFit.cover,
                                          );
                                        },
                                      )

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
                                          widget.movie.releaseDate.substring(0,4), // Placeholder for movie details
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