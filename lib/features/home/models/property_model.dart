import 'package:template/core/constants/app_string.dart';

class PropertyModel {
  final String id;
  final double price;
  final String title;
  final int stackSimple;
  final int bedrooms;
  final int bathrooms;
  final int area;
  final String address;
  final String imageUrl;
  final String status;
  final String listingDate;
  final bool isBoosted;
  final String description;

  PropertyModel({
    required this.id,
    required this.price,
    required this.title,
    required this.stackSimple,
    required this.bedrooms,
    required this.bathrooms,
    required this.area,
    required this.address,
    required this.imageUrl,
    required this.status,
    required this.listingDate,
    this.isBoosted = false,
    this.description = AppString.dummyDesctiption,
  });

  String get formattedPrice =>
      '€${price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}';
}
