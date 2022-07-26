import 'package:big_e_commerce_app/utils/colors.dart';
import 'package:big_e_commerce_app/utils/dimensions.dart';
import 'package:big_e_commerce_app/widgets/big_text.dart';
import 'package:big_e_commerce_app/widgets/icon_and_text.dart';
import 'package:big_e_commerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';

class RecommendedImageDetails extends StatelessWidget {
  final int? id;
  final String? name;
  final String? description;
  final int? price;
  final int? stars;
  final String? location;
  final String? createdAt;
  final String? updatedAt;
  final int? typeId;
  const RecommendedImageDetails({
    Key? key,
    this.id,
    this.name,
    this.description,
    this.price,
    this.stars,
    this.location,
    this.createdAt,
    this.updatedAt,
    this.typeId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: Dimensions.listViewTextContSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(Dimensions.radius20),
            bottomRight: Radius.circular(Dimensions.radius20),
          ),
          color: Colors.white,
        ),
        child: Padding(
            padding: EdgeInsets.only(right: Dimensions.width10, left: Dimensions.width10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BigText(text: name!),
                SizedBox(height: Dimensions.height10,),
                SmallText(text: "With Chinese characteristics"),
                SizedBox(height: Dimensions.height10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    IconAndText(
                      icon: Icons.circle_sharp,
                      text: "Normal",
                      iconColor: AppColors.iconColor1,
                    ),
                    IconAndText(
                      icon: Icons.location_on,
                      text: "1.7km",
                      iconColor: AppColors.mainColor,
                    ),
                    IconAndText(
                      icon: Icons.access_time_rounded,
                      text: "32mins",
                      iconColor: AppColors.iconColor2,
                    ),
                  ],
                ),
              ],
            )
        ),
      ),
    );
  }
}