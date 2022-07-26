import 'package:big_e_commerce_app/pages/food/popular_food_details.dart';
import 'package:big_e_commerce_app/pages/food/recommended_food_details.dart';
import 'package:big_e_commerce_app/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper{
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";

  static String getInitial ()=> "$initial";
  static String getPopularFood (int pageId)=> "$popularFood?pageId=$pageId";
  static String getRecommendedFood (int pageId2)=> "$recommendedFood?pageId2=$pageId2";

  static List<GetPage> routes = [
    GetPage(name: initial, page: ()=> MainFoodPage(),),
    GetPage(name: popularFood, page: (){
      var pageId = Get.parameters["pageId"];
      return PopularFoodDetails(pageId: int.parse(pageId!));
    }, transition: Transition.fadeIn,),

    GetPage(name: recommendedFood, page: (){
      var pageId2 = Get.parameters["pageId2"];
      return RecommendedFoodDetails(pageId2: int.parse(pageId2!));
    }, transition: Transition.fadeIn,),
  ];
}