import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/screens/ScreenFilteredList/screen_filtered.dart';

class FilterSelection extends StatelessWidget {
  const FilterSelection({super.key});

  @override
  Widget build(BuildContext context) {
    // Define genre map
    final Map<String, List<int>> genreMap = {
      "Action, Adventure": [28, 12], 
      "Anime": [16], 
      "Comedy": [35], 
      "Documentary": [99], 
      "Drama": [18], 
      "Fantasy": [14], 
    };

    final Map<String,String> languages = {
  "Hindi": "hi",
  "English": "en",
  "Telugu": "te",
  "Tamil": "ta",
  "Malayalam": "ml"
};

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Genres",
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),

        // Grid for genre selection
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 2.5,
          ),
          itemCount: genreMap.length, // Use genre map length
          itemBuilder: (context, index) {
            String genreName = genreMap.keys.toList()[index]; // Get genre name
            List<int> genreIds = genreMap.values.toList()[index]; // Get genre IDs

            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ScreenFilterdList(
                    title: genreName, // Pass genre name
                    genreIds: genreIds, // Pass genre IDs
                    filterType: FilterType.genre,
                  ),
                ));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF141C27),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      genreName, // Use correct genre name
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: GoogleFonts.lato(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),

        Center(
          child: Container(
            margin: EdgeInsets.only(top: 25),
            width: 120,
            height: 40,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 73, 71, 71),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Center(
              child: Text(
                "See more",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),

        // Featured collections (Languages)
        Container(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Featured collections',
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Column(
            children: 
            languages.entries.map((entry) {
              return Column(
                children: [
                  Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ScreenFilterdList(
                          lang: entry.value, // Pass language here
                          title: entry.key,
                          filterType: FilterType.language, 
                          genreIds: [],
                        ),
                      ));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          entry.key,
                          style: GoogleFonts.outfit(
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),
          ),

            ],
          ),
        ),
      ],
    );
  }
}
