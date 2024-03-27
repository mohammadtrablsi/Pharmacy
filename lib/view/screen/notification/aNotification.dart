import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/core/constant/appMargin.dart';
import 'package:pharmacy/view/widget/in%20common/appAppBar.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/notification/aNotificationController.dart';
import '../../../core/functions/appLoadingIndicator.dart';
import '../../widget/notification/aNotificationItem.dart';

class ANotification extends StatelessWidget {
  const ANotification({super.key, required this.hasBackIconInAppBar});
  final bool hasBackIconInAppBar;

  @override
  Widget build(BuildContext context) {
    double widthOfScreen = MediaQuery.of(context).size.width;
    ANotificationController controller=Get.put(ANotificationController());
    return Scaffold(
      appBar: AppAppBar(text: 'Notifications', haveBackIcon: hasBackIconInAppBar,haveActionIcon: false,),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppMargin.ScreenMargin),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 2.h),
          Expanded(
            child: GetBuilder<ANotificationController>(builder: (controller) {
              return FutureBuilder(
                future: controller.fetchFireStore('Notifications'),
                builder:
                    (context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return appLoadingIndicator();
                  } else
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return  ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsetsDirectional.only(bottom: 0.3.h),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200 * index),
                            transform: Matrix4.translationValues(
                                controller.isEnmated
                                    ? (widthOfScreen - AppMargin.ScreenMargin)
                                    : 0,
                                0,
                                0),
                            child:  ANotificationItem(
                              text: snapshot.data![index]['message'],
                              time: "${snapshot.data![index]['date']} ${snapshot.data![index]['time']}",
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              );
            }),
          ),
        ]),
      ),
    );
  }
}
