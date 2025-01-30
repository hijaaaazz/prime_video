
import 'package:flutter/material.dart';
import 'package:netflix/screens/ScreenMain/screen_main.dart';
import 'package:netflix/utils/colors.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {

  @override
  void initState(){
    super.initState();

    Future.delayed(const Duration(seconds: 3), (){
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ScreenMain(),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.black,
      body: Center(
        child: Image.asset(
          'assets/images/prime_video.jpeg',
          width: 235,
          height: 235,
        )
      ),
    );
  }
}