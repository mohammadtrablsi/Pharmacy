import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/core/constant/imageassets.dart';
import 'package:pharmacy/view/widget/home/ImageInCarouselSlider.dart';
import 'package:pharmacy/view/widget/home/shimmerAdsItem.dart';
import 'package:pharmacy/view/widget/in%20common/animatedPoints.dart';
import 'package:sizer/sizer.dart';

class CarouselSliderPart extends StatelessWidget {
  const CarouselSliderPart(
      {super.key,
      required this.data,
      required this.indexOfCarouselSlider,
      required this.setIndexOfCarouslSlider,
      required this.adsIsLoading});
  final data;
  final int indexOfCarouselSlider;
  final setIndexOfCarouslSlider;
  final bool adsIsLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
                adsIsLoading
                    ? const ShimmerAdsItem()
                    : ImageInCarouselSlider(
                        image: data == null
                            ? AppImageAsset.waitingData
                            : data[index]['image'],
                      ),
            options: CarouselOptions(
              height: 20.h,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              onPageChanged: (index, reason) {
                setIndexOfCarouslSlider(index);
              },
              scrollDirection: Axis.horizontal,
            )),
        SizedBox(
          height: 2.h,
        ),
        AnimatedPoints(indexPage: indexOfCarouselSlider),
      ],
    );
  }
}
