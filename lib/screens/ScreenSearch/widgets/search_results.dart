import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchResultsList extends StatefulWidget {
  const SearchResultsList({super.key});

  @override
  State<SearchResultsList> createState() => _SearchResultsListState();
}

class _SearchResultsListState extends State<SearchResultsList> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Results",
          style: GoogleFonts.outfit(
            fontSize: 20,
            fontWeight: FontWeight.w800
          ),),
          SizedBox(
            width: double.infinity,
            height: 500,

            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context,index){
              return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                 
                ),
                child: Row(
                  children: [
                   
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: AspectRatio(
                        aspectRatio: 16 / 9,  
                        child: Container(
                          
                          color: Colors.yellowAccent,  
                        ),
                      ),
                    ),

                    // Expanded widget to fill the remaining space
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Title",
                            style: GoogleFonts.lato(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            "Year Duration",
                            style: GoogleFonts.outfit(
                              fontSize: 14,
                              color: const Color.fromARGB(255, 219, 219, 219),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // Aligning the Icon to the top-left
                    Align(
                      alignment: Alignment.topLeft,
                      child: Icon(
                        Icons.more_vert,
                        color: const Color.fromARGB(255, 219, 219, 219),
                      ),
                    ),
                  ],
                ),
              ),
            );

            }),
          )
        ],
      );
      }
  }
