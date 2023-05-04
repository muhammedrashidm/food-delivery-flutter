import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/catogery_contoller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/helper/appConstants.dart';
import 'package:food_delivery/modals/products_modal.dart';
import 'package:food_delivery/pages/food_main/category_vise_page.dart';
import 'package:food_delivery/pages/food_main/recomended_food.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController(viewportFraction: .85);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _heightFactor = 220;
  late TabController _tabController;

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
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
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

          // Tab view
          _tabSection(context)
        ],
      ),
    );
  }

  Widget _tabSection(BuildContext context) {
    return GetBuilder<CategoryController>(builder: (controller) {
      List<String> catogeries = controller.getCatogeries();
      _tabController =
          TabController(length: catogeries.length + 1, vsync: this);
      List<Widget> _tabBarItems = [
        Text(
          "Recomended",
          style: TextStyle(
            fontSize: Dimensions.font15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ];
      List<Widget> _tabViewItems = [RecommendedFood()];
      for (var item in catogeries) {
        _tabBarItems.add(
          Text(
            item,
            style: TextStyle(
              fontSize: Dimensions.font15,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      }

      for (var item in catogeries) {
        _tabViewItems.add(
          CategoryPageBuilder(
            category: item,
          ),
        );
      }

      return Column(
        children: [
          TabBar(
            labelColor: _tabController.index == 0
                ? AppColors.mainColor
                : AppColors.paraColor,
            isScrollable: true,
            tabs: _tabBarItems,
            controller: _tabController,
          ),
          Container(

            height: MediaQuery.of(context).size.height *.72,
            child: TabBarView(
              children: _tabViewItems,
              controller: _tabController,
            ),
          )
        ],
      );
    });
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
              image: AssetImage(
             product.img!,
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

