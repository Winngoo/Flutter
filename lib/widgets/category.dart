import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String label;
  final Color borderColor;
  final String assetImage;
  final double size;

  const Category({
    Key? key,
    required this.label,
    required this.borderColor,
    required this.assetImage,
    this.size = 60, // Default size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: size,
          height: size,
          padding: const EdgeInsets.all(15),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 2, color: borderColor),
              borderRadius: BorderRadius.circular(70),
            ),
          ),
          child: Center(
            child: Image.asset(
              assetImage, // Asset image used for the icon
              width: 30,
              height: 30,
            ),
          ),
        ),
        SizedBox(height: 5), // Spacer between icon and text
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 10,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            height: 2.20,
          ),
        ),
      ],
    );
  }
}
