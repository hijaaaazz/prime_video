import 'package:flutter/material.dart';
import 'package:netflix/models/categories.dart';
import 'package:netflix/screens/ScreenHome/widgets/carousel_slider.dart';
import 'package:netflix/screens/ScreenHome/widgets/shows_categories.dart';

// ignore: must_be_immutable
class BaseUi extends StatefulWidget {
  Future<List<ContentCategories>> allContent;
  Future<ContentCategories> pageViewList;
  bool isPrime = false;
  bool isSubNeeded = false;

   BaseUi({super.key,required this.isPrime, required this.allContent,required this.isSubNeeded, required this.pageViewList});

  @override
  State<BaseUi> createState() => _BaseUiState();
}



class _BaseUiState extends State<BaseUi> {
  @override
  Widget build(BuildContext context) {
    
    return Column(
              children: [
                
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.29,
                  width: double.infinity,
                  child: CustomPageView(prime: widget.isPrime, isSubNeeded: widget.isSubNeeded, categories: widget.pageViewList),
                ),
                MovieCategories(movieCategories: widget.allContent,prime: widget.isPrime,isSubNeeded: widget.isSubNeeded),
              ],
            );
  }
}