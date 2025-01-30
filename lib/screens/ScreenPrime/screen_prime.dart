import 'package:flutter/material.dart';
import 'package:netflix/screens/widgets/appbar.dart';
import 'package:netflix/screens/widgets/base_ui.dart';

class ScreenPrime extends StatefulWidget {
  const ScreenPrime({super.key});

  @override
  State<ScreenPrime> createState() => _ScreenPrimeState();
}

class _ScreenPrimeState extends State<ScreenPrime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(title: "Prime"),
            BaseUi()
          ],
        ),
      ),
    );
  }
}