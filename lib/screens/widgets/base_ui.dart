import 'package:flutter/material.dart';
import 'package:netflix/screens/ScreenHome/widgets/carousel_slider.dart';
import 'package:netflix/screens/ScreenHome/widgets/filterchip.dart';
import 'package:netflix/screens/ScreenHome/widgets/shows_categories.dart';

class BaseUi extends StatefulWidget {
  const BaseUi({super.key});

  @override
  State<BaseUi> createState() => _BaseUiState();
}

class _BaseUiState extends State<BaseUi> {
  @override
  Widget build(BuildContext context) {
    return Column(
              children: [
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.29,
                  width: double.infinity,
                  child: CustomPageView(),
                ),
                MovieCategories(),
              ],
            );
  }
}