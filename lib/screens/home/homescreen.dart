import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:winngoo_pages/screens/home/customer_login_screen.dart';
import 'package:http/http.dart' as http;
import '../../services/model/all_category_api.dart';
import '../../services/model/latest_listings.dart';
import '../../styles/appstyles.dart';
import '../../widgets/buttons/blue_btn.dart';
import '../../widgets/customdropdown.dart';
import '../../widgets/latest_listing_card.dart';
import 'advertise_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<AllCategoryAPI> apiCategories = [];
  List<LatestListing> latestListings = [];
  bool isLoading = true;
  TextEditingController _textController = TextEditingController();
  bool _isContainerVisible = false;
  String? _selectedOption;

  void _onDropdownChanged(String? newValue) {
    setState(() {
      _selectedOption = newValue;
      _isContainerVisible = newValue != null && newValue.isNotEmpty;
    });
  }

  Future<void> fetchLatestListings() async {
    final String url = 'https://winngoouk.wimbgo.com/api/latestlisting';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        if (jsonResponse['success'] == true && jsonResponse['data'] != null) {
          setState(() {
            latestListings = (jsonResponse['data'] as List)
                .map((item) => LatestListing.fromJson(item))
                .toList();
            isLoading = false;
          });
        }
      } else {
        print('Error: Server returned ${response.statusCode}');
      }
    } catch (e) {
      print('Client exception occurred: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> fetchCategories() async {
    final String url = 'https://winngoouk.wimbgo.com/api/featurecategories';

    try {
      print('Sending request to: $url');
      final response = await http.get(Uri.parse(url));
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        // Decode the response body
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        // Check if 'data' is available in the response
        if (jsonResponse['data'] != null) {
          List<dynamic> data = jsonResponse['data'];
          print('Parsed response data: $data');

          // Map the data into a list of AllCategoryAPI objects
          setState(() {
            apiCategories =
                data.map((item) => AllCategoryAPI.fromJson(item)).toList();
          });
        } else {
          print('No categories data found');
        }
      } else {
        print('Error: Server returned ${response.statusCode}');
      }
    } catch (e) {
      print('Client exception occurred: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCategories();
    fetchLatestListings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 170,
                    height: 54,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/images/winngo page logo with name-3 2.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/gg_profile.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Stack(
              children: [
                Container(
                  height: 434,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/images/businessmen-working-strategic-planning 1.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  left: 65,
                  top: 23,
                  child: const Text(
                    'JOIN US TO BE A PART',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Positioned(
                  left: 10,
                  right: 10,
                  top: 70,
                  child: Row(
                    children: [
                      BlueButton(
                        label: 'Advertise with Us',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdvertiseScreen()),
                          );
                        },
                      ),
                      const SizedBox(width: 20),
                      BlueButton(
                        label: 'Customer Login',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CustomerLoginScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 20,
                  right: 20,
                  top: 133,
                  child: const Text(
                    'Discover Your Daily Business Needs',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Positioned(
                  left: 15,
                  right: 15,
                  top: 207,
                  child: Column(
                    children: [
                      CustomDropdown(
                        label: 'Select By',
                        onChanged: (String? value) {},
                      ),
                      const SizedBox(height: 15),
                      // Custom Dropdown
                      CustomDropdown(
                        label: 'Select Business Type',
                        options: ['Address', 'City', 'Postcode', 'Business'],
                        onChanged: _onDropdownChanged,
                      ),

                      const SizedBox(height: 15),

                      // Conditionally render the third container
                      if (_isContainerVisible)
                        Container(
                          width: 263,
                          height: 34,
                          padding: const EdgeInsets.symmetric(
                              vertical: 7, horizontal: 15),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: Colors.black.withOpacity(0.3),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Center(
                            child: TextField(
                              controller: _textController,
                              decoration: InputDecoration(
                                hintText: 'Enter text here',
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Positioned(
                  left: 80,
                  right: 80,
                  top: 370,
                  child: Row(
                    children: [
                      _buildActionButton('Search', const Color(0xFF0F7E95)),
                      const SizedBox(width: 20),
                      _buildActionButton('Clear', const Color(0xFFD60A02)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Featured Categories',
                  style: AppStyles.heading2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: apiCategories.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : Row(
                        children: apiCategories.map((category) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Category(
                              label: category.categoryNameEn ?? 'Unknown',
                              borderColor: Color(0xFF0F7E95),
                              categoryImageUrl: category.categoryImage ??
                                  'https://via.placeholder.com/150',
                            ),
                          );
                        }).toList(),
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Latest Listings',
                  style: AppStyles.heading2,
                ),
              ),
            ),
            SizedBox(height: 15),
            isLoading
                ? Center(child: CircularProgressIndicator())
                : latestListings.isEmpty
                    ? Center(child: Text("No listings found"))
                    : Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Wrap(
                              alignment: WrapAlignment.start,
                              spacing: 8, // Space between cards in a row
                              runSpacing: 8, // Space between rows
                              children: latestListings.map((listing) {
                                return SizedBox(
                                  width: (MediaQuery.of(context).size.width -
                                          56) /
                                      2, // Adjust card width for two in a row
                                  child: LatestListingCard(
                                    assetImage: listing.imageUrl,
                                    title: listing.tradingName,
                                    location:
                                        '${listing.city}, ${listing.country}',
                                  ),
                                );
                              }).toList(),
                            )
                          ],
                        ),
                      ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(String label, Color color) {
    return Container(
      width: 90,
      height: 36,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(40),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String label;
  final Color borderColor;
  final String categoryImageUrl; // Network image URL

  Category({
    required this.label,
    required this.borderColor,
    required this.categoryImageUrl, // Pass the network image URL here
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(15),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 2, color: Color(0xFF0F7E95)),
              borderRadius: BorderRadius.circular(70),
            ),
          ),
          child: categoryImageUrl.isNotEmpty
              ? Image.network(
                  categoryImageUrl,
                  fit: BoxFit.cover,
                  height: 30,
                  width: 30,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Center(child: Icon(Icons.error));
                  },
                )
              : Icon(Icons.image),
        ),
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
