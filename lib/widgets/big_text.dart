import 'package:flutter/cupertino.dart';
import 'package:food_delivery/utils/dimensions.dart';

class BigText extends StatelessWidget {
  BigText({
    required this.text,
    this.color = const Color(0xFF332d2b),
     this.size = 30,
    this.textOverflow = TextOverflow.ellipsis,
  });
  final String text;
  Color? color;
  double size;
  TextOverflow textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
        fontSize:  Dimensions().calculateResponsiveHeight(size),
        color: color,
      ),
      overflow: textOverflow,
      maxLines: 1,
    );
  }
}
