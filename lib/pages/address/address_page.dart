import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/controllers/location_controller.dart';
import 'package:food_delivery/controllers/user_controller.dart';
import 'package:food_delivery/modals/adress_model.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../widgets/small_text.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController _adressController = TextEditingController();
  TextEditingController _contactPersonName = TextEditingController();
  TextEditingController _contactPersonPhone = TextEditingController();
  late bool _isLoagged;
  CameraPosition _cameraPosition =
      const CameraPosition(target: LatLng(45.51563, -122.677433), zoom: 17);
  LatLng _initialPosition = LatLng(45.51563, -122.677433);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isLoagged = Get.find<AuthController>().userLoggedIN();
    if (_isLoagged && Get.find<UserController>().userModel == null) {
      Get.find<UserController>().getUserInfo();
    }
    if (Get.find<LocationController>().addressList.isNotEmpty) {
      Get.find<LocationController>().getUserAddressFromLocStore();
      _cameraPosition = CameraPosition(
          target: LatLng(
              double.parse(
                  Get.find<LocationController>().getAddress['latitude']),
              double.parse(
                  Get.find<LocationController>().getAddress['longitude'])));
      _initialPosition = LatLng(
          double.parse(Get.find<LocationController>().getAddress['latitude']),
          double.parse(Get.find<LocationController>().getAddress['longitude']));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Address page'),
        backgroundColor: AppColors.mainColor,
      ),
      body: GetBuilder<UserController>(
        builder: (userController) {
          if (userController.userModel != null &&
              _contactPersonName.text.isEmpty) {
            _contactPersonName.text = '${userController.userModel.name}';
            _contactPersonPhone.text = '${userController.userModel.phone}';
            if (Get.find<LocationController>().addressList.isNotEmpty) {
              _adressController.text = Get.find<LocationController>()
                  .getUserAddressFromLocStore()
                  .address;
            }
          }
          return GetBuilder<LocationController>(
            builder: (locationController) {
              _adressController.text =
                  '${locationController.placeMark.name ?? ''}'
                  '${locationController.placeMark.locality ?? ''}'
                  '${locationController.placeMark.postalCode ?? ''}'
                  '${locationController.placeMark.country ?? ''}';

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 140,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(width: 2, color: AppColors.mainColor)),
                      child: Stack(
                        children: [
                          GoogleMap(
                            myLocationEnabled: true,
                            initialCameraPosition: CameraPosition(
                                target: _initialPosition, zoom: 17),
                            zoomControlsEnabled: false,
                            compassEnabled: false,
                            indoorViewEnabled: true,
                            mapToolbarEnabled: false,
                            onCameraIdle: () {
                              locationController.updatePosition(
                                  _cameraPosition, true);
                            },
                            onCameraMove: ((position) =>
                                _cameraPosition = position),
                            onMapCreated: (controller) {
                              locationController.setMapController(controller);
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.responsiveHeight20,
                    ),
                    Padding(
                      padding: EdgeInsets.all(Dimensions.responsiveWidth10),
                      child: SizedBox(
                        height: 50,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                locationController.addressTypeList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  locationController.setAddressTypeIndex(index);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      right: Dimensions.responsiveWidth10),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Dimensions.responsiveWidth5,
                                      vertical: Dimensions.responsiveHeight10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.responsiveHeight10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey[200]!,
                                            spreadRadius: 1,
                                            blurRadius: 5)
                                      ]),
                                  child: Row(
                                    children: [
                                      Icon(
                                        index == 0
                                            ? Icons.home_filled
                                            : index == 1
                                                ? Icons.work
                                                : Icons.location_on,
                                        color: locationController
                                                    .addressTypeIndex ==
                                                index
                                            ? AppColors.mainColor
                                            : Theme.of(context).disabledColor,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: Dimensions.responsiveWidth10),
                      child: BigText(text: "Delivery Address"),
                    ),
                    AppTextField(
                        textEditingController: _adressController,
                        hintText: 'Adress',
                        icon: Icons.map),
                    SizedBox(
                      height: Dimensions.responsiveHeight20,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: Dimensions.responsiveWidth10),
                      child: BigText(text: "Your Name"),
                    ),
                    AppTextField(
                        textEditingController: _contactPersonName,
                        hintText: 'Your Name',
                        icon: Icons.person),
                    SizedBox(
                      height: Dimensions.responsiveHeight20,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: Dimensions.responsiveWidth10),
                      child: BigText(text: "Your Phone"),
                    ),
                    AppTextField(
                        textEditingController: _contactPersonPhone,
                        hintText: 'Your Phone',
                        icon: Icons.phone),
                  ],
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: GetBuilder<LocationController>(
        builder: (locationController) {
          return Container(
            height: Dimensions.responsiveHeight125,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    print('tapped');

                    AddressModal _address = AddressModal(
                        addressType: locationController.addressTypeList[
                            locationController.addressTypeIndex],
                        contactPersonName: _contactPersonName.text,
                        contactPhoneNumber: _contactPersonPhone.text,
                        address: _adressController.text,
                        latitude:
                            locationController.position.latitude.toString(),
                        longitude:
                            locationController.position.longitude.toString());
                    locationController.addAddress(_address).then((value) {
                      print(value);
                      if (value.isSuccess) {
                        Get.back();
                        Get.snackbar('Address', "Saved Successfully");
                      } else {
                        Get.snackbar("Address", 'Cant save adress');
                      }
                    });
                  },
                  child: Container(
                    height: Dimensions().calculateResponsiveHeight(70),
                    padding: EdgeInsets.all(Dimensions.responsiveHeight20),
                    decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(
                            Dimensions.responsiveHeight20)),
                    child: Center(
                        child: SmallText(
                      text: 'Save Address',
                      color: Colors.white,
                      size: 18,
                    )),
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
