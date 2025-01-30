import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/screens/widgets/appbar.dart';

class ScreenDownload extends StatefulWidget {
  
  const ScreenDownload({super.key});

  @override
  State<ScreenDownload> createState() => _ScreenDownloadState();
}

class _ScreenDownloadState extends State<ScreenDownload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: 'Downloads'),
          Expanded(  // To allow centering properly
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min, // Keeps the column compact
                mainAxisAlignment: MainAxisAlignment.center, // Centers vertically
                crossAxisAlignment: CrossAxisAlignment.center, // Centers horizontally
                children: [
                  Text("No videos downloaded",
                  style: GoogleFonts.outfit(
                            color: Colors.white, 
                            fontWeight: FontWeight.bold,
                            fontSize: 18,

                          ),),
                  SizedBox(height: 40,),
                  InkWell(
                  onTap: () {
                    
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 87, 87, 87),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 50,
                    child: Center(
                      child: Text(
                        'Find videos to download',
                        style: GoogleFonts.outfit(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),


                  SizedBox(height: 40,),
                                    RichText(
                    textAlign: TextAlign.center, 
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Auto Downloads: On  •  ",
                          style: GoogleFonts.outfit(
                            color: Colors.white, 
                            fontWeight: FontWeight.bold,
                            fontSize: 14,

                          ),
                        ),
                        
                        TextSpan(
                          text: "Manage downloads",
                          style: GoogleFonts.outfit(
                            color: Colors.blue, 
                            fontWeight: FontWeight.bold,
                            fontSize: 14,

                          ),
                        ),
                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
        ],
      ),
    );

  }
}