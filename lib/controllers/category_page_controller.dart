import 'package:food_delivery/data/repositories/category_page_repository.dart';
import 'package:food_delivery/data/repositories/recommended_food_repository.dart';
import 'package:food_delivery/modals/products_modal.dart';
import 'package:get/get.dart';

class CategoryPageController extends GetxController {
  final CategoryPageRepository categoryPageRepository;
  CategoryPageController({required this.categoryPageRepository});

  List<dynamic> _foodList = [];

  List<dynamic> get foodList => _foodList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getCategoryFood({required String category}) async {
    Response response =
        await categoryPageRepository.getProductList(endpoint: category);

    if (response.statusCode == 200) {
      _foodList = [];
      _foodList.addAll(ProductsModal.fromJson(response.body).productsList!);
      _isLoaded = true;
      update();
      print('object');
      print(category);
    }
  }
}
