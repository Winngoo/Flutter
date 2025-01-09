import 'package:flutter/material.dart';
class GreenButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final double width;
  final double height;
  final TextStyle textStyle;
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry borderRadius;

  const GreenButton({
    Key? key,
    required this.label,
    this.onPressed,
    this.width = 110,
    this.height = 30,
    this.textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    this.borderRadius = const BorderRadius.all(Radius.circular(4)),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          color:  Color(0xFF4F8A8B),
          borderRadius: borderRadius,
        ),
        child: Center(
          child: Text(
            label,
            style: textStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
