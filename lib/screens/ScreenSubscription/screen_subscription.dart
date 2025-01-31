import 'package:flutter/material.dart';
import 'package:netflix/functions/api_functions.dart';
import 'package:netflix/models/categories.dart';
import 'package:netflix/screens/widgets/appbar.dart';
import 'package:netflix/screens/widgets/base_ui.dart';

class ScreenSubscription extends StatefulWidget {
  const ScreenSubscription({super.key});

  @override
  State<ScreenSubscription> createState() => _ScreenSubscriptionState();
}

class _ScreenSubscriptionState extends State<ScreenSubscription> {
  late Future<List<ContentCategories>> subscriptionCategories;
  late Future<ContentCategories> trendingSubContents;

  @override
  void initState() {
    super.initState();
    subscriptionCategories = _fetchSubscriptionCategories();
    trendingSubContents = Api().getTrendingAll();
  }

  Future<List<ContentCategories>> _fetchSubscriptionCategories() async {
    return Future.wait([
      Api().getTopRatedMovies(), 
      Api().getPopularMovies(), 
      Api().getNowPlayingMovies(),
     
    ]);
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(title: 'Subscription'),
            BaseUi(
              isPrime: false,
              isSubNeeded: true,
              allContent: subscriptionCategories,
              pageViewList: trendingSubContents, 
            ),
          ],
        ),
      ),
    );
  }
}
