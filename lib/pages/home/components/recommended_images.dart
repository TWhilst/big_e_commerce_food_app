import 'package:big_e_commerce_app/utils/app_constants.dart';
import 'package:big_e_commerce_app/utils/dimensions.dart';
import 'package:flutter/material.dart';

class RecommendedImages extends StatelessWidget {
  final String image;
  const RecommendedImages({
    Key? key, required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.listViewImgSize,
      height: Dimensions.listViewImgSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius20),
        color: Colors.white38,
        image: DecorationImage(
          image: NetworkImage("${AppConstants.baseUrl}/uploads/${image}"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
