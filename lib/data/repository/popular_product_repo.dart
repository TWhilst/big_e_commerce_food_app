import 'package:big_e_commerce_app/data/api/api_client.dart';
import 'package:big_e_commerce_app/utils/app_constants.dart';
import 'package:get/get.dart';

// when you load data from the internet, the class should extend getx service
// the api is using getx package so the repo should extend getX service
class PopularProductRepo extends GetxService{
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  // because we are using the getX package, the getX return to us a response as a data
  // that is the reason it is used as the variable with future
  // repository is responsible for calling a method from the apiClient
  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstants.popularProductUri);
  }
}