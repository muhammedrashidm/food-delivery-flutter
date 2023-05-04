class AppConstants {
  static const String APP_NAME = "DBFood";
  static const int APP_VERSION = 1;
  static const String API_BASE_PRODUCT_URL = "/api/v1/products/";
  static const String API_BASE_URL = "https://www.dbestech.com";
  static const String POPULAR_PRODUCT_ENDPOINT = "/api/v1/products/popular";
  static const String RECOMMENDED_PRODUCT_ENDPOINT =
      "/api/v1/products/recommended";

  //auth endpoints
  static const String REGISTRATION_UIR = "/api/v1/auth/register";
  static const String LOGIN_UIR = "/api/v1/auth/login";
  static const String USER_ENDPOINT = '/api/v1/customer/info';
  static const String ADD_USER_ADDRESS = '/api/v1/customer/address/add';
  static const String ADDRESS_LIST = '/api/v1/customer/address/list';

  static const String PHONE = "phone_number";

  static const String PASSWORD = "password";

  static const String TOKEN = "";
  static const String CART_LIST_KEY = "cart_list";
  static const String CART_HISTORY_KEY = "cart_history";

  static const String GEOCODE_URI = '/api/v1/config/geocode-api';
  static const String USER_ADDRESS = 'user_address';
}
