import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/modals/sign_up_body.dart';
import 'package:food_delivery/pages/auth/sign_in_page.dart';
import 'package:food_delivery/pages/util_pages/show_custom_message.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/custom_loader.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../widgets/app_text_field.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController namedController = TextEditingController();
  TextEditingController phonedController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void _registration( AuthController authController) {
      String name = namedController.text.trim();
      String password = passwordController.text.trim();
      String email = emailController.text.trim();
      String phone = phonedController.text.trim();
      if (name.isEmpty) {
        showCustomSnackBar("Type in your name", title: 'Name');
      } else if (phone.isEmpty) {
        showCustomSnackBar("Type in your Phone", title: 'Phone');
      } else if (email.isEmpty) {
        showCustomSnackBar("Type in your Email", title: 'Email');
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Type in Valid Email", title: 'Email');
      } else if (password.isEmpty) {
        showCustomSnackBar("Type in your password", title: 'password');
      } else if (password.length < 6) {
        showCustomSnackBar("Password cannot be less than 6 characters",
            title: 'Password');
      } else {
        SignUpBody signUpBody = SignUpBody(
            name: name, phone: phone, email: email, password: password);
        authController.registration(signUpBody).then((status) {
          if (status.isSuccess) {
           Get.toNamed(RouteHelper.getToInitial());
          } else {
            showCustomSnackBar(status.message,title: 'User Might Already Exists');
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(
        builder: (controller) {
          return controller.isLoading?const CustomLoader():SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
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
                AppTextField(
                  textInputType: TextInputType.emailAddress,
                  hintText: 'Email',
                  icon: Icons.email,
                  textEditingController: emailController,
                ),
                SizedBox(
                  height: Dimensions.responsiveHeight15,
                ),
                AppTextField(
                  textInputType: TextInputType.visiblePassword,
                  hintText: 'Password',
                  icon: Icons.lock,
                  textEditingController: passwordController,
                  isObscureText: true,
                ),
                SizedBox(
                  height: Dimensions.responsiveHeight15,
                ),
                AppTextField(
                  hintText: 'Name',
                  icon: Icons.person,
                  textEditingController: namedController,
                ),
                SizedBox(
                  height: Dimensions.responsiveHeight15,
                ),
                AppTextField(
                  textInputType: TextInputType.phone,
                  hintText: 'Phone',
                  icon: Icons.phone,
                  textEditingController: phonedController,
                ),
                SizedBox(
                  height: Dimensions.responsiveHeight45,
                ),
                GestureDetector(
                  onTap: () => _registration(controller),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.responsiveWidth30,
                        vertical: Dimensions.responsiveHeight20),
                    decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.all(
                            Radius.circular(Dimensions.responsiveHeight45))),
                    child: BigText(
                      text: 'Sign Up',
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.responsiveHeight15,
                ),
                GestureDetector(
                  onTap: () => () => SignInPage(),
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: Dimensions.font15 + 3),
                        text: 'Have and account?',
                        children: [
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.to(() => SignInPage(),
                                    transition: Transition.fadeIn),
                              text: ' Sign in',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: Dimensions.font15 + 3,
                                  fontWeight: FontWeight.bold))
                        ]),
                  ),
                ),
                SizedBox(
                  height: Dimensions.responsiveHeight20,
                ),
                Padding(
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
                )
              ],
            ),
          )  ;
        },
      ),
    );
  }
}
