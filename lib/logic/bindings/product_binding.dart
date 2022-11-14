import 'package:get/instance_manager.dart';
import 'package:mvc_getx/logic/controller/product_controller.dart';


class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
  }
}
