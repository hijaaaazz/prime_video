import 'package:flutter/material.dart';
import 'package:netflix/functions/api_functions.dart';
import 'package:netflix/models/categories.dart';
import 'package:netflix/screens/ScreenHome/widgets/filterchip.dart';
import 'package:netflix/screens/widgets/base_ui.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {

  late Future <List<ContentCategories>> allContent;

  late Future<ContentCategories> trendingAll;
  late Future<ContentCategories> popularAll;
  late Future<ContentCategories> nowPlaying;
  late Future<ContentCategories> topRated;
  late Future<ContentCategories> upComing;

  @override
void initState() {
  super.initState();

  trendingAll = Api().getTrendingAll();
  popularAll = Api().getUpcomingMovies();
  nowPlaying = Api().getPopularMovies();
  topRated = Api().getNowPlayingMovies();
  upComing = Api().getTopRatedMovies();

  allContent = Future.wait([popularAll,nowPlaying,topRated,upComing]);
}

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(  // Ensure the entire body is scrollable
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.black,
              title: Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.02,
                  top: MediaQuery.of(context).size.height * 0.015,
                ),
                height: 30,
                width: 300,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    "assets/images/prime_video2.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              centerTitle: false,
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.podcasts)),
                IconButton(onPressed: () {}, icon: Icon(Icons.person)),
              ],
            ),
            SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        CustomFilterChip(text: 'Movies'),
                        CustomFilterChip(text: 'TV shows'),
                        
                      ],
                    ),
                  ),
                ),
            BaseUi(
              isPrime: false,
              isSubNeeded: false,
              allContent:allContent,pageViewList: trendingAll,)
          ],
        ),
      ),
    );
  }
}
