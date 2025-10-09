import 'package:get/get.dart';
import 'package:template/features/home/models/property_model.dart';

class YourListingController extends GetxController {
  var activeListings = 24.obs;
  var searchQuery = ''.obs;
  var isLoading = false.obs;
  var properties = <PropertyModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadProperties();
  }

  Future<void> refreshProperties() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1)); // simulate API delay
    properties.value = _getSampleProperties(); // reload same or new data
    isLoading.value = false;
  }

  void loadProperties() {
    isLoading.value = true;
    Future.delayed(const Duration(milliseconds: 500), () {
      properties.value = _getSampleProperties();
      isLoading.value = false;
    });
  }

  void searchProperties(String query) {
    searchQuery.value = query;
  }

  void toggleFavorite(String propertyId) {
    // Implement favorite logic
  }

  void boostProperty(String propertyId) {
    // Implement boost logic
  }

  List<PropertyModel> _getSampleProperties() {
    return List.generate(
      5,
      (index) => PropertyModel(
        id: '${index + 1}',
        price: 692000 + (index * 50000),
        title: index % 2 == 0 ? 'Apartment' : 'House',
        stackSimple: 2 + (index % 3),
        bedrooms: 3 + (index % 3),
        bathrooms: 3 + (index % 2),
        area: 822 + (index * 100),
        address: '${3284 + index} Skyview Lane, WA 98001',
        imageUrl:
            'https://images.unsplash.com/photo-1613490493576-7fde63acd811?w=800',
        status: index % 3 == 0
            ? 'Active'
            : index % 3 == 1
            ? 'Pending'
            : 'Sold',
        listingDate: '${11 + index} July 2024',
        isBoosted: true,
      ),
    );
  }
}
