import 'package:food_delivery/data/repositories/category_repository.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CategoryController extends GetxController {
  final Categoryrepository categoryRepository;

  CategoryController({required this.categoryRepository});

  List<String> getCatogeries() => categoryRepository.getCategoryList();
}
