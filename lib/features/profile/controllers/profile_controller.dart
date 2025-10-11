import 'package:get/get.dart';
import 'package:template/features/profile/models/profile_model.dart';

class ProfileController extends GetxController {
  var profile = Rx<ProfileModel?>(null);
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadProfile();
  }

  void loadProfile() {
    isLoading.value = true;
    // Simulate API call
    Future.delayed(const Duration(milliseconds: 500), () {
      profile.value = _getSampleProfile();
      isLoading.value = false;
    });
  }

  ProfileModel _getSampleProfile() {
    return ProfileModel(
      id: '1',
      name: 'Sarah Walter',
      location: 'Miami, FL',
      avatar: '',
      isSuperAgent: true,
      bio:
          'With over 7 years of experience, I specialize in family homes, downtown apartments, and commercial spaces in Miami. My goal is to combine market expertise with a personal touch to help you every step of the journey.',
      rating: 4.9,
      languages: ['English', 'Spanish'],
      amountOfListing: 120,
      propertiesSold: 82,
      storyUploaded: 401,
    );
  }

  void editProfile() {
    // Navigate to edit profile screen
    Get.toNamed('/edit-profile');
  }

  void openIntegration() {
    // Open integration settings
    Get.toNamed('/integration');
  }
}
