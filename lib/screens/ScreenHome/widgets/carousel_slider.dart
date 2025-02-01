import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/models/categories.dart';
import 'package:netflix/screens/ScreenDetails/screen_details.dart';
import 'package:netflix/screens/widgets/loading_indicator.dart';
import 'package:netflix/utils/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:netflix/models/movie_class.dart';

// ignore: must_be_immutable
class CustomPageView extends StatefulWidget {
  final Future<ContentCategories> categories;
  bool prime;
  bool isSubNeeded;

  CustomPageView({
    required this.prime,
    required this.isSubNeeded,
    super.key,
    required this.categories,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomPageViewState createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    String infoText = "";
    if (widget.isSubNeeded) {
      infoText = "Subscribe to watch";
    } else if (widget.prime) {
      infoText = "Watch with Prime";
    }

    return FutureBuilder<ContentCategories>(
      future: widget.categories,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: LoadingCircle());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return Center(child: Text('No Data Available'));
        } else {
          final category = snapshot.data!;
          return Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: category.movieList.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index % category.movieList.length;
                    });
                  },
                  itemBuilder: (context, index) {
                    if (category.movieList.isEmpty) {
                      return Center(child: Text('No movies available'));
                    }
                    int currentIndex = index % category.movieList.length;
                    Movie movie = category.movieList[currentIndex];

                    var withOpacity = const Color.fromARGB(174, 255, 255, 255);

                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ScreenDetails(movie: movie)));
                      },
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white),
                        child: Stack(
                          children: [
                            ClipRRect(
                              child: Image.network(
                                movie.backdropPath,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                            Positioned(
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    end: Alignment.topCenter,
                                    begin: Alignment.bottomCenter,
                                    colors: [
                                      const Color.fromARGB(202, 0, 0, 0),
                                      const Color.fromARGB(0, 0, 0, 0),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    movie.title,
                                    style: GoogleFonts.emilysCandy(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: withOpacity,
                                    ),
                                  ),
                                  Visibility(
                                    visible: widget.prime || widget.isSubNeeded,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.shopping_bag,
                                            color: Colors.yellow,
                                            size: 13,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            infoText,
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: AppStyle.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  pageSnapping: true,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 5,
                  effect: ExpandingDotsEffect(
                    radius: 6,
                    dotWidth: 8,
                    dotHeight: 8,
                    spacing: 6,
                    dotColor: Colors.grey,
                    activeDotColor: Colors.white,
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
