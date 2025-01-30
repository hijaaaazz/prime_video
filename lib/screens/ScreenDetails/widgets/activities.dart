import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ActivityIcons extends StatelessWidget {
  IconData icon;
  String label;
   ActivityIcons({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.only(right: 30),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 30, color: Colors.white), // Icon
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ), // Label
      ],
    ),
  );
  }
}