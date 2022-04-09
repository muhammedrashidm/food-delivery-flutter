import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';

class AccountListTile extends StatelessWidget {
  const AccountListTile({Key? key, required this.icon, required this.title}) : super(key: key);
 final Widget icon;
 final Widget title;
  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.symmetric(vertical: Dimensions.responsiveHeight10),
      padding: EdgeInsets.symmetric(horizontal: Dimensions.responsiveWidth10,vertical: Dimensions.responsiveHeight10),
      child: Row(
        children: [icon,SizedBox(width: Dimensions.responsiveWidth10,),title],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            offset: const Offset(0,5),
            color: Colors.grey.withOpacity(0.2)
          )
        ]
      ),
    );
  }
}
