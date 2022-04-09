import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  String textbody =
      "orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemCount: 10, itemBuilder: _itemBuilder),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white70),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ExpandablePanel(
        header: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            children: [
              AppIcon(iconData: Icons.person),
              const SizedBox(width: 10),
              BigText(
                text: 'Lorem ipsum dolor sit amet',
                size: Dimensions.font20,
              ),
            ],
          ),
        ),
        collapsed: Column(
          children: [
            Container(
              height: Dimensions.responsiveHeight125 * 3,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/image/food0.png'),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                textbody,
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        expanded: Column(
          children: [
            Container(
              height: Dimensions.responsiveHeight125 * 3,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/image/food0.png'),
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(textbody))
          ],
        ),
      ),
    );
  }
}





// Container(
//       margin: EdgeInsets.only(top: 10),
//       height: expanded
//           ? Dimensions.screenHeight * .8
//           : Dimensions.textBoxHeight105 * 6,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               BigText(text: 'text'),
//             ],
//           ),
//           Container(
//             height: Dimensions.screenHeight * .4,
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage('assets/image/food0.png'),
//                   fit: BoxFit.cover),
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 10),
//             height: Dimensions.textBoxHeight105,
//             child: SingleChildScrollView(
//                 child: ExpandableText(
//               onExpand: () {
//                 setState(() {
//                   expanded = !expanded;
//                 });
//               },
//               text: textbody,
//               textHeight: Dimensions.screenHeight * .4,
//             )),
//           ),
//           Container(
//             child: Row(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 AppIcon(iconData: Icons.favorite_border),
//                 AppIcon(iconData: Icons.comment),
//                 AppIcon(iconData: Icons.share),
//               ],
//             ),
//           )
//         ],
//       ),
//     );