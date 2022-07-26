import 'package:big_e_commerce_app/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'components/RecommendedDotFoodPairing.dart';
import 'components/food_dots_indicator.dart';
import 'components/recommended_list_builder.dart';
import 'components/slider_section.dart';


class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  final _currentValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Expanded( 
      child: SingleChildScrollView( 
        child: Column(
          children: [
            const SliderSection(),
            FoodDotsIndicator(currentValue: _currentValue,),
            SizedBox(height: Dimensions.height30,),
            const RecommendedDotFoodPairing(),
            const RecommendedListBuilder(),
          ],
        ),
      ),
    );
  }
}






