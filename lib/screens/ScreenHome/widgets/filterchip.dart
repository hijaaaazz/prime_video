import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/utils/colors.dart';

// ignore: must_be_immutable
class CustomFilterChip extends StatefulWidget {
  String text;
  CustomFilterChip({super.key, required this.text});

  @override
  // ignore: library_private_types_in_public_api
  _CustomFilterChipState createState() => _CustomFilterChipState();
}

class _CustomFilterChipState extends State<CustomFilterChip> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.015),
      child: FilterChip(
        showCheckmark: false,
        shape: const StadiumBorder(side: BorderSide(color: AppStyle.white, width: 1)),
        backgroundColor: AppStyle.black,
        selectedColor: AppStyle.black,
        elevation: 2,
        label: FittedBox( // Ensure the text fits properly
          fit: BoxFit.scaleDown,
          child: Text(
            widget.text,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              color: AppStyle.white,
            ),
          ),
        ),
        onSelected: (bool selected) {
          setState(() {
            isSelected = selected;
          });
        },
        selected: isSelected,
      ),
    );
  }
}

