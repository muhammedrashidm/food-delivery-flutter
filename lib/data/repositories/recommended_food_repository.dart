import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/helper/appConstants.dart';
import 'package:get/get.dart';

class RecommendedFoodRepository extends GetxService{
  
  final ApiClient apiClient;

  RecommendedFoodRepository({required this.apiClient});
  
  // Future<Response>getRecomendedFoodResponse()async{
  //   return await apiClient.getData(uri:AppConstants.RECOMMENDED_PRODUCT_ENDPOINT);
  // }

  Future<Response>getRecomendedFoodResponse()async{
    return Response(
      body: res1,
      statusCode: 200
    );
  }
  
}


var res1 = {
  "total_size": 5,
  "type_id": 3,
  "offset": 0,
  "products": [
    {
      "id": 3,
      "name": "Chinese Side",
      "description": "Enjoy these flavors any time of day.",
      "price": 3456,
      "stars": 3,
      "img": "assets/image/food14.jpeg",
      "location": "Moraine Lake, Alberta",
      "created_at": "2021-11-17 07:46:31",
      "updated_at": "2022-01-01 06:24:54",
      "type_id": 3
    },
    {
      "id": 4,
      "name": "Bitter Orange Marinade",
      "description": "Bitter oranges are often used in Caribbean ",
      "price": 33,
      "stars": 4,
      "img": "assets/images/food14.jpeg",
      "location": "Killarney Provincial Park",
      "created_at": "2021-11-17 07:48:46",
      "updated_at": "2022-01-01 06:25:05",
      "type_id": 3
    },
    {
      "id": 5,
      "name": "Creamed Yuca (Cassava)",
      "description": "Commonly used in soups, eaten boiled ",
      "price": 10,
      "stars": 5,
      "img": "assets/image/food14.jpeg",
      "location": "China",
      "created_at": "2021-12-08 09:59:53",
      "updated_at": "2022-01-01 06:25:44",
      "type_id": 3
    },
    {
      "id": 8,
      "name": "Dessert",
      "description": "Amazing food to eat with.",
      "price": 5,
      "stars": 4,
      "img": "assets/image/food14.jpeg",
      "location": "china",
      "created_at": "2021-12-25 23:06:29",
      "updated_at": "2022-01-01 06:27:01",
      "type_id": 3
    },
    {
      "id": 9,
      "name": "Biriani",
      "description": "Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par boiled lightly spiced rice.The crowning glory is to finish it off with a drizzle of saffron infused water to give it the signature patches of bright yellow rice, as well as ghee (or melted butter) for buttery richness.The pot is then covered and cooked over a low heat for about 25 minutes during which time the rice absorbs the aromas and flavours of the curry underneath, whilst still being beautifully fluffy.",
      "price": 8,
      "stars": 4,
      "img": "assets/image/food14.jpeg",
      "location": "BD",
      "created_at": "2021-12-27 03:57:38",
      "updated_at": "2022-01-01 06:27:16",
      "type_id": 3
    }
  ]
};