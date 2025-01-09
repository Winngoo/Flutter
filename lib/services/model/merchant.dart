class Business {
  final int id;
  final String businessName;
  final String tradingName;
  final String address;
  final String status;
  final String imageUrl;

  Business({
    required this.id,
    required this.businessName,
    required this.tradingName,
    required this.address,
    required this.status,
    required this.imageUrl,
  });

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
      id: json['id'],
      businessName: json['business_name'],
      tradingName: json['trading_name'],
      address: '${json['address_line_1']}, ${json['city']}, ${json['country']}',
      status: json['status'],
      imageUrl: json['image'],
    );
  }
}


class Merchants {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  Merchants({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  Merchants.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = (json['data'] as List).map((v) => Data.fromJson(v)).toList();
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = (json['links'] as List).map((v) => Links.fromJson(v)).toList();
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class SubCategories {
  String? id;
  String? name;

  SubCategories({this.id, this.name});

  SubCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}

class BusinessHours {
  String? day;
  String? openingTime;
  String? closingTime;

  BusinessHours({this.day, this.openingTime, this.closingTime});

  BusinessHours.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    openingTime = json['opening_time'];
    closingTime = json['closing_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['day'] = day;
    data['opening_time'] = openingTime;
    data['closing_time'] = closingTime;
    return data;
  }
}

class Data {
  int? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? businessName;
  String? tradingName;
  List<String>? categoryId;
  List<String>? subCategoryId;
  String? websiteLink;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? businessTypeId;
  int? reviewCount;
  String? statusMessage;
  List<BusinessHours>? businessHours;
  List<String>? taglines;

  Data({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.businessName,
    this.tradingName,
    this.categoryId,
    this.subCategoryId,
    this.websiteLink,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.businessTypeId,
    this.reviewCount,
    this.statusMessage,
    this.businessHours,
    this.taglines,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    businessName = json['business_name'];
    tradingName = json['trading_name'];
    categoryId = (json['category_id'] as List<dynamic>?)?.cast<String>();
    subCategoryId = (json['sub_category_id'] as List<dynamic>?)?.cast<String>();
    websiteLink = json['website_link'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    businessTypeId = json['business_type_id'];
    reviewCount = json['reviewCount'];
    statusMessage = json['statusMessage'];
    if (json['business_hours'] != null) {
      businessHours = (json['business_hours'] as List)
          .map((v) => BusinessHours.fromJson(v))
          .toList();
    }
    taglines = (json['taglines'] as List<dynamic>?)?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['username'] = username;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['business_name'] = businessName;
    data['trading_name'] = tradingName;
    data['category_id'] = categoryId;
    data['sub_category_id'] = subCategoryId;
    data['website_link'] = websiteLink;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['business_type_id'] = businessTypeId;
    data['reviewCount'] = reviewCount;
    data['statusMessage'] = statusMessage;
    if (businessHours != null) {
      data['business_hours'] = businessHours!.map((v) => v.toJson()).toList();
    }
    data['taglines'] = taglines;
    return data;
  }
}
// Updated Business class
// class Business {
//   final int id;
//   final String businessName;
//   final String tradingName;
//   final String address;
//   final String status;
//   final String imageUrl;
//   final String country;
//   final String phoneNumber;
//   final String businessDescription;
//   final String website;
//   final String email;

//   Business({
//     required this.id,
//     required this.businessName,
//     required this.tradingName,
//     required this.address,
//     required this.status,
//     required this.imageUrl,
//     required this.country,
//     required this.phoneNumber,
//     required this.businessDescription,
//     required this.website,
//     required this.email,
//   });

//   factory Business.fromJson(Map<String, dynamic> json) {
//     return Business(
//       id: json['id'],
//       businessName: json['business_name'],
//       tradingName: json['trading_name'],
//       address: '${json['address_line_1']}, ${json['city']}, ${json['country']}',
//       status: json['status'],
//       imageUrl: json['image'],
//       country: json['country'],
//       phoneNumber: json['phone_number'],
//       businessDescription: json['business_description'],
//       website: json['website_link'] ?? '',
//       email: json['email'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'business_name': businessName,
//       'trading_name': tradingName,
//       'address': address,
//       'status': status,
//       'image': imageUrl,
//       'country': country,
//       'phone_number': phoneNumber,
//       'business_description': businessDescription,
//       'website_link': website,
//       'email': email,
//     };
//   }
// }

// // Updated Data class
// class Data {
//   int? id;
//   String? username;
//   String? firstName;
//   String? lastName;
//   String? email;
//   String? businessName;
//   String? tradingName;
//   List<String>? categoryId;
//   List<String>? subCategoryId;
//   String? websiteLink;
//   String? image;
//   String? createdAt;
//   String? updatedAt;
//   int? businessTypeId;
//   int? reviewCount;
//   String? statusMessage;
//   List<BusinessHours>? businessHours;
//   List<String>? taglines;
//   String? country;
//   String? phoneNumber;
//   String? businessDescription;

//   Data({
//     this.id,
//     this.username,
//     this.firstName,
//     this.lastName,
//     this.email,
//     this.businessName,
//     this.tradingName,
//     this.categoryId,
//     this.subCategoryId,
//     this.websiteLink,
//     this.image,
//     this.createdAt,
//     this.updatedAt,
//     this.businessTypeId,
//     this.reviewCount,
//     this.statusMessage,
//     this.businessHours,
//     this.taglines,
//     this.country,
//     this.phoneNumber,
//     this.businessDescription,
//   });

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     username = json['username'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     email = json['email'];
//     businessName = json['business_name'];
//     tradingName = json['trading_name'];
//     categoryId = (json['category_id'] as List<dynamic>?)?.cast<String>();
//     subCategoryId = (json['sub_category_id'] as List<dynamic>?)?.cast<String>();
//     websiteLink = json['website_link'];
//     image = json['image'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     businessTypeId = json['business_type_id'];
//     reviewCount = json['reviewCount'];
//     statusMessage = json['statusMessage'];
//     if (json['business_hours'] != null) {
//       businessHours = (json['business_hours'] as List)
//           .map((v) => BusinessHours.fromJson(v))
//           .toList();
//     }
//     taglines = (json['taglines'] as List<dynamic>?)?.cast<String>();
//     country = json['country'];
//     phoneNumber = json['phone_number'];
//     businessDescription = json['business_description'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data['id'] = id;
//     data['username'] = username;
//     data['first_name'] = firstName;
//     data['last_name'] = lastName;
//     data['email'] = email;
//     data['business_name'] = businessName;
//     data['trading_name'] = tradingName;
//     data['category_id'] = categoryId;
//     data['sub_category_id'] = subCategoryId;
//     data['website_link'] = websiteLink;
//     data['image'] = image;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['business_type_id'] = businessTypeId;
//     data['reviewCount'] = reviewCount;
//     data['statusMessage'] = statusMessage;
//     if (businessHours != null) {
//       data['business_hours'] = businessHours!.map((v) => v.toJson()).toList();
//     }
//     data['taglines'] = taglines;
//     data['country'] = country;
//     data['phone_number'] = phoneNumber;
//     data['business_description'] = businessDescription;
//     return data;
//   }
// }

// // Updated BusinessHours class
// class BusinessHours {
//   String? day;
//   String? openingTime;
//   String? closingTime;
//   String? openingTimeFrom;
//   String? openingTimeTo;

//   BusinessHours({
//     this.day,
//     this.openingTime,
//     this.closingTime,
//     this.openingTimeFrom,
//     this.openingTimeTo,
//   });

//   BusinessHours.fromJson(Map<String, dynamic> json) {
//     day = json['day_of_week'];
//     openingTime = json['opening_time'];
//     closingTime = json['closing_time'];
//     openingTimeFrom = json['openingTimeFrom'];
//     openingTimeTo = json['openingTimeTo'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data['day_of_week'] = day;
//     data['opening_time'] = openingTime;
//     data['closing_time'] = closingTime;
//     data['openingTimeFrom'] = openingTimeFrom;
//     data['openingTimeTo'] = openingTimeTo;
//     return data;
//   }
// }
