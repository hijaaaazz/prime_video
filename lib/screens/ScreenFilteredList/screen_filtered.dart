import 'package:flutter/material.dart';
import 'package:netflix/screens/widgets/appbar.dart';
import 'package:netflix/screens/widgets/base_ui.dart';

class ScreenFilterdList extends StatefulWidget {
  String title;
   ScreenFilterdList({super.key,required this.title});

  @override
  State<ScreenFilterdList> createState() => _FilterdListState();
}

class _FilterdListState extends State<ScreenFilterdList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SingleChildScrollView(
      child: Column(
        children: [
          CustomAppBar(title: widget.title),
          BaseUi()
        ],
      ),
    ),
    );
  }
}