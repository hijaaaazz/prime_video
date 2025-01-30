import 'package:flutter/material.dart';
import 'package:netflix/screens/ScreenHome/widgets/carousel_slider.dart';
import 'package:netflix/screens/ScreenHome/widgets/filterchip.dart';
import 'package:netflix/screens/ScreenHome/widgets/shows_categories.dart';
import 'package:netflix/screens/widgets/base_ui.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(  // Ensure the entire body is scrollable
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.black,
              title: Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.02,
                  top: MediaQuery.of(context).size.height * 0.015,
                ),
                height: 30,
                width: 300,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    "assets/images/prime_video2.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              centerTitle: false,
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.podcasts)),
                IconButton(onPressed: () {}, icon: Icon(Icons.person)),
              ],
            ),
            BaseUi()
          ],
        ),
      ),
    );
  }
}
