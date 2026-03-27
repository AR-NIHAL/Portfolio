import 'package:flutter/material.dart';

class PlaceholderPortrait extends StatelessWidget {
  const PlaceholderPortrait({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: const Center(
        child: Icon(Icons.person, size: 180, color: Colors.white24),
      ),
    );
  }
}
