import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:the_movie/app/data/models/movie_model.dart';
import 'package:the_movie/app/modules/movie_details/movie_details_controller.dart';
import 'package:the_movie/app/theme/appColors.dart';
import 'package:the_movie/app/global_widgets/kText.dart';
import 'package:the_movie/app/utils/Constants.dart';

class MovieDetailsPage extends StatelessWidget {
  final Movies item;
  const MovieDetailsPage(this.item, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieDetailsController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => Get.defaultDialog(
                        title: item.title,
                        content: Image.network(
                          '${Constants.THE_MOVIE_DB_IMG_PATH}${item.posterPath ?? '/fp0LPBqQy8jn2kW0ea5xqFrtSVE.jpg'}',
                          fit: BoxFit.cover,
                          height: 500,
                          width: Get.width,
                        ),
                      ),
                      child: Container(
                        height: 200,
                        width: Get.width,
                        color: primaryColor2,
                        child: Image.network(
                          '${Constants.THE_MOVIE_DB_IMG_PATH}${item.backdropPath ?? '/fp0LPBqQy8jn2kW0ea5xqFrtSVE.jpg'}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 5,
                      left: 10,
                      child: IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: white,
                        ),
                      ),
                    ),
                    Obx(
                      () => Positioned(
                        top: 5,
                        right: 10,
                        child: IconButton(
                          onPressed: controller.onChangedFavorite,
                          icon: Icon(
                            Icons.favorite,
                            color: controller.movieFavorite.value ? red : white,
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      bottom: 10,
                      child: KText(
                        text: 'over_view',
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: KText(
                        text: item.title,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          KText(
                            text: item.releaseDate,
                            fontSize: 17,
                          ),
                          Row(
                            children: [
                              const KText(
                                text: 'popularity',
                                fontSize: 17,
                              ),
                              KText(
                         text: ':  ${item.popularity}',
                         fontSize: 17,
                       ),
                            ],
                          ),
                       
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: RatingBar.builder(
                            initialRating: item.voteAverage,
                            minRating: 1,
                            itemSize: 20,
                            // updateOnDrag: true,
                            tapOnlyMode: true,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 10,
                            itemPadding: const EdgeInsets.symmetric(horizontal: 5),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                        ),
                        KText(
                        text: '(${item.voteCount})',
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: primaryColor2,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: KText(
                            text: 'synopsis',
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          KText(
                            text: item.overview,
                            fontSize: 14,
                            maxLines: 100,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
