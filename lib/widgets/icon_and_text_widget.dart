import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  const IconAndTextWidget(
      {Key? key,
      required this.text,
      required this.icon,
      required this.iconColor})
      : super(key: key);
  final String text;
  final IconData icon;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor,size: Dimensions.iconSize24,),
        const SizedBox(width: 5),
        SmallText(text: text)
      ],
    );
  }
}
