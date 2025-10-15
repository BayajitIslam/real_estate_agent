import 'package:get/get.dart';

class CalendarController extends GetxController {
  // Page Navigation - 2 buttons toggle
  var selectedButton = 0.obs; // 0 = Calendar Button, 1 = Grid Button
  
  // Appointments
  var totalAppointments = 14.obs;
  var appointments = <AppointmentModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadAppointments();
  }

  // Switch between pages
  void switchPage(int index) {
    selectedButton.value = index;
  }

  void loadAppointments() {
    // Mock data
    appointments.value = List.generate(
      14,
      (index) => AppointmentModel(
        id: '${index + 1}',
        title: 'Appointment ${index + 1}',
      ),
    );
  }
}

// Simple Model
class AppointmentModel {
  final String id;
  final String title;

  AppointmentModel({
    required this.id,
    required this.title,
  });
}
