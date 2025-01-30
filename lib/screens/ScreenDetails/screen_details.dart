import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/screens/ScreenDetails/widgets/activities.dart';
import 'package:netflix/screens/widgets/appbar.dart';
import 'package:netflix/utils/colors.dart';

class ScreenDetails extends StatefulWidget {
  const ScreenDetails({super.key});

  @override
  State<ScreenDetails> createState() => _ScreenDetailsState();
}

class _ScreenDetailsState extends State<ScreenDetails> {
  // Boolean variable to toggle visibility of more details
  bool _isDetailsExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(title: ''),
            Stack(
              children: [
                Image.asset('assets/images/barroz.jpg', fit: BoxFit.cover),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(0, 0, 0, 0),
                          Color.fromARGB(255, 0, 0, 0)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Barroz',
                      style: GoogleFonts.outfit(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                  Container(
                    margin: EdgeInsets.only(right: 30),
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                        color: AppStyle.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "Watch with Prime",
                        style: GoogleFonts.lato(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 51, 51, 51),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal, // Horizontal scroll
                      children: [
                        ActivityIcons(icon: Icons.movie, label: "Trailer"),
                        ActivityIcons(icon: Icons.watch_later, label: "Watchlist"),
                        ActivityIcons(icon: Icons.favorite, label: "Like"),
                        ActivityIcons(icon: Icons.movie, label: "Trailer"),
                        ActivityIcons(icon: Icons.watch_later, label: "Watchlist"),
                        ActivityIcons(icon: Icons.favorite, label: "Like"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Digaama Thamburaante Vishwasthannaya nidhi sookshippukaaran, Nidhi kkodukkan bhoomiyileekk thirichu varunna barross and after effects",
                    style: GoogleFonts.outfit(fontSize: 17),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Fantasy, Action",
                    style: GoogleFonts.outfit(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text("IMDb 10"),
                  Text('2024 175 min'),
                  SizedBox(height: 15),
                  Container(
                    height: 30,
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(166, 131, 129, 129),
                      borderRadius: BorderRadius.circular(5), // Rounded corners
                    ),
                    child: Text(
                      'U/A 13+',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Language",
                    style: GoogleFonts.lato(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("Malayalam", style: TextStyle(color: Colors.white)),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "More Details",
                        style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _isDetailsExpanded = !_isDetailsExpanded; // Toggle the value
                          });
                        },
                        icon: _isDetailsExpanded?  Icon(Icons.arrow_drop_up): Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                  
                 Visibility(
                  visible: _isDetailsExpanded, 
                  child: ListView.builder(
                    shrinkWrap: true, // Allows the ListView to take up as much space as it needs
                    physics: NeverScrollableScrollPhysics(), // Prevent scrolling within the ListView
                    itemCount: 5, // The number of items in the details list
                    itemBuilder: (context, index) {
                      
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(
                              height: 20,
                            ),
                            Text(
                              "Director", // Use the header
                              style: GoogleFonts.outfit(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Lalettan", // Use the value
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.outfit(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                  SizedBox(height: 50,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
