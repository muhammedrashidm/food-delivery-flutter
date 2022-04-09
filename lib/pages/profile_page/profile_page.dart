import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/account_page_list_tile.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(
          text: 'Profile',
          size: 24,
          color: Colors.white,
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: Dimensions.responsiveHeight20),
        width: double.maxFinite,
        child: Column(
          children: [
            AppIcon(
              iconData: Icons.person,
              size: Dimensions.responsiveHeight15 * 10,
              iconSize:
                  Dimensions.responsiveHeight30 + Dimensions.responsiveHeight45,
              backGroundColor: AppColors.mainColor,
              iconColor: Colors.white,
            ),
            SizedBox(
              height: Dimensions.responsiveHeight10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AccountListTile(
                      icon: AppIcon(
                        iconData: Icons.person,
                        iconSize: Dimensions.responsiveHeight30,
                        size: Dimensions.responsiveHeight30 * 2,
                        backGroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                      ),
                      title: BigText(
                        text: 'Ahamed',
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.responsiveHeight5,
                    ),
                    AccountListTile(
                      icon: AppIcon(
                        iconData: Icons.phone,
                        iconSize: Dimensions.responsiveHeight30,
                        size: Dimensions.responsiveHeight30 * 2,
                        backGroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                      ),
                      title: BigText(
                        text: '16659265',
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.responsiveHeight5,
                    ),
                    AccountListTile(
                      icon: AppIcon(
                        iconData: Icons.email,
                        iconSize: Dimensions.responsiveHeight30,
                        size: Dimensions.responsiveHeight30 * 2,
                        backGroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                      ),
                      title: BigText(
                        text: 'dfg@fgf.sd',
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.responsiveHeight5,
                    ),
                    AccountListTile(
                      icon: AppIcon(
                        iconData: Icons.location_on,
                        iconSize: Dimensions.responsiveHeight30,
                        size: Dimensions.responsiveHeight30 * 2,
                        backGroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                      ),
                      title: BigText(
                        text: 'Adresss',
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.responsiveHeight5,
                    ),
                    AccountListTile(
                      icon: AppIcon(
                        iconData: Icons.message,
                        iconSize: Dimensions.responsiveHeight30,
                        size: Dimensions.responsiveHeight30 * 2,
                        backGroundColor: Colors.redAccent,
                        iconColor: Colors.white,
                      ),
                      title: BigText(
                        text: 'Ahamed',
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.responsiveHeight5,
                    ),
                    
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
