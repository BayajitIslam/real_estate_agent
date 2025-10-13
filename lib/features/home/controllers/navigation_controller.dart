// Navigation Controller
import 'package:get/get.dart';

class NavigationController extends GetxController {
  var currentIndex = 0.obs;

  // New: track if bottom sheet is open
  var isBottomSheetOpen = false.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }

  void setBottomSheetState(bool isOpen) {
    isBottomSheetOpen.value = isOpen;
  }
}
