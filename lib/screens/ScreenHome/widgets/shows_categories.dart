import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/screens/ScreenDetails/screen_details.dart';

class MovieCategories extends StatelessWidget {
  final List<Map<String, dynamic>> movieCategories = [
    {
      'title': 'Watch for Free',
      'movies': [
        'https://via.placeholder.com/400x200/FF0000/FFFFFF?text=FreeMovie1',
        'https://via.placeholder.com/400x200/00FF00/FFFFFF?text=FreeMovie2',
        'https://via.placeholder.com/400x200/0000FF/FFFFFF?text=FreeMovie3',
      ],
    },
    {
      'title': 'Watch in Your Language',
      'movies': [
        'https://via.placeholder.com/400x200/FFFF00/FFFFFF?text=LanguageMovie1',
        'https://via.placeholder.com/400x200/FF00FF/FFFFFF?text=LanguageMovie2',
        'https://via.placeholder.com/400x200/00FFFF/FFFFFF?text=LanguageMovie3',
      ],
    },
    {
      'title': 'Original Series',
      'movies': [
        'https://via.placeholder.com/400x200/FF0000/FFFFFF?text=SeriesMovie1',
        'https://via.placeholder.com/400x200/00FF00/FFFFFF?text=SeriesMovie2',
        'https://via.placeholder.com/400x200/0000FF/FFFFFF?text=SeriesMovie3',
      ],
    },
    {
      'title': 'South Indian Movies',
      'movies': [
        'https://via.placeholder.com/400x200/123456/FFFFFF?text=SouthMovie1',
        'https://via.placeholder.com/400x200/654321/FFFFFF?text=SouthMovie2',
        'https://via.placeholder.com/400x200/987654/FFFFFF?text=SouthMovie3',
      ],
    },
    {
      'title': 'Action Movies',
      'movies': [
        'https://via.placeholder.com/400x200/000000/FFFFFF?text=ActionMovie1',
        'https://via.placeholder.com/400x200/FFFFFF/000000?text=ActionMovie2',
        'https://via.placeholder.com/400x200/123ABC/FFFFFF?text=ActionMovie3',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(  
      child: Column(
        children: List.generate(movieCategories.length, (index) {
          final category = movieCategories[index];
          final movies = category['movies'] as List<String>;

          return Padding(
            padding: const EdgeInsets.only(left:15,bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category['title'],
                  style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8,),
                Container(
  height: 120,
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: movies.length,
    itemBuilder: (context, movieIndex) {
     
      double width = 120 * 16 / 9;

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ScreenDetails()));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
            width: width,
            height: 120, 
            // child: ClipRRect(
              
            //   borderRadius: BorderRadius.circular(15),
            //   child: Image.network(
                
            //     movies[movieIndex],
            //     fit: BoxFit.cover,
            //   ),
            // ),
          ),
        ),
      );
    },
  ),
)

              ],
            ),
          );
        }),
      ),
    );
  }
}

