import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:gradient_borders/gradient_borders.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({
    super.key,
    required this.image,
    required this.title,
    required this.viewed,
  });
  final String image;
  final String title;
  final bool viewed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
            border:
                viewed
                    ? null
                    : GradientBoxBorder(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF376AED),
                          Color(0xFF49B0E2),
                          Color(0xFF9CECFB),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      width: 2.0,
                    ),
          ),
          child:
              viewed
                  ? DottedBorder(
                    color: const Color(0xFF7B8BB2),
                    strokeWidth: 2.0,
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(24.0),
                    padding: EdgeInsets.zero,
                    dashPattern: const [6, 3],
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.0),
                          image: DecorationImage(
                            image: NetworkImage(image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  )
                  : Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.0),
                        image: DecorationImage(
                          image: NetworkImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
        ),
        Text(
          title,
          style: TextStyle(
            color: Color(0xFF2D4379),
            fontSize: 14,
            fontFamily: 'Avenir',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
