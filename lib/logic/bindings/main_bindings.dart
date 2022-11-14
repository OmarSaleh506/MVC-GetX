import 'package:get/instance_manager.dart';
import 'package:mvc_getx/logic/controller/main_controller.dart';


class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
  }
}
