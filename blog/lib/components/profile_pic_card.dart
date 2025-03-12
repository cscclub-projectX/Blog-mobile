import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

class ProfilePicCard extends StatelessWidget {
  const ProfilePicCard({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32.0),
            border: GradientBoxBorder(
              width: 3,
              gradient: LinearGradient(
                colors: [
                  Color(0xFF376AED),
                  Color(0xFF49B0E2),
                  Color(0xFF9CECFB),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
