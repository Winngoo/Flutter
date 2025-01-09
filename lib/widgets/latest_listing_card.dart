import 'package:flutter/material.dart';

class LatestListingCard extends StatelessWidget {
  final String assetImage;
  final String title;
  final String location;
  final IconData icon;

  const LatestListingCard({
    Key? key,
    required this.assetImage,
    required this.title,
    required this.location,
    this.icon = Icons.location_on,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 158,
      height: 165,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: Color(0x7F0F7E95)),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image Section - Changed AssetImage to NetworkImage
          Container(
            width: 90,
            height: 90,
            margin: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(assetImage), // Use NetworkImage for URL
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 8),
          // Title Section
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 1.17,
            ),
          ),
          const SizedBox(height: 4),
          // Location Section
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 16,
                color: Colors.black,
              ),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  location,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    height: 1.27,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
