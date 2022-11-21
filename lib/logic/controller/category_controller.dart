import 'package:get/get.dart';
import 'package:mvc_getx/model/product_modle.dart';
import 'package:mvc_getx/services/category_services.dart';

class CategoryController extends GetxController {
  var categoryNameList = <String>[].obs;
  var isCAtegoryLoading = false.obs;
  var isAllCAtegory = false.obs;
  var categoryList = <ProductModels>[].obs;
  List<String> imageCategory = [
    "https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg",
    "https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg",
    "https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg",
  ].obs;

  @override
  void onInit() {
    super.onInit();
    getCategory();
  }

  void getCategory() async {
    var categoryName = await CategoryServices.getCategory();

    try {
      isCAtegoryLoading(true);
      if (categoryName.isNotEmpty) {
        categoryNameList.addAll(categoryName);
      }
    } finally {
      isCAtegoryLoading(false);
    }
  }

  getAllCategory(String nameCategory) async {
    isAllCAtegory(true);
    categoryList.value = await AllCategoryServices.getAllCategory(nameCategory);

    isAllCAtegory(false);
  }

  getCategoryIndex(int index) async {
    var categoryALlName = await getAllCategory(categoryNameList[index]);
    if (categoryALlName != null) {
      categoryList.value = categoryALlName;
    }
  }
}
