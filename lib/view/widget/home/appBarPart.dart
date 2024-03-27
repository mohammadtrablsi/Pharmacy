import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:pharmacy/controller/home/homeController.dart';

import '../../../core/constant/color.dart';

class AppBarPart extends GetView<HomeController>
    implements PreferredSizeWidget {
  const AppBarPart(
      {required this.text,
      required this.menuOnPressed,
      required this.cartOnPressed,
      required this.searchOnPressed});
  final String text;
  final void Function() menuOnPressed;
  final void Function() cartOnPressed;
  final void Function() searchOnPressed;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
    return AppBar(
      elevation: 1,
      shadowColor: AppColor.secondryColor,
      backgroundColor: AppColor.primaryColor,
      leading: InkWell(
        onTap: menuOnPressed,
        child: const Icon(
          Icons.menu,
          color: AppColor.secondryColor,
        ),
      ),
      title: Row(
        children: [
          InkWell(
            onTap: cartOnPressed,
            child: const Icon(
              Icons.shopping_cart,
              color: AppColor.secondryColor,
            ),
          ),
          const Spacer(),
          Text(
            text,
            style: TextStyle(fontSize: 14.sp, color: AppColor.secondryColor),
          ),
          const Spacer(),
        ],
      ),
      centerTitle: false,
      actions: [
        IconButton(
            onPressed: searchOnPressed,
            icon: const Icon(
              Icons.search,
              color: AppColor.secondryColor,
            )),
      ],
    );
  }
}
