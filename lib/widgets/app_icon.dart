import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';

class AppIcon extends StatelessWidget {
   AppIcon({Key? key, required this.iconData,  this.backGroundColor =const Color(0xFFfcf4e4),  this.iconColor = const Color(0xFF756d54), this.size = 40, this.backGroundColorOpacity = .3, this.iconSize =18,}) : super(key: key);
   final IconData iconData;
   final Color backGroundColor;
   final Color iconColor;
   final double size;
   final double iconSize;
   final double backGroundColorOpacity;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
            color: backGroundColor
      ),
      child: Icon(iconData,color: iconColor,size: iconSize,),
    );
  }


}
