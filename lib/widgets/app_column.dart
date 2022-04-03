import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/small_text.dart';

import '../utils/colors.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {

  final String text;
   AppColumn({Key? key, required this.text, this.noOfStarts = 0}) : super(key: key);
   final int noOfStarts;
Dimensions dimension = Dimensions();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BigText(
            text: text, color: AppColors.paraColor, size: Dimensions.font30),
        SizedBox(height: Dimensions.responsiveHeight10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           noOfStarts!=0? Wrap(
              children: List.generate(
                  noOfStarts.toInt(),
                      (index) => Icon(
                    Icons.star,
                    color: AppColors.mainColor,
                    size: 15,
                  )),
            ) : Wrap(),
            SizedBox(width: Dimensions.responsiveHeight10),
            SmallText(
              text: '4.5',
              color: Colors.grey,
              size: 15,
            ),
            SizedBox(width: Dimensions.responsiveHeight10),
            SmallText(
              text: 'Comments',
              color: Colors.grey,
              size: 15,
            ),
          ],
        ),
        SizedBox(width: Dimensions.responsiveHeight10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
                text: "Normal",
                icon: Icons.circle_sharp,
                iconColor: AppColors.iconColor1),
            IconAndTextWidget(
                text: "1.7km",
                icon: Icons.location_on,
                iconColor: AppColors.mainColor),
            IconAndTextWidget(
                text: "32 min",
                icon: Icons.timer,
                iconColor: AppColors.iconColor2),
          ],
        )
      ],
    );
  }
}
