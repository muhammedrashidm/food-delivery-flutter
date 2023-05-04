import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/helper/appConstants.dart';
import 'package:get/get.dart';

class PopularProductRepository extends GetxService {
  final ApiClient apiClient;

  PopularProductRepository({required this.apiClient});

  // Future<Response> getPopularProductList() async {
  //   return apiClient.getData(uri:AppConstants.POPULAR_PRODUCT_ENDPOINT);
  // }
  Future<Response> getPopularProductList() async {
    return Response(
      body: res,
      statusCode: 200
    );
  }
}


var res =  {
  "total_size": 6,
  "type_id": 2,
  "offset": 0,
  "products": [
  {
  "id": 1,
  "name": "Nutritious fruit meal in china",
  "description": "This five red bases, two are dedicated to salami (fennel and regular), and there s a classic capricciosa or beef carpaccio. Blanco options include a mushroom, and a four-cheese extravaganza featuring great lobes of a tangy fior di latte they make in house every day (more on this later). Classic, precise, good.I think it s still better to think of this venue not as a pizzeria, but as Pizza, by Di Stasio.Rinaldo Di Stasio and Mallory Wall s empire, including the original restaurant and bar in St Kilda, Citta and now Carlton, is a designer label for dining.",
  "price": 12,
  "stars": 4,
  "img": "assets/image/food14.jpeg",
  "location": "Canada, British Columbia",
  "created_at": "2021-11-17 07:39:08",
  "updated_at": "2022-01-01 05:57:22",
  "type_id": 2
  },
  {
  "id": 2,
  "name": "Sweet Dessert",
  "description": "The best sweet dessertThe quality and craftsmanship is on full show. The waiters  signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant s three distinct areas are cast in gentle neon so that even your worst wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell s beautiful video artworks at Citta, Di Stasio doesn t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio s hands jutt out of the wall, immortalised in the sign of the bull – equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled Genesis, goes straight for the jugular of unceded sovereignty.The quality and craftsmanship is on full show. The waiters  signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant s three distinct areas are cast in gentle neon so that even your worst wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell s beautiful video artworks at Citta, Di Stasio doesn t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio s hands jutt out of the wall, immortalised in the sign of the bull – equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled Genesis, goes straight for the jugular of unceded sovereignty.The quality and craftsmanship is on full show. The waiters  signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant s three distinct areas are cast in gentle neon so that even your worst wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell s beautiful video artworks at Citta, Di Stasio doesn t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio s hands jutt out of the wall, immortalised in the sign of the bull – equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled Genesis, goes straight for the jugular of unceded sovereignty.",
  "price": 2153,
  "stars": 5,
  "img": "assets/image/food14.jpeg",
  "location": "Icefields, Alberta",
  "created_at": "2021-11-17 07:40:43",
  "updated_at": "2022-01-01 06:24:42",
  "type_id": 2
  },
  {
  "id": 6,
  "name": "Creole Rice Side Dish Recipe",
  "description": "The quality and craftsmanship is on full show. The waiters  signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant s three distinct areas are cast in gentle neon so that even your worst wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell s beautiful video artworks at Citta, Di Stasio doesn t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio s hands jutt out of the wall, immortalised in the sign of the bull – equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled Genesis, goes straight for the jugular of unceded sovereignty.",
  "price": 12,
  "stars": 4,
  "img": "assets/image/food14.jpeg",
  "location": "china",
  "created_at": "2021-12-23 12:33:24",
  "updated_at": "2022-01-01 06:26:03",
  "type_id": 2
  },
  {
  "id": 7,
  "name": "Cuban Fufu",
  "description": "The quality and craftsmanship is on full show. The waiters  signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant s three distinct areas are cast in gentle neon so that even your worst wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell s beautiful video artworks at Citta, Di Stasio doesn t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio s hands jutt out of the wall, immortalised in the sign of the bull – equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled Genesis, goes straight for the jugular of unceded sovereignty.",
  "price": 10,
  "stars": 5,
  "img": "assets/image/food14.jpeg",
  "location": "Cuba",
  "created_at": "2021-12-23 12:34:49",
  "updated_at": "2022-01-01 06:26:45",
  "type_id": 2
  },
  {
  "id": 10,
  "name": "Chicken biriani",
  "description": "Chicken Biryani Served in a Bowl Close Up Photo. Indian Food, Indian Style Rice and Chicken. #Biryani #ChickenBiryani #IndianFood #StockPhoto",
  "price": 12,
  "stars": 4,
  "img": "assets/image/food14.jpeg",
  "location": "china",
  "created_at": "2021-12-27 03:59:47",
  "updated_at": "2022-01-01 06:26:33",
  "type_id": 2
  },
  {
  "id": 11,
  "name": "Hilsha fish",
  "description": "Ilish Mach aka Hilsa fish is in the season and needless to say, I cooked it a few times this year as well. This year, however, I have used Ilish mach to make simple delicacies mostly. Ilish Beguner Jhol is probably the simplest of the lot, well, after Ilish Mach Bhaja.Ilish Mach aka Hilsa fish is in the season and needless to say, I cooked it a few times this year as well. This year, however, I have used Ilish mach to make simple delicacies mostly. Ilish Beguner Jhol is probably the simplest of the lot, well, after Ilish Mach Bhaja.Ilish Mach aka Hilsa fish is in the season and needless to say, I cooked it a few times this year as well. This year, however, I have used Ilish mach to make simple delicacies mostly. Ilish Beguner Jhol is probably the simplest of the lot, well, after Ilish Mach Bhaja.",
  "price": 12,
  "stars": 5,
  "img": "assets/image/food14.jpeg",
  "location": "china",
  "created_at": "2021-12-27 04:05:34",
  "updated_at": "2022-01-01 06:26:22",
  "type_id": 2
  }
  ]
  };