import 'package:food_delivery/helper/appConstants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PostsApiClient extends GetConnect implements GetxService {
  String key = "25916027-470fe38377152e5d3cbfc7823";
  final String appBaseUrl;

  late Map<String, String> _mainHeaders;

  PostsApiClient({required this.appBaseUrl});

  Future<dynamic> getData(String uri) async {
    try {
      var response = await http.get(Uri.parse(appBaseUrl + uri + "?key=$key"));
      print('POSTS ARE' + response.statusCode.toString());
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
