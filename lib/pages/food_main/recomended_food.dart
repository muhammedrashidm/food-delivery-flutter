import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/recommended_foods_controller.dart';
import 'package:food_delivery/helper/appConstants.dart';
import 'package:food_delivery/modals/products_modal.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

class RecommendedFood extends StatelessWidget {
  const RecommendedFood({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecommendedFoodController>(
      builder: (recommendedFoods) {
        return recommendedFoods.isLoaded
            ? SingleChildScrollView(
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recommendedFoods.recommendedFoodList.length,
                  itemBuilder: (context, index) {
                    ProductModal product =
                        recommendedFoods.recommendedFoodList[index];
                    return GestureDetector(
                      onTap: () => Get.toNamed(
                          RouteHelper.getToRecommendedFoodDetails(
                              index, 'initial')),
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(
                            horizontal: Dimensions.responsiveWidth10,
                            vertical: 5),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.responsiveHeight20),
                                  color: Colors.amberAccent,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(


                                              product.img!))),
                              width: Dimensions.responsiveHeight125,
                              height: Dimensions.responsiveHeight125,
                            ),
                            //Text Container
                            Expanded(
                              child: Container(
                                padding:
                                    EdgeInsets.all(Dimensions.responsiveHeight10),
                                height: Dimensions.responsiveHeight125 * .85,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(
                                        Dimensions.responsiveHeight20),
                                    topRight: Radius.circular(
                                        Dimensions.responsiveHeight20),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    BigText(
                                      text: product.name!,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      height: Dimensions.responsiveHeight5,
                                    ),
                                    SmallText(text: product.description!),
                                    SizedBox(
                                      height: Dimensions.responsiveHeight5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconAndTextWidget(
                                            text: "Normal",
                                            icon: Icons.circle_sharp,
                                            iconColor: AppColors.iconColor1),
                                        IconAndTextWidget(
                                            text: "1.7km",
                                            icon: Icons.location_on,
                                            iconColor: AppColors.mainColor),
                                        IconAndTextWidget(
                                            text: "32 min",
                                            icon: Icons.timer,
                                            iconColor: AppColors.iconColor2),
                                      ],
                                    )
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
            : Column(
                children: [
                  SizedBox(
                    height: Dimensions.responsiveHeight45,
                  ),
                  CircularProgressIndicator(
                    color: AppColors.mainColor,
                  ),
                ],
              );
      },
    );
  }
}
