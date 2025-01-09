import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final VoidCallback onPressed;  // To handle button press action

  // Constructor to pass the onPressed callback for custom action
  const FilterButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,  // Handle button press with the passed function
      child: Container(
        width: 100,
        height: 30,
        padding: const EdgeInsets.only(
            top: 4, left: 9, right: 7, bottom: 4),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Color(0xFF0F7E95),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: Row(
          children: [
            Text(
              'Filter',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                height: 1.38,
              ),
            ),
            SizedBox(width: 27),
            Container(
              width: 18,
              height: 13.8,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(),
              child: ImageIcon(
                AssetImage('assets/images/Vector.png'),
                size: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
