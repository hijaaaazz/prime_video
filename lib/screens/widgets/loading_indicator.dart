import 'package:flutter/material.dart';

class LoadingCircle extends StatelessWidget {
  const LoadingCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Center(
        child: CircularProgressIndicator(
          color: const Color.fromARGB(255, 161, 41, 32),
        ),
      ),
    );
  }
}