import 'package:big_e_commerce_app/data/repository/popular_product_repo.dart';
import 'package:big_e_commerce_app/models/products_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<ProductModel> _popularProductList = [];
  // after the update then we can store it in a public variable
  List<ProductModel> get popularProductList => _popularProductList;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int _quantity = 0;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    // print(response.statusCode);
    // this means that if the code didn't show an error and worked and the data gotten
    if(response.statusCode == 200) {
      // we need to do this so that our data won't be repeated
      _popularProductList = [];
      // this is where the list of data is added
      _popularProductList.addAll(
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

  void setQuantity(bool isIncrement) {
    if(isIncrement == true) {
      _quantity = _quantity+1;
    }else {
      _quantity = _quantity-1;
    }
  }
}