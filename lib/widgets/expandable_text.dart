import 'package:big_e_commerce_app/utils/colors.dart';
import 'package:big_e_commerce_app/utils/dimensions.dart';
import 'package:big_e_commerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight/5.63;

  void textDetails() {
    // the condition says that if the text imputed is greater than the textHeight do this
    if(widget.text.length > textHeight) {
      //firstHalf = the text which will start from length 0 and end at the textHeight converted to int
      // subString is used to get a specified amount of characters from a given text
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  void initState() {
    super.initState();
    textDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf == ""?
      SmallText(
        text: firstHalf,
        size: Dimensions.font16,
        color: AppColors.paraColor,
      ) : Column(
        children: [
          SmallText(
            text: hiddenText? ("$firstHalf...") : (firstHalf+secondHalf),
            size: Dimensions.font16,
            color: AppColors.paraColor,
            height: 1.8,
          ),

          InkWell(
            onTap: () {
              setState(() {
                // what this does is that if hidden text is true it will be false and back if the button is clicked
                hiddenText = !hiddenText;
              });
            },
            child: Row(
              children: [
                SmallText(text: hiddenText? "Show more" : "Show less", color: AppColors.mainColor,),
                Icon(hiddenText? Icons.arrow_drop_down : Icons.arrow_drop_up, color: AppColors.mainColor,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
