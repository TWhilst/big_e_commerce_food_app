import 'package:big_e_commerce_app/controllers/popular_product_controller.dart';
import 'package:big_e_commerce_app/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:big_e_commerce_app/helper/dependencies.dart' as dependencies;
import 'package:big_e_commerce_app/controllers/recommended_product_controller.dart';

Future<void> main() async {
  // this will make sure that our dependencies are loaded correctly and alsoi wait until they are loaded
  WidgetsFlutterBinding.ensureInitialized();
  // this is so that we can load the dependencies in our code
  await dependencies.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // this helps us to get the list from the controller to the app pages
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    // this get helps us to use the getX package
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // home: const RecommendedFoodDetails(),
      // initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes
    );
  }
}

