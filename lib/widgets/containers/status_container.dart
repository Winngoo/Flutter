import 'package:flutter/material.dart';

import '../../screens/commons/business_details.dart';

class StatusContainer extends StatelessWidget {
  final String companyName;
  final String location;
  final String status;
  final String imageUrl;

  const StatusContainer({
    Key? key,
    required this.companyName,
    required this.location,
    required this.status,
    required this.imageUrl,
    required Null Function() onViewPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color statusColor = status == 'Open' ? Colors.green : Color(0xFFD60A02);
    String additionalText = '';

    if (status == 'Open') {
      additionalText = '- Opens At 11.00 am'; // Text for open status
    } else if (status == 'Closed') {
      additionalText = '- Opens At 11.00 am'; // Text for closed status
    }

    return Container(
      width: 340,
      height: 90,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0x660F7E95)),
          borderRadius: BorderRadius.circular(7),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 1),
            spreadRadius: 0,
          )
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: 5,
            top: 15,
            child: Container(
              width: 64,
              padding:
                  const EdgeInsets.only(top: 11, left: 7, right: 7, bottom: 14),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 2, color: Color(0xFF0F7E95)),
                  borderRadius: BorderRadius.circular(70),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 46,
                    height: 35,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 88,
            top: 62,
            child: Text(
              location,
              style: TextStyle(
                color: Colors.black,
                fontSize: 10,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 1.40,
              ),
            ),
          ),
          Positioned(
            left: 74,
            top: 38,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '$status ',
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 1.17,
                    ),
                  ),
                  TextSpan(
                    text: additionalText,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 1.17,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 69,
            top: 61,
            child: Container(
              width: 12,
              height: 15,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(),
              child: Icon(
                Icons.location_on_sharp,
                size: 14,
              ),
            ),
          ),
          Positioned(
            left: 74,
            top: 11,
            child: Text(
              companyName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 1.83,
              ),
            ),
          ),
          Positioned(
            left: 255,
            top: 30,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BusinessDetailsScreen(
                      companyName: companyName,
                      location: location,
                      status: status,
                      imageUrl: imageUrl,
                      // Country: Country,
                    ),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.only(
                    top: 2, left: 16, right: 15, bottom: 2),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Color(0xFF0F7E95),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'View ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 1.83,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
