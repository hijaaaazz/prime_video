import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/screens/ScreenMain/screen_main.dart';
import 'package:netflix/utils/colors.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppStyle appStyle = AppStyle(); 

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: appStyle.primaryColor,
        scaffoldBackgroundColor: AppStyle.black, 
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            iconColor: WidgetStateProperty.all<Color>(Colors.white), 
            iconSize: WidgetStateProperty.all<double>(20),
          ),
        ),

        iconTheme: IconThemeData(
          
        ),
        fontFamily: GoogleFonts.montserrat().fontFamily,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: AppStyle.white),
          bodyMedium: TextStyle(color: AppStyle.white),
          bodySmall: TextStyle(color: AppStyle.white), 
        ),
      ),
      home: const ScreenMain(),
    );
  }
}
