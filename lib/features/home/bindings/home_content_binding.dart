import 'package:get/get.dart';
import 'package:template/features/home/controllers/your_listing_controller.dart';

class YourListingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => YourListingController(), fenix: true);
  }
}
