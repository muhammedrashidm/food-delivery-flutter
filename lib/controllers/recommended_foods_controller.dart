import 'package:food_delivery/data/repositories/recommended_food_repository.dart';
import 'package:food_delivery/modals/products_modal.dart';
import 'package:get/get.dart';

class RecommendedFoodController extends GetxController{

  final RecommendedFoodRepository recommendedFoodRepository;
  RecommendedFoodController({required this.recommendedFoodRepository});

  List<dynamic> _recommendedFood =[];

  List<dynamic> get recommendedFoodList=>_recommendedFood;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedFood()async{

    Response response = await  recommendedFoodRepository.getRecomendedFoodResponse();

    if(response.statusCode ==200){

      _recommendedFood = [];
      _recommendedFood.addAll(ProductsModal.fromJson(response.body).productsList!);
  _isLoaded=true;
      update();
    }
  }
}