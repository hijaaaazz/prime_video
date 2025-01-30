import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/screens/ScreenFilteredList/screen_filtered.dart';

class FilterSelection extends StatelessWidget {
  const FilterSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Genres",
                  style: GoogleFonts.outfit(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                  ),),
        
                  GridView.builder(
                    shrinkWrap: true,  
                    physics: NeverScrollableScrollPhysics(),  
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,  
                      crossAxisSpacing: 10,  
                      mainAxisSpacing: 10,  
                      childAspectRatio: 2.5,  
                    ),
                    itemCount: 6,  
                    itemBuilder: (context, index) {
                      List<String> labels = ["Acion and Adventure", "Anime", "Comedy", "Documentary", "Drama", "Fantasy"];
        
                      return GestureDetector(
                        onTap: () {
                          print("Tapped on ${labels[index]}");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF141C27),
                            borderRadius: BorderRadius.circular(2)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                labels[index],  
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: GoogleFonts.lato(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                                )
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
        
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 25),
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 73, 71, 71),
                        borderRadius: BorderRadius.circular(40)
                      ),
                      child: Center(
                        child: Text("See more",
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          fontSize: 18),)),
                    ),
                  ),
        
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Featured collections',
                        style: GoogleFonts.outfit(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                          ),),
                          
                         Column(
                          children: [
                            "Hindi",
                            "English",
                            "Telugu",
                            "Tamil",
                            "Malayalam"
                          ].map((language) {
                            return Column(
                              children: [
                                Divider(
                                  thickness: 0.5,
                                  color: Colors.grey,
                                  height: 30,
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ScreenFilterdList(title: language,)));
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        language,
                                        style: GoogleFonts.outfit(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        )
        
                          
                      ],
                    ),
                  )
        
        
        
        
                ],
              );
  }
}