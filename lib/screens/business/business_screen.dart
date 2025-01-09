// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// import '../../services/model/merchant.dart';
// import '../../styles/appstyles.dart';
// import '../../widgets/buttons/filter_btn.dart';
// import '../../widgets/containers/status_container.dart';

// class BusinessScreen extends StatefulWidget {
//   const BusinessScreen({Key? key}) : super(key: key);

//   @override
//   State<BusinessScreen> createState() => _BusinessScreenState();
// }

// class _BusinessScreenState extends State<BusinessScreen> {
//   List<Business> _businesses = [];
//   bool _isLoading = true;
//   String _errorMessage = '';

//   @override
//   void initState() {
//     super.initState();
//     fetchBusinesses();
//   }

//   Future<void> fetchBusinesses() async {
//     const url = 'https://winngoouk.wimbgo.com/api/business';

//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         final responseData = json.decode(response.body);
//         print(responseData); // Debugging: Check the structure of the response

//         // Accessing the "merchants" -> "data" to get the list of businesses
//         final List<dynamic> businessesList = responseData['merchants']['data'];

//         setState(() {
//           _businesses =
//               businessesList.map((data) => Business.fromJson(data)).toList();
//           _isLoading = false;
//         });
//       } else {
//         setState(() {
//           _errorMessage = 'Failed to load data: ${response.statusCode}';
//           _isLoading = false;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _errorMessage = 'An error occurred: $e';
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15),
//         child: _isLoading
//             ? const Center(child: CircularProgressIndicator())
//             : _errorMessage.isNotEmpty
//                 ? Center(child: Text(_errorMessage))
//                 : Column(
//                     children: [
//                       const SizedBox(height: 40),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               const Icon(Icons.arrow_back_ios_new, size: 20),
//                               const SizedBox(width: 15),
//                               Text('Business', style: AppStyles.topheading),
//                             ],
//                           ),
//                           FilterButton(
//                             onPressed: () {
//                               // Custom action when the filter button is pressed
//                               print("Filter button pressed");
//                             },
//                           )
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text.rich(
//                           TextSpan(
//                             children: [
//                               TextSpan(
//                                 text: 'We found ',
//                                 style: TextStyle(
//                                   color: Colors.black.withOpacity(0.5),
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: '${_businesses.length} ',
//                                 style: const TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: 'Items for you!',
//                                 style: TextStyle(
//                                   color: Colors.black.withOpacity(0.5),
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       Expanded(
//                         child: ListView.builder(
//                           itemCount: _businesses.length,
//                           itemBuilder: (context, index) {
//                             final business = _businesses[index];
//                             return Padding(
//                               padding: const EdgeInsets.only(bottom: 20),
//                               child: StatusContainer(
//                                 companyName: business
//                                     .businessName, // Use 'businessName' instead of 'name'
//                                 location: business.address,
//                                 status: business.status,
//                                 imageUrl: business
//                                     .imageUrl, // Use 'imageUrl' instead of 'logo'
//                                 onViewPressed: () {
//                                   print(
//                                       'View button clicked for ${business.businessName}'); // Use 'businessName' instead of 'name'
//                                 },
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../services/model/merchant.dart';
import '../../styles/appstyles.dart';
import '../../widgets/buttons/filter_btn.dart';
import '../../widgets/containers/status_container.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  List<Business> _businesses = [];
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchBusinesses();
  }

  Future<void> fetchBusinesses() async {
    const url = 'https://winngoouk.wimbgo.com/api/business';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print(responseData); // Debugging: Check the structure of the response

        // Accessing the "merchants" -> "data" to get the list of businesses
        final List<dynamic> businessesList = responseData['merchants']['data'];

        setState(() {
          _businesses =
              businessesList.map((data) => Business.fromJson(data)).toList();
          _isLoading = false;
        });
      } else {
        setState(() {
          _errorMessage = 'Failed to load data: ${response.statusCode}';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'An error occurred: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _errorMessage.isNotEmpty
                ? Center(child: Text(_errorMessage))
                : Column(
                    children: [
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.arrow_back_ios_new, size: 20),
                              const SizedBox(width: 15),
                              Text('Business', style: AppStyles.topheading),
                            ],
                          ),
                          FilterButton(
                            onPressed: () {
                              // Custom action when the filter button is pressed
                              print("Filter button pressed");
                            },
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'We found ',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: '${_businesses.length} ',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: 'Items for you!',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: ListView.builder(
                          itemCount: _businesses.length,
                          itemBuilder: (context, index) {
                            final business = _businesses[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: StatusContainer(
                                companyName: business
                                    .businessName, // Use 'businessName' instead of 'name'
                                location: business.address,
                                status: business.status,
                                imageUrl: business
                                    .imageUrl, // Use 'imageUrl' instead of 'logo'
                                onViewPressed: () {
                                  print(
                                      'View button clicked for ${business.businessName}'); // Use 'businessName' instead of 'name'
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
