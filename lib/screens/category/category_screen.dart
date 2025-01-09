import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../services/model/all_category_api.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CategoryProvider()..fetchCategories(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
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
          //  SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                    ),
                    SizedBox(width: 15),
                    Text(
                      'All Categories',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 1.22,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: Consumer<CategoryProvider>(
                builder: (context, categoryProvider, child) {
                  if (categoryProvider.categories.isEmpty) {
                    return Center(child: CircularProgressIndicator());
                  }

                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: categoryProvider.categories.length,
                      itemBuilder: (context, index) {
                        final category = categoryProvider.categories[index];
                        return Column(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              padding: const EdgeInsets.all(10),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 2, color: Color(0xFF0F7E95)),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                              ),
                              child: Center(
                                child: category.categoryImage != null
                                    ? Image.network(
                                        category.categoryImage!,
                                        fit: BoxFit.cover,
                                        height: 30,
                                        width: 30,
                                      )
                                    : Icon(Icons.image),
                              ),
                            ),
                            SizedBox(
                                height: 5), // Add space between image and text
                            Text(
                              category.categoryNameEn ?? 'Unknown',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 6,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height:
                                    1.3, // Adjust line height for better readability
                              ),
                              textAlign: TextAlign.center,
                            ),
                            //  SizedBox(height: 10,)
                          ],
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String label;
  final Color borderColor;
  final String categoryImageUrl;

  Category({
    required this.label,
    required this.borderColor,
    required this.categoryImageUrl,
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
              side: BorderSide(width: 2, color: borderColor),
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
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontSize: 8,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              //height: 2.20,
            ),
            textAlign: TextAlign.center, // Center-align text
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class CategoryProvider with ChangeNotifier {
  List<AllCategoryAPI> _categories = [];

  List<AllCategoryAPI> get categories => _categories;

  Future<void> fetchCategories() async {
    final String url = 'https://winngoouk.wimbgo.com/api/featurecategories';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Decode the response as a map
        final Map<String, dynamic> jsonData = json.decode(response.body);

        // Assuming the list of categories is under the 'data' key
        final List<dynamic> categoriesList = jsonData['data'];

        // Map the list to model
        _categories = categoriesList
            .map((data) => AllCategoryAPI.fromJson(data))
            .toList();

        notifyListeners();
      } else {
        print(
            'Error: Failed to load categories. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
