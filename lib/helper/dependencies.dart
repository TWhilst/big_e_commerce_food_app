import 'package:big_e_commerce_app/controllers/popular_product_controller.dart';
import 'package:big_e_commerce_app/controllers/recommended_product_controller.dart';
import 'package:big_e_commerce_app/data/api/api_client.dart';
import 'package:big_e_commerce_app/data/repository/popular_product_repo.dart';
import 'package:big_e_commerce_app/data/repository/recommended_product_repo.dart';
import 'package:big_e_commerce_app/utils/app_constants.dart';
import 'package:get/get.dart';

// this is where we load the dependencies gotten from the apiclient, repo and controller
Future<void> init () async {
  // the json map was not loading because i was using https instead of http
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl));

  // the apiClient is of the type ApiClient and Get.find() helps us to get the details from the class ApiClient
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));


  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
}