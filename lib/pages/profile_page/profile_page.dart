import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/location_controller.dart';
import 'package:food_delivery/controllers/user_controller.dart';
import 'package:food_delivery/modals/response_modal.dart';
import 'package:food_delivery/pages/address/address_list_page.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/account_page_list_tile.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/custom_loader.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIN();
    if (_userLoggedIn) {
      Get.find<UserController>().getUserInfo();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(
          text: 'Profile',
          size: 24,
          color: Colors.white,
        ),
      ),
      body: GetBuilder<UserController>(
        builder: (controller) {
          return _userLoggedIn
              ? (controller.isLoading
                  ? CustomLoader()
                  : Container(
                      margin:
                          EdgeInsets.only(top: Dimensions.responsiveHeight20),
                      width: double.maxFinite,
                      child: Column(
                        children: [
                          AppIcon(
                            iconData: Icons.person,
                            size: Dimensions.responsiveHeight15 * 10,
                            iconSize: Dimensions.responsiveHeight30 +
                                Dimensions.responsiveHeight45,
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
                                      text: controller.userModel.name,
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
                                      text: controller.userModel.phone,
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
                                      text: controller.userModel.email,
                                    ),
                                  ),
                                  SizedBox(
                                    height: Dimensions.responsiveHeight5,
                                  ),
                                  GetBuilder<LocationController>(
                                      builder: (locationController) {
                                    final list = locationController.addressList;
                                    return GestureDetector(
                                      onTap: () {
                                        if (_userLoggedIn) {
                                          Get.toNamed(
                                              RouteHelper.getAddAddressPage());
                                        }
                                      },
                                      child: AccountListTile(
                                        icon: AppIcon(
                                          iconData: list.isNotEmpty
                                              ? Icons.location_on
                                              : Icons.add_location_alt_rounded,
                                          iconSize:
                                              Dimensions.responsiveHeight30,
                                          size:
                                              Dimensions.responsiveHeight30 * 2,
                                          backGroundColor:
                                              AppColors.yellowColor,
                                          iconColor: Colors.white,
                                        ),
                                        title: BigText(
                                          text: list.isNotEmpty
                                              ? 'Your Addresses'
                                              : 'Add Address',
                                        ),
                                      ),
                                    );
                                  }),
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
                                  GestureDetector(
                                    onTap: () {
                                      _logOut();
                                      Get.find<LocationController>()
                                          .clearAdress();
                                    },
                                    child: AccountListTile(
                                      icon: AppIcon(
                                        iconData: Icons.exit_to_app,
                                        iconSize: Dimensions.responsiveHeight30,
                                        size: Dimensions.responsiveHeight30 * 2,
                                        backGroundColor: Colors.redAccent,
                                        iconColor: Colors.white,
                                      ),
                                      title: BigText(
                                        text: 'Log Out',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ))
              : Center(
                  child: GestureDetector(
                  onTap: () => Get.toNamed(RouteHelper.signIn),
                  child: Container(
                    padding: EdgeInsets.all(Dimensions.responsiveHeight20),
                    decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.all(
                            Radius.circular(Dimensions.responsiveHeight20))),
                    child: BigText(
                      text: 'Login Now',
                      color: Colors.white,
                    ),
                  ),
                ));
        },
      ),
    );
  }

  _logOut() {
    if (Get.find<AuthController>().userLoggedIN()) {
      Get.find<AuthController>().clearSharedPref();
      Get.find<CartController>().clear();
      Get.find<CartController>().clearCartHistory();
      Get.toNamed(RouteHelper.getToSignIn());
    }
  }
}
