import 'package:flutter/material.dart';

class NoDataPage extends StatelessWidget {
  const NoDataPage(
      {Key? key,
      required this.text,
      this.imagePath = 'assets/image/empty_cart.png'})
      : super(key: key);
  final String text;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.height * 0.3,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .03,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * .0175,
                color: Theme.of(context).disabledColor),
          )
        ],
      ),
    );
  }
}
