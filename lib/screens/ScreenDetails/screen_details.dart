import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/models/genre_class.dart';
import 'package:netflix/models/movie_class.dart';
import 'package:netflix/screens/ScreenDetails/widgets/activities.dart';
import 'package:netflix/screens/widgets/appbar.dart';
import 'package:netflix/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class ScreenDetails extends StatefulWidget {

  Movie movie;
   ScreenDetails({super.key, required this.movie});

  @override
  State<ScreenDetails> createState() => _ScreenDetailsState();
}

class _ScreenDetailsState extends State<ScreenDetails> {
  

  @override
  Widget build(BuildContext context) {
   
  final Map<String, String> languageMap = {
  'en': 'English',
  'ml': 'Malayalam',
  'ta': 'Tamil',
  'te': 'Telugu',
  'hi': 'Hindi',
};


    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(title: ''),
            Stack(
              children: [
                Image.network(widget.movie.posterPath, fit: BoxFit.cover),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(0, 0, 0, 0),
                          Color.fromARGB(255, 0, 0, 0)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.movie.originalTitle,
                      style: GoogleFonts.outfit(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                      
                  Container(
                    margin: EdgeInsets.only(right: 35),
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                        color: AppStyle.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "Watch with Prime",
                        style: GoogleFonts.lato(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 51, 51, 51),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal, 
                      children: [
                      GestureDetector(
                        onTap: () async {
                          final movieTitle = widget.movie.title;
                          final query = '$movieTitle trailer';
                          final Uri url = Uri.parse('https://www.youtube.com/results?search_query=$query');

                         
                            await launchUrl(url);
                         
                        },
                        child: ActivityIcons(icon: Icons.movie, label: "Trailer"),
                      ),

                        ActivityIcons(icon: Icons.watch_later, label: "Watchlist"),
                        ActivityIcons(icon: Icons.thumb_up, label: "Like"),
                        ActivityIcons(icon: Icons.thumb_down, label: "Not for me"),
                        ActivityIcons(icon: Icons.share, label: "Share"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.movie.overview,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    style: GoogleFonts.outfit(fontSize: 15),
                  ),
                  SizedBox(height: 6),
                  Text(
                    widget.movie.genreIds
                        .map((id) => GenreConverter.getGenreName(id)) // Convert IDs to genre names
                        .join(", "), // Join the names into a single string with commas
                    style: GoogleFonts.outfit(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 10),
                  Text(widget.movie.voteAverage.toString()),
                  Text('2024 175 min'),
                  SizedBox(height: 15),
                  Container(
                    height: 30,
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(166, 131, 129, 129),
                      borderRadius: BorderRadius.circular(5), // Rounded corners
                    ),
                    child: Text(
                      widget.movie.adult? 'A 18+' :'U/A',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),

                    Text(
                      "Language",
                      style: GoogleFonts.lato(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      languageMap[widget.movie.originalLanguage] ?? widget.movie.originalLanguage, 
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(height: 20),
                Text(
                  "Release Date",  // Use the key as the header (e.g., "Director")
                  style: GoogleFonts.outfit(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  widget.movie.releaseDate,  // Use the value (e.g., "Lalettan")
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.outfit(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),

                
                  SizedBox(height: 50,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
