import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: Dimensions.responsiveHeight10,),
          Center(

            child: Container(
              margin: EdgeInsets.only(top: Dimensions.responsiveHeight45),
              child: CircleAvatar(
radius: Dimensions.responsiveHeight45*2,
                backgroundImage: AssetImage('assets/image/logo part 1.png'),

              ),
            ),
          )
        ],
      ),
    );
  }
}
