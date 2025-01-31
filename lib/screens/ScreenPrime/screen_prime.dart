import 'package:flutter/material.dart';
import 'package:netflix/functions/api_functions.dart';
import 'package:netflix/models/categories.dart';
import 'package:netflix/screens/ScreenHome/widgets/filterchip.dart';
import 'package:netflix/screens/widgets/appbar.dart';
import 'package:netflix/screens/widgets/base_ui.dart';

class ScreenPrime extends StatefulWidget {
  const ScreenPrime({super.key});

  @override
  State<ScreenPrime> createState() => _ScreenPrimeState();
}

class _ScreenPrimeState extends State<ScreenPrime> {
  late Future<List<ContentCategories>> primeContent;
  late Future<ContentCategories> trendingPrime;

  @override
  void initState() {
    super.initState();

    trendingPrime =Api().getTrendingPrime();
    primeContent = Api().getPrimeContent();
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(title: "Prime"),
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
              isPrime: true,
              isSubNeeded: false,
              allContent: primeContent, pageViewList: trendingPrime),
          ],
        ),
      ),
    );
  }
}
