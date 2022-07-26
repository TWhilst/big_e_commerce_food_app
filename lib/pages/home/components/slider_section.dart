import 'package:big_e_commerce_app/controllers/popular_product_controller.dart';
import 'package:big_e_commerce_app/models/products_model.dart';
import 'package:big_e_commerce_app/routes/route_helper.dart';
import 'package:big_e_commerce_app/utils/app_constants.dart';
import 'package:big_e_commerce_app/utils/colors.dart';
import 'package:big_e_commerce_app/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'food_details.dart';

class SliderSection extends StatefulWidget {
  const SliderSection({Key? key}) : super(key: key);

  @override
  State<SliderSection> createState() => _SliderSection();
}

class _SliderSection extends State<SliderSection> {
  // viewportFraction makes the next slide and and the previous slide visible
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //<PopularProductController> helps us to select what we want from the builder
    return GetBuilder<PopularProductController>(
      builder: (pController) {
        return pController.isLoading? SizedBox(
          // color: Colors.red,
          height: Dimensions.pageView,
          child: PageView.builder(
            controller: pageController,
            // context.popularProductList.length.... the context has the details of the PopularProductController
            // popularProductList.length has the details and we want the length of that details
            itemCount: pController.popularProductList.length,
            itemBuilder: (context, index,) {
              return buildPageItem(index, pController.popularProductList[index]);
            },
          ),
        ) : const Center(child: CircularProgressIndicator(color: AppColors.mainColor,));
      }
    );
  }




  Widget buildPageItem(int index, ProductModel products,) {
    return Transform(
      transform: details(index),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getPopularFood(index));
            },
            child: Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.symmetric(horizontal: Dimensions.width10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: index.isEven ? const Color(0xFF69C5DF) : const Color(0xFF9294CC),
                  image: DecorationImage(
                    // using $ in strings is what we call interpolation
                    image: NetworkImage("${AppConstants.baseUrl}/uploads/${products.img!}"),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                left: Dimensions.width30,
                right: Dimensions.width30,
                bottom: Dimensions.height30,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: const[
                    BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 5,
                      color: Color(0xFFE8E8E8),
                    ),
                    BoxShadow(
                      offset: Offset(-5, 0),
                      color: Colors.white,
                    ),
                    BoxShadow(
                      offset: Offset(5, 0),
                      color: Colors.white,
                    ),
                  ]
              ),
              child: Container(
                padding: EdgeInsets.only(
                  top: Dimensions.height15,
                  left: 15,
                  right: 15,
                ),
                child: FoodDetails(
                  text: products.name!,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Matrix4 details(int index) {
    Matrix4 matrix = Matrix4.identity();
    // _currentPageValue.floor() is the value of the page when the page is at its index form (0, 1, 2, 3, 4)
    // _currentPageValue.floor() is the page on the screen
    // the if statement is saying that is the index is = to the currentpage then the
    if(index == _currentValue.floor()) {
      // currentScale is equal to 1 - 0 because ((_currentValue-index)* (1-scaleFactor)) will give us 0 due to bodmas
      var currentScale = 1- (_currentValue - index)* (1- _scaleFactor);
      var currentTrans = _height * (1 - currentScale)/2;
      // diagional3Values is used to set the width(x), height(y) and (z)
      // ..setTranslationRaw is used to set the margin or change position
      matrix = Matrix4.diagonal3Values(1, currentScale, 1 )..setTranslationRaw(0, currentTrans, 0);
      // the next thing we are trying to do is to bring down the one by the right of the current page to the center
    } else if(index == _currentValue.floor() + 1) {
      // the aim of this is to give the page after the current page a value of scaleFactor
      var currentScale = _scaleFactor - (_currentValue - index + 1) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale)/2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTrans, 0);
    } else if(index == _currentValue.floor() - 1) {
      // the aim of this is to give the page after the current page a value of scaleFactor
      var currentScale = 1 - (_currentValue - index)* (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale)/2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTrans, 0);
    } else {
      var currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, _height*(1 - _scaleFactor)/2, 1);
    }
    return matrix;
  }
}







