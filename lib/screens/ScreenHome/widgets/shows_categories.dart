
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/models/categories.dart';
import 'package:netflix/screens/ScreenDetails/screen_details.dart';
import 'package:netflix/screens/widgets/loading_indicator.dart';
import 'package:netflix/utils/colors.dart';

// ignore: must_be_immutable
class MovieCategories extends StatefulWidget {
  final Future<List<ContentCategories>> movieCategories;
  bool prime ;
  bool isSubNeeded;

   MovieCategories({super.key,required this.prime,required this.isSubNeeded, required this.movieCategories});

  @override
  State<MovieCategories> createState() => _MovieCategoriesState();
}

class _MovieCategoriesState extends State<MovieCategories> {
  @override
  Widget build(BuildContext context) {
    String infoText = "";
    if(widget.isSubNeeded){
      infoText = "Subscribe to Watch";
    }else if(widget.prime){
      infoText = "Watch with Prime";
    }
    return FutureBuilder<List<ContentCategories>>(
      future: widget.movieCategories,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: LoadingCircle());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No movie categories available."));
        } else {
          return SingleChildScrollView(
            child: Column(
              children: List.generate(snapshot.data!.length, (categoryIndex) {
                final categoryMovies = snapshot.data![categoryIndex];

                return Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        categoryMovies.title,
                        style: GoogleFonts.outfit(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 150,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categoryMovies.movieList.length,
                          itemBuilder: (context, movieIndex) {
                            final movie = categoryMovies.movieList[movieIndex];

                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          ScreenDetails(movie: movie)));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 120 * 16 / 9,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: movie.backdropPath.isNotEmpty
                                              ? NetworkImage(movie.backdropPath)
                                              : const AssetImage('assets/images/barroz.jpg') as ImageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                    
                                      ),
                                    ),
                                    
                                    Visibility(
                                      visible: widget.prime || widget.isSubNeeded,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Row(
                                          children: [
                                            Icon(Icons.shopping_bag,color: Colors.yellow,size: 13,),
                                            SizedBox(width: 5,),
                                            Text(infoText,
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: AppStyle.white
                                            ),),
                                          ],
                                        ),
                                      ))
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          );
        }
      },
    );
  }
}
