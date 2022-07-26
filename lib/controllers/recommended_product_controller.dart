import 'package:big_e_commerce_app/data/repository/recommended_product_repo.dart';
import 'package:big_e_commerce_app/models/products_model.dart';
import 'package:get/get.dart';

class RecommendedProductController extends GetxController{
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});

  List<ProductModel> _recommendedProductList = [];
  // after the update then we can store it in a public variable
  List<ProductModel> get recommendedProductList => _recommendedProductList;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getRecommendedProductList() async {
    Response response = await recommendedProductRepo.getRecommendedProductList();
    // print(response.statusCode);
    // this means that if the code didn't show an error and worked and the data gotten
    if(response.statusCode == 200) {
      // we need to do this so that our data won't be repeated
      _recommendedProductList = [];
      // this is where the list of data is added
      _recommendedProductList.addAll(
        // what this does is that it adds Product.fromJson(response.body).products
        // the response.body is the map stored in the link and products is referring to the list in the map
          Product.fromJson(response.body).products
      );
      _isLoading = true;
      // this just tells us that our data has been updated
      // its also works like setState
      update();
      // if this updates and it is successful then we can access _popularProductList anbywhere in our code
    } else {
    }
  }
}