import 'package:big_e_commerce_app/utils/app_constants.dart';
import 'package:get/get.dart';

// this is the apiClient class and we also want to add the getx that allows us to avoid using a stateful widget
// // GetX is a miniframework that mahes development more easy and proficient
class ApiClient extends GetConnect implements GetxService{
  // communicating with the server requires a token which will be initialized in the ApiClient class
  /// late String token;
  late String token;
  // this is the url of our app that will talk to the server
  final String appBaseUrl;
  // Maps associate a key to some value for easy retrieval.
  // the first string is what we are expecting from the api
  // the second one is what we store the value we expected
  late Map<String, String> _mainHeaders;
  // dynamic simply means that the value being store could be any variable
  ApiClient({required this.appBaseUrl}) {
    // the baseUrl and the timeout are properties of the getx service
    // the getx should know the url and
    httpClient.baseUrl = appBaseUrl;
    // print(baseUrl);
    // the time it will take to make the request and if after that time if it should continue
    httpClient.timeout = const Duration(seconds: 30);
    token = AppConstants.token;
    _mainHeaders = {
      // this is for the get and post request
      "Content-type" : "application/json; charset = UTF-8",
      "Authorization": "Bearer $token"
    };
  }

  // this is the method that is used to get the uri data from the apiClient using the getX package
  Future<Response> getData(String uri,) async {
    try{
      Response response = await get(uri);
      return response;
    }catch(e) {
      return Response(statusCode: 1, statusText: e.toString(),);
    }
  }

}