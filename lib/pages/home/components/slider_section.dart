import 'package:big_e_commerce_app/utils/colors.dart';
import 'package:big_e_commerce_app/utils/dimensions.dart';
import 'package:big_e_commerce_app/widgets/big_text.dart';
import 'package:big_e_commerce_app/widgets/icon_and_text.dart';
import 'package:big_e_commerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';

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
  final double _height = pageViewContainer;

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
    return Container(
      // color: Colors.red,
      height: pageView,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
        itemBuilder: (context, index,) {
          return buildPageItem(index);
        },
      ),
    );
  }

  Widget buildPageItem(int index) {
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

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: pageViewContainer,
            margin: EdgeInsets.symmetric(horizontal: width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius30),
                color: index.isEven ? const Color(0xFF69C5DF) : const Color(0xFF9294CC),
                image: const DecorationImage(
                  image: AssetImage("assets/images/food0.png"),
                  fit: BoxFit.cover,
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: pageViewTextContainer,
              margin: EdgeInsets.only(
                left: width30,
                right: width30,
                bottom: height30,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius20),
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
                  top: height15,
                  left: 15,
                  right: 15,
                ),
                child: FoodDetails(
                  text: "Chinese Side",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FoodDetails extends StatelessWidget {
  final String text;
  double? size;
  FoodDetails({
    Key? key, required this.text, this.size = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final smallSize = font20;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: size == 0 ? smallSize : size,
        ),
        SizedBox(height: height10,),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                    (index) => const Icon(
                  Icons.star,
                  color: mainColor,
                  size: 15,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SmallText(text: "4.5"),
            const SizedBox(
              width: 10,
            ),
            SmallText(text: "1287"),
            const SizedBox(
              width: 10,
            ),
            SmallText(text: "comments"),
          ],
        ),
        SizedBox(
          height: height20,
        ),
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
    );
  }
}
