import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_foods_controller.dart';
import 'package:food_delivery/data/repositories/recommended_food_repository.dart';
import 'package:food_delivery/helper/appConstants.dart';
import 'package:food_delivery/modals/products_modal.dart';
import 'package:food_delivery/pages/food_detail/popular_food_detail.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  final PageController _pageController = PageController(viewportFraction: .85);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _heightFactor = 220;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPageValue = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoaded
              ? Container(
                  padding: EdgeInsets.only(top: Dimensions.responsiveHeight10),
                  height: Dimensions.pageViewHeight,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: popularProducts.popularProductList.length,
                    itemBuilder: (context, position) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteHelper.getToPopularFoodDetails(
                              position, 'initial'));
                        },
                        child: _pageViewBuilder(position,
                            popularProducts.popularProductList[position]),
                      );
                    },
                  ),
                )
              : SizedBox(
                  height: Dimensions.pageViewHeight,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.mainColor,
                    ),
                  ),
                );
        }),
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty
                ? 1
                : popularProducts.popularProductList.length,
            position: _currentPageValue,
            decorator: DotsDecorator(
              color: AppColors.paraColor.withOpacity(.5),
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(Dimensions.responsiveHeight5)),
            ),
          );
        }),
        SizedBox(
          height: Dimensions.responsiveHeight30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.responsiveWidth20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(
                text: 'Recommended',
                size: 20,
              ),
              SizedBox(
                width: Dimensions.responsiveWidth5,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: '.',
                  size: Dimensions.font30,
                ),
              ),
              SizedBox(
                width: Dimensions.responsiveWidth5,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(
                  text: 'Food Pairing',
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          child: GetBuilder<RecommendedFoodController>(
            builder: (recommendedFoods) {
              return recommendedFoods.isLoaded
                  ? ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
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
                                          image: NetworkImage(
                                              AppConstants.API_BASE_URL +
                                                  '/uploads/' +
                                                  product.img!))),
                                  width: Dimensions.responsiveHeight125,
                                  height: Dimensions.responsiveHeight125,
                                ),
                                //Text Container
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(
                                        Dimensions.responsiveHeight10),
                                    height:
                                        Dimensions.responsiveHeight125 * .85,
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
                                                iconColor:
                                                    AppColors.iconColor1),
                                            IconAndTextWidget(
                                                text: "1.7km",
                                                icon: Icons.location_on,
                                                iconColor: AppColors.mainColor),
                                            IconAndTextWidget(
                                                text: "32 min",
                                                icon: Icons.timer,
                                                iconColor:
                                                    AppColors.iconColor2),
                                          ],
                                        )
                                      ],
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      })
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
          ),
        )
      ],
    );
  }

  Widget _pageViewBuilder(int index, ProductModal product) {
    Dimensions dimension = Dimensions();
    // TODO: implement _pageViewBuilder animation;
    return Stack(
      children: [
        Container(
          height: Dimensions.pageViewBGHeight,
          margin: EdgeInsets.only(
              left: Dimensions.responsiveWidth5,
              right: Dimensions.responsiveWidth5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.responsiveHeight30),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                AppConstants.API_BASE_URL + '/uploads/' + product.img!,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: Dimensions().calculateResponsiveHeight(7),
                horizontal: Dimensions.responsiveWidth10),
            height: Dimensions.pageViewFGHeight,
            margin: EdgeInsets.only(
                left: Dimensions.responsiveWidth10,
                right: Dimensions.responsiveWidth10,
                bottom: Dimensions.responsiveHeight10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(Dimensions.responsiveHeight20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.3)..alpha,
                    blurRadius: 5.0,
                    offset: const Offset(0, 5),
                  ),
                ]),
            child: AppColumn(
              text: product.name!,
              noOfStarts: product.stars!,
            ),
          ),
        ),
      ],
    );
  }
}

//page view aniamtion
//1.38
