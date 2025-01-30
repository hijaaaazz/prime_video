import 'package:flutter/material.dart';
import 'package:netflix/screens/ScreenHome/widgets/carousel_slider.dart';
import 'package:netflix/screens/ScreenHome/widgets/shows_categories.dart';
import 'package:netflix/screens/widgets/appbar.dart';
import 'package:netflix/screens/widgets/base_ui.dart';

class ScreenSubscription extends StatefulWidget {
  const ScreenSubscription({super.key});

  @override
  State<ScreenSubscription> createState() => _ScreenSubscriptionState();
}

class _ScreenSubscriptionState extends State<ScreenSubscription> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(title: 'Subscription'),
            SizedBox(
                  height: MediaQuery.of(context).size.height * 0.29,
                  width: double.infinity,
                  child: CustomPageView(),
                ),
                MovieCategories(),
          ],
        ),
      ),
    );
  }
}