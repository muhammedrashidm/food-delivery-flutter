import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/small_text.dart';

import '../utils/kconstants.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final double textHeight;
  final Function? onExpand;
  ExpandableText({
    Key? key,
    required this.text,
    required this.textHeight,
    this.onExpand,
  }) : super(key: key);

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > widget.textHeight.toInt()) {
      firstHalf = widget.text.substring(0, widget.textHeight.toInt());
      secondHalf = widget.text
          .substring(widget.textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? Text(
              firstHalf,
              style: kParagraphStyle,
            )
          : Column(
              children: [
                hiddenText
                    ? Text(
                        firstHalf + '...',
                        style: kParagraphStyle,
                      )
                    : Text(
                        firstHalf + secondHalf,
                        style: kParagraphStyle,
                      ),
                InkWell(
                  onTap: () {
                    widget.onExpand?.call();
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      hiddenText
                          ? SmallText(
                              text: 'Show More',
                              color: AppColors.mainColor,
                            )
                          : SmallText(
                              text: 'Show Less',
                              color: AppColors.mainColor,
                            ),
                      hiddenText
                          ? Icon(
                              Icons.arrow_drop_down,
                              color: AppColors.mainColor,
                            )
                          : Icon(
                              Icons.arrow_drop_up,
                              color: AppColors.mainColor,
                            )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
