import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/core/constant/routes.dart';
import 'package:pharmacy/view/widget/in%20common/medicineItem.dart';
import 'package:pharmacy/view/widget/in%20common/searchCard.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/medicineInCompanies/medicineInCompaniesController.dart';
import '../../../core/constant/appMargin.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/appLoadingIndicator.dart';
import '../orders/orderItem.dart';

class AppTabBar extends StatelessWidget {
  const AppTabBar(
      {super.key,
      required this.taps,
      required this.canScroll,
      required this.haveSearch,
      required this.haveLine,
      required this.haveBackgroundColor,
      required this.paddingTopForListView,
      required this.future,
      required this.setIndex,
      this.futureSearch,
      this.search,
      this.onChangedSearch,
      this.onPressedDelete,
      this.focusNode});
  final List<Widget> taps;
  final bool canScroll;
  final bool haveSearch;
  final bool haveLine;
  final bool haveBackgroundColor;
  final double paddingTopForListView;
  final future;
  final futureSearch;
  final void Function(int) setIndex;
  final search;
  final onChangedSearch;
  final onPressedDelete;
  final focusNode;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: taps.length,
        child: Column(
          children: [
            SizedBox(
              height: 0.3.h,
            ),
            topOfTapBar(context),
            haveSearch
                ? GetBuilder<MedicineInCompaniesController>(
                    builder: (controller) {
                    return Padding(
                      padding: EdgeInsetsDirectional.only(
                          end: AppMargin.ScreenMargin / 2,
                          start: AppMargin.ScreenMargin / 2,
                          top: paddingTopForListView),
                      child: SearchCard(
                        focusNode: focusNode,
                        controller: controller.search,
                        hintText: 'enter medicine name',
                        speechEnabled: controller.speechEnabled,
                        speechToText: controller.speechToText,
                        onPressedSuffixIcon: () {
                          if (controller.speechEnabled) {
                            controller.speechToText.isListening
                                ? controller.stopListening()
                                : controller.startListening();
                          } else {
                            print('Speech recognition is not available123');
                          }
                        },
                        onTapSearch: () {},
                        onChanged: onChangedSearch,
                      ),
                    );
                  })
                : Container(),
            viewOfTapBar(future),
          ],
        ),
      ),
    );
  }

  Widget topOfTapBar(context) {
    return Container(
      height: 7.h,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: haveLine ? AppColor.primaryColor : Colors.transparent,
            width: haveLine ? 0.2.h : 0,
          ),
        ),
        color: haveBackgroundColor ? Colors.white : Colors.transparent,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: TabBar(
              onTap: (int index) {
                if (index == 2) {
                  // Get.delete<StoresAcceptController>(force: true);
                }
                setIndex(index);
              },
              indicator: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(5.sp)),
              isScrollable: canScroll,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: taps,
            ),
          ),
        ),
      ),
    );
  }

  Widget viewOfTapBar(future) {
    return Expanded(
        child: TabBarView(
      children: List.generate(
        taps.length,
        (index) => Padding(
          padding: EdgeInsetsDirectional.only(
              start: AppMargin.ScreenMargin,
              end: AppMargin.ScreenMargin,
              top: 1.h),
          child: FutureBuilder(
            future: canScroll
                ? haveSearch
                    ? search.text.length == 0
                        ? future
                        : futureSearch
                    : future
                : future,
            builder: (context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return appLoadingIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 1.h),
                      child: canScroll
                          ? MedicineItem(
                              data: snapshot.data![index],
                            )
                          : InkWell(
                              child: OrderItem(
                                  data: snapshot.data![index],
                                  onPressedDelete: () => onPressedDelete(
                                      'Orders', snapshot.data?.first.id)),
                              onTap: () => Get.toNamed(AppRoute.detailsOfOrder,
                                  arguments: [
                                    {'data': snapshot.data![index]}
                                  ]),
                            ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    ));
  }
}
