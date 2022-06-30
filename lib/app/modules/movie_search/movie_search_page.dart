// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie/app/global_widgets/movie_menu_card.dart';
import 'package:the_movie/app/modules/movie_search/movie_search_controller.dart';
import 'package:the_movie/app/theme/appColors.dart';
import 'package:the_movie/app/global_widgets/kText.dart';

class MovieSearchPage extends StatelessWidget {
  const MovieSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieSearchController>(
      builder: (controller) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back_ios,
              ),
            ),
            centerTitle: true,
            title: const KText(
              text: 'search',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(70),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextFormField(
                  readOnly: false,
                  cursorColor: Colors.white54,
                  style: GoogleFonts.poppins(
                    color: Colors.white54,
                  ),
                  onChanged: controller.onChangedSearch,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'find_movie'.tr,
                    hintStyle: GoogleFonts.poppins(
                      color: Colors.white54,
                    ),
                    fillColor: primaryColor,
                    filled: true,
                  ),
                ),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Obx(
              () => GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: .66),
                itemCount: controller.totalItems.value,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                primary: false,
                itemBuilder: (context, index) {
                  if (index >= controller.movies.length - 1) {
                    controller.searchMovie();
                  }
                  final item = controller.movies[index];
                  return MovieMenuCard(item: item);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
