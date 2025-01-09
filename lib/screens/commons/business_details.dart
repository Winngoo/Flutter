import 'package:flutter/material.dart';
import '../../styles/appstyles.dart';
import '../../widgets/buttons/green_btn.dart';

class BusinessDetailsScreen extends StatelessWidget {
  final String companyName;
  final String location;
  final String status;
  final String imageUrl;

  const BusinessDetailsScreen({
    Key? key,
    required this.companyName,
    required this.location,
    required this.status,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
              _buildHeader(context),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const SizedBox(height: 40),
                  // _buildHeader(context),
                  const SizedBox(height: 20),
                  _buildCompanyInfo(),
                  _buildDivider(),
                  _buildSectionTitle('Descriptions:'),
                  const SizedBox(height: 10),
                  _buildSectionContent('Retail shop, newspapers, household items.'),
                  _buildDivider(),
                  _buildSectionTitle('Special Promotion:'),
                  const SizedBox(height: 10),
                  _buildSectionContent(
                      'No special promotion available, coming soon!'),
                  _buildDivider(),
                  _buildCategorySection(
                      'Categories:', ['Super Market', 'Flower Shop']),
                  _buildCategorySection('Sub Categories:', ['Others']),
                  _buildCategorySection('Others:', ['Retail Shop']),
                  _buildDivider(),
                  _buildSectionTitle('Address'),
                  const SizedBox(height: 10),
                  _buildSectionContent(
                    '687 High Road, London N17 8AD, UK, London, N17 8AD, United Kingdom.',
                  ),
                  _buildDivider(),
                  _buildContactDetails(),
                  _buildDivider(),
                  _buildRowWithArrow('Map', 'View Google Map'),
                  _buildDivider(),
                  _buildRowWithArrow('Business Hours', 'Open Now: until 10.00 pm'),
                  _buildDivider(),
                  _buildRowWithArrow('Reviews & Ratings', 'content need'),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
     
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      //  const SizedBox(width: 15),
        Text('Business Details', style: AppStyles.topHeading),
      ],
    );
  }

  Widget _buildCompanyInfo() {
    return Row(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Aligns image and column properly
      children: [
        Container(
          width: 173,
          height: 147,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl), // Ensure your imageUrl is valid
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          // Ensures column takes up remaining space
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Aligns text to the left
            children: [
              SizedBox(
                height: 32,
              ),
              Text(
                companyName,
                style: AppStyles.companyName,
                overflow: TextOverflow.ellipsis, // Handles long text
                maxLines: 2, // Allows wrapping text if needed
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_rounded,
                    color: AppStyles.primaryColor,
                  ),
                  const SizedBox(width: 5),
                  Text('', style: AppStyles.locationText)
                  // Text(
                  //   location,
                  //   style: AppStyles.locationText,
                  // ),
                ],
              ),
              const SizedBox(height: 15),
              Container(
                width: 130,
                height: 30,
                decoration: ShapeDecoration(
                  color: Color(0xFF4F8A8B),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.mail_outline_rounded,
                      color: Colors.white,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'contact owner',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        height: 1.25,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDivider({
    double thickness = 2.0,
    double indent = 0.0,
    double endIndent = 0.0,
    Color color = Colors.black12,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Divider(
        thickness: thickness,
        indent: indent,
        endIndent: endIndent,
        color: color,
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title, style: AppStyles.sectionTitle);
  }

  Widget _buildSectionContent(String content) {
    return Text(content, style: AppStyles.sectionContent);
  }

  Widget _buildCategorySection(String title, List<String> categories) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(title),
        const SizedBox(height: 10),
        Row(
          children: categories
              .map((category) => Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GreenButton(
                      label: category,
                      onPressed: () {
                        print('$category clicked!');
                      },
                    ),
                  ))
              .toList(),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildContactDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Email ID:'),
        const SizedBox(height: 10),
        Text('vjaccys@gmail.com', style: AppStyles.emailText),
        const SizedBox(height: 10),
        _buildSectionTitle('Telephone:'),
        const SizedBox(height: 10),
        Text('9876543120', style: AppStyles.sectionContent),
        const SizedBox(height: 10),
        _buildSectionTitle('Website:'),
        const SizedBox(height: 10),
        Column(
          children: [
            Text('winngoo.com', style: AppStyles.websiteText),
            Container(
              width: 91,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 0.3,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0xFF1518D0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRowWithArrow(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppStyles.sectionTitle,
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: Colors.black,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            subtitle,
            style: AppStyles.sectionContent,
            textAlign: TextAlign.end,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
