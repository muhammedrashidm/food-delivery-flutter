import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  SmallText(
      {required this.text,
      this.color = const Color(0xFF5c524f),
      this.size = 12,
      this.textOverflow = TextOverflow.ellipsis,
      this.lineHeight = 1.2});
  final String text;
  Color? color;
  double size;
  TextOverflow textOverflow;
  double? lineHeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: size,
        color: color,
        height: lineHeight,
      ),
      overflow: textOverflow,
    );
  }
}
