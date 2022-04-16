import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/modals/sign_in_body.dart';
import 'package:food_delivery/pages/auth/sign_in_page.dart';
import 'package:food_delivery/pages/auth/sign_up_page.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/custom_loader.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/auth_controller.dart';
import '../../modals/sign_up_body.dart';
import '../../widgets/app_text_field.dart';
import '../util_pages/show_custom_message.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void _login( AuthController authController) {

    String password = passwordController.text.trim();
    String phone = phoneController.text.trim();

     if (phone.isEmpty) {
      showCustomSnackBar("Type in your Email", title: 'Email');
    } else if (!GetUtils.isPhoneNumber(phone)) {
      showCustomSnackBar("Type in Valid Email", title: 'Email');
    } else if (password.isEmpty) {
      showCustomSnackBar("Type in your password", title: 'password');
    } else if (password.length < 6) {
      showCustomSnackBar("Password cannot be less than 6 characters",
          title: 'Password');
    } else {

      authController.login(phone,password).then((status) {
        if (status.isSuccess) {
          Get.toNamed(RouteHelper.getToInitial());
        } else {
          showCustomSnackBar(status.message,);
        }
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(
        builder: (authController) {
          return authController.isLoading?const CustomLoader():SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Dimensions.responsiveHeight10,
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: Dimensions.responsiveHeight45),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: Dimensions.responsiveHeight45 * 2,
                      backgroundImage:
                      const AssetImage('assets/image/logo part 1.png'),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: Dimensions.responsiveWidth10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello',
                        style: TextStyle(
                            fontSize: Dimensions.font25 * 3, color: Colors.grey),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Sing in to your account',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Dimensions.responsiveHeight15,
                ),
                AppTextField(
                  textInputType: TextInputType.phone,
                  hintText: 'Phone',
                  icon: Icons.phone,
                  textEditingController: phoneController,
                ),
                SizedBox(
                  height: Dimensions.responsiveHeight15,
                ),
                AppTextField(
                  isObscureText: true,
                  textInputType: TextInputType.visiblePassword,
                  hintText: 'Password',
                  icon: Icons.lock,
                  textEditingController: passwordController,
                ),
                SizedBox(
                  height: Dimensions.responsiveHeight15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: Dimensions.responsiveWidth15),
                      child: const Text(
                        'Sing in to your account',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimensions.responsiveHeight20,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () =>_login(authController) ,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.responsiveWidth30,
                          vertical: Dimensions.responsiveHeight20),
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.all(
                              Radius.circular(Dimensions.responsiveHeight45))),
                      child: BigText(
                        text: 'Sign In',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.responsiveHeight15,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Don't Have an account?",
                      style: TextStyle(
                          color: Colors.grey, fontSize: Dimensions.font15 + 3),
                      children: [
                        TextSpan(
                            text: " Create",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.to(() => SignUpPage(),transition: Transition.fadeIn),
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: Dimensions.font15 + 3,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.responsiveHeight25,
                ),
                SizedBox(
                  height: Dimensions.responsiveHeight10,
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.responsiveWidth30),
                    child: Wrap(
                      spacing: Dimensions.responsiveWidth10,
                      children: [
                        CircleAvatar(
                          radius: Dimensions.responsiveHeight25,
                          backgroundImage: const AssetImage('assets/image/g.png'),
                        ),
                        CircleAvatar(
                          radius: Dimensions.responsiveHeight25,
                          backgroundImage: const AssetImage('assets/image/f.png'),
                        ),
                        CircleAvatar(
                          radius: Dimensions.responsiveHeight25,
                          backgroundImage: const AssetImage('assets/image/t.png'),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },

      ),
    );
  }
}
