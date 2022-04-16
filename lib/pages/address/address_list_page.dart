import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/location_controller.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AddressListPage extends StatelessWidget {
  const AddressListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
      ),
      body: GetBuilder<LocationController>(
        builder: (controller) {
          return controller.addressList.isNotEmpty
              ? Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.addressList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(controller.addressList[index].address),
                            subtitle:
                                Text(controller.addressList[index].addressType),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                // controller.deleteAddress(controller.addressList[index]);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Text('No Address Found'),
                );
        },
      ),
    );
  }
}
