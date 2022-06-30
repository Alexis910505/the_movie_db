import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:the_movie/app/data/models/movie_model.dart';
import 'package:the_movie/app/global_widgets/kText.dart';
import 'package:the_movie/app/theme/appColors.dart';
import 'package:the_movie/app/utils/Constants.dart';
import '../modules/movie_details/movie_details_binding.dart';
import '../modules/movie_details/movie_details_page.dart';

class MovieMenuCard extends StatelessWidget {
  const MovieMenuCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Movies item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Get.to(() => MovieDetailsPage(item), binding: MovieDetailsBinding()),
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor2,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 130,
              width: Get.width,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  child: Image.network(
                    '${Constants.THE_MOVIE_DB_IMG_PATH}${item.posterPath ?? '/fp0LPBqQy8jn2kW0ea5xqFrtSVE.jpg'}',
                    fit: BoxFit.cover,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  KText(
                    text: item.title,
                    color: white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  KText(
                    text: item.releaseDate,
                    color: white,
                    fontSize: 13,
                  ),
                  const SizedBox(height: 5),
                  RatingBar.builder(
                    initialRating: item.voteAverage,
                    minRating: 1,
                    itemSize: 12,
                    ignoreGestures: true,
                    // updateOnDrag: true,
                    tapOnlyMode: true,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 10,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  const SizedBox(height: 5),
                  KText(
                    text: item.overview,
                    maxLines: 3,
                    color: white.withOpacity(.70),
                    fontSize: 11,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
