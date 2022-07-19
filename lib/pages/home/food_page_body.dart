import 'package:big_e_commerce_app/utils/colors.dart';
import 'package:big_e_commerce_app/utils/dimensions.dart';
import 'package:big_e_commerce_app/widgets/big_text.dart';
import 'package:big_e_commerce_app/widgets/icon_and_text.dart';
import 'package:big_e_commerce_app/widgets/small_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'components/slider_section.dart';


class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  // viewportFraction makes the next slide and and the previous slide visible
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentValue = 0.0;
  double scaleFactor = 0.8;

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
    return Expanded( 
      child: SingleChildScrollView( 
        child: Column(
          children: [
            const SliderSection(),
            DotsIndicator(
              dotsCount: 5,
              position: _currentValue,
              decorator: DotsDecorator(
                activeColor: mainColor,
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
            SizedBox(
              height: height30,
            ),
            Container(
              margin: EdgeInsets.only(left: width30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  BigText(text: "Popular"),
                  SizedBox(width: width10,),
                  Container(
                    margin: const EdgeInsets.only(bottom: 3),
                    child: BigText(text: ".", color: Colors.black26,),
                  ),
                  SizedBox(width: width10,),
                  Container(
                    margin: const EdgeInsets.only(bottom: 2),
                    child: SmallText(text: "Food Pairing"),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: width20, right: width20, bottom: height10),
                    child: Row(
                      children: [
                        Container(
                          width: listViewImgSize,
                          height: listViewImgSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(radius20),
                            color: Colors.white38,
                            image: const DecorationImage(
                              image: AssetImage("assets/images/food0.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: listViewTextContSize,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(radius20),
                                bottomRight: Radius.circular(radius20),
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(right: width10, left: width10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BigText(text: "Nutricious fruit meal in China"),
                                  SizedBox(height: height10,),
                                  SmallText(text: "With Chinese characteristics"),
                                  SizedBox(height: height10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: const [
                                      IconAndText(
                                        icon: Icons.circle_sharp,
                                        text: "Normal",
                                        iconColor: iconColor1,
                                      ),
                                      IconAndText(
                                        icon: Icons.location_on,
                                        text: "1.7km",
                                        iconColor: mainColor,
                                      ),
                                      IconAndText(
                                        icon: Icons.access_time_rounded,
                                        text: "32mins",
                                        iconColor: iconColor2,
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}
