import 'package:randomqoutegenerator/presentation/home_screen/home_screen.dart';
import 'package:randomqoutegenerator/presentation/home_screen/binding/home_binding.dart';
import 'package:randomqoutegenerator/presentation/favorite_screen/favorite_screen.dart';
import 'package:randomqoutegenerator/presentation/favorite_screen/binding/favorite_binding.dart';
import 'package:randomqoutegenerator/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:randomqoutegenerator/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String homeScreen = '/home_screen';

  static const String favoriteScreen = '/favorite_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      bindings: [
        HomeBinding(),
      ],
    ),
    GetPage(
      name: favoriteScreen,
      page: () => FavoriteScreen(),
      bindings: [
        FavoriteBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => HomeScreen(),
      bindings: [
        HomeBinding(),
      ],
    )
  ];
}
