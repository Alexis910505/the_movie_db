import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:the_movie/app/theme/appColors.dart';

class SkeletonMenuCard extends StatelessWidget {
  const SkeletonMenuCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      color: primaryColor2,
      child: Column(
        children: [
          SkeletonAnimation(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)
            ),
            shimmerColor: white
                .withOpacity(0.1),
            curve: Curves.easeOutQuad,
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).disabledColor,
                  borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)
            )),
              height: 130,
              width: Get.width,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                SkeletonAnimation(
                  borderRadius: BorderRadius.circular(20),
                  shimmerColor: white.withOpacity(0.2),
                  curve: Curves.easeOutQuad,
                  child: Container(
                    height: 17,
                    width: Get.width * 0.9,
                    decoration: BoxDecoration(
                      color: Theme.of(context).disabledColor.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                SkeletonAnimation(
                  borderRadius: BorderRadius.circular(20),
                  shimmerColor: white.withOpacity(0.2),
                  curve: Curves.easeOutQuad,
                  child: Container(
                    height: 15,
                    width: Get.width * 0.2,
                    decoration: BoxDecoration(
                      color: Theme.of(context).disabledColor.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                SkeletonAnimation(
                  borderRadius: BorderRadius.circular(20),
                  shimmerColor: white.withOpacity(0.2),
                  curve: Curves.easeOutQuad,
                  child: RatingBar.builder(
                      initialRating: 10,
                      minRating: 1,
                      itemSize: 12,
                      ignoreGestures: true,
                      // updateOnDrag: true,
                      tapOnlyMode: true,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 10,
                      itemPadding: const EdgeInsets.symmetric(
                          horizontal: 1),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Theme.of(context).disabledColor.withOpacity(0.9),
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 2.0),
                  child: SkeletonAnimation(
                    borderRadius: BorderRadius.circular(20),
                    shimmerColor: white.withOpacity(0.2),
                    curve: Curves.easeOutQuad,
                    child: Container(
                      height: 15,
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .disabledColor
                            .withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 2.0),
                  child: SkeletonAnimation(
                    borderRadius: BorderRadius.circular(20),
                    shimmerColor: white.withOpacity(0.2),
                    curve: Curves.easeOutQuad,
                    child: Container(
                      height: 15,
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .disabledColor
                            .withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 2.0),
                  child: SkeletonAnimation(
                    borderRadius: BorderRadius.circular(20),
                    shimmerColor: white.withOpacity(0.2),
                    curve: Curves.easeOutQuad,
                    child: Container(
                      height: 15,
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .disabledColor
                            .withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
