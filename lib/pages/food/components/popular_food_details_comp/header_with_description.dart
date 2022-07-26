import 'package:big_e_commerce_app/controllers/popular_product_controller.dart';
import 'package:big_e_commerce_app/utils/dimensions.dart';
import 'package:big_e_commerce_app/widgets/big_text.dart';
import 'package:big_e_commerce_app/widgets/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderWithDescription extends StatelessWidget {
  final int pageId;
  const HeaderWithDescription({
    Key? key, required this.pageId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = Get.find<PopularProductController>().popularProductList[pageId];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [

      ],
    );
  }
}