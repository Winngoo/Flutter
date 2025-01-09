// class LatestListing {
//   final String? tradingName;
//   final String? imageUrl;
//   final String? city;
//   final String? country;

//   LatestListing({
//     this.tradingName,
//     this.imageUrl,
//     this.city,
//     this.country,
//   });

//   // Factory constructor to create a `LatestListing` instance from JSON
//   factory LatestListing.fromJson(Map<String, dynamic> json) {
//     return LatestListing(
//       tradingName: json['trading_name'] as String?,
//       imageUrl: json['image'] as String?,
//       city: json['city'] as String?,
//       country: json['country'] as String?,
//     );
//   }

//   // Method to convert a `LatestListing` instance to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'trading_name': tradingName,
//       'image': imageUrl,
//       'city': city,
//       'country': country,
//     };
//   }
// }
class LatestListing {
  final int id;
  final String tradingName;
  final String imageUrl;
  final String country;
  final String city;

  LatestListing({
    required this.id,
    required this.tradingName,
    required this.imageUrl,
    required this.country,
    required this.city,
  });

  factory LatestListing.fromJson(Map<String, dynamic> json) {
    return LatestListing(
      id: json['id'],
      tradingName: json['trading_name'] ?? 'Unknown',
      imageUrl: json['image'] ?? 'https://via.placeholder.com/150',
      country: json['country'] ?? 'Unknown',
      city: json['city'] ?? 'Unknown',
    );
  }
}
