import 'package:get/get.dart';
import 'package:mvc_getx/view/screens/category_screen.dart';
import 'package:mvc_getx/view/screens/favorties_scrren.dart';
import 'package:mvc_getx/view/screens/home_screen.dart';
import 'package:mvc_getx/view/screens/settings_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;
  final tabs = [
    HomeScreen(),
    CategoryScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ].obs;
  final title = [
    "Asroo shop",
    'Categories',
    'Favorites',
    'Settings',
  ].obs;
}
