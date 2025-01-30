import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/utils/colors.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget {
  String title;
   CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppStyle.black,
      title: Text(
                title,
                style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
        centerTitle: false,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.podcasts)),
          IconButton(onPressed: (){}, icon: Icon(Icons.person)),
        ]);
  }
}