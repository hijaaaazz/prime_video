import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/screens/ScreenFilteredList/screen_filtered.dart';
import 'package:netflix/screens/ScreenSearch/widgets/fiter_selection.dart';
import 'package:netflix/screens/ScreenSearch/widgets/search_results.dart';
import 'package:netflix/screens/widgets/appbar.dart';
import 'package:netflix/utils/colors.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}
class _ScreenSearchState extends State<ScreenSearch> {
  bool isSearchClicked = false; // Move this to the state class
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(title: "Search"),
            Container(
              margin: EdgeInsets.all(25),
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 65,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.grey,
                  width: 2
                ),
                color: AppStyle.white
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.movie_creation,color: Colors.grey,),
                  Container(
                    width: 180,
                    height: 80,
                    child: Center(
                      child: TextFormField(
                        cursorColor: Colors.grey,
                        cursorHeight: 20,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: GoogleFonts.lato(
                            color: Colors.grey,
                            fontSize: 19
                          ),
                          hintText: 'Search by actor, title, director.....'
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: (){
                      setState(() {
                        isSearchClicked = !isSearchClicked; // Toggles the search state
                      });
                    },
                    icon: Icon(Icons.search, color: AppStyle.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: isSearchClicked ? 
              SearchResultsList()// This widget is shown when search is clicked
              : FilterSelection(), // This widget is shown when search is not clicked
            ),
          ],
        ),
      ),
    );
  }
}
