import 'package:template/core/constants/app_string.dart';

class PropertyModel {
  final String id;
  final double price;
  final String title;
  final int livingSpace;
  final int bedrooms;
  final int bathrooms;
  final int area;
  final String city;
  final String address;
  final String zipCode;
  final String state;
  final String country;
  final List<String> imageUrl;
  final List<String> facilities;
  final String status;
  final String listingDate;
  final bool isBoosted;
  final String description;

  PropertyModel({
    required this.id,
    required this.price,
    required this.title,
    required this.livingSpace,
    required this.bedrooms,
    required this.bathrooms,
    required this.area,
    required this.city,
    required this.zipCode,
    required this.state,
    required this.country,
    required this.address,
    required this.imageUrl,
    required this.facilities,
    required this.status,
    required this.listingDate,
    
    this.isBoosted = false,
    this.description = AppString.dummyDesctiption,
  });

  String get formattedPrice =>
      '€${price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}';
}
