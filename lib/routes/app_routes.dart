import 'package:get/get_navigation/get_navigation.dart';
import 'package:template/features/auth/screens/introducong_ai_assistant.dart';
import 'package:template/features/auth/screens/onboarding_screen.dart';
import 'package:template/features/auth/screens/sign_in_screen.dart';
import 'package:template/features/auth/screens/sign_up_screen.dart';
import 'package:template/features/auth/screens/whatsapp_ai_notification.dart';
import 'package:template/features/home/bindings/home_binding.dart';
import 'package:template/features/home/bindings/home_content_binding.dart';
import 'package:template/features/home/screens/your_listing_screen.dart';
import 'package:template/features/home/screens/home_screens.dart';
import 'package:template/routes/routes_name.dart';

class AppRoutes {
  static List<GetPage> pages = [
    GetPage(
      name: RoutesName.home,
      page: () => HomeScreen(),
      transition: Transition.rightToLeft,
      bindings: [NavigationBinding(), YourListingBinding()],
    ),
    GetPage(
      name: RoutesName.homeContent,
      page: () => YourListingScreen(),
      transition: Transition.rightToLeft,
      binding: YourListingBinding(),
    ),
    GetPage(
      name: RoutesName.signin,
      page: () => SignInScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.onboarding,
      page: () => OnboardingScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.signUp,
      page: () => SignUpScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.aiAssistant,
      page: () => AiAssistant(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.whatsappAiNotification,
      page: () => WhatsappAiNotification(),
      transition: Transition.rightToLeft,
    ),
  ];
}
