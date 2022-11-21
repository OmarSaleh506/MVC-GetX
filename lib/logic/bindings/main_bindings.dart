import 'package:get/instance_manager.dart';
import 'package:mvc_getx/logic/controller/main_controller.dart';
import 'package:mvc_getx/logic/controller/settings_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingController());
  }
}
