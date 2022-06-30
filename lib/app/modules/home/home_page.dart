import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movie/app/data/models/movie_model.dart';
import 'package:the_movie/app/global_widgets/movie_menu_card.dart';
import 'package:the_movie/app/global_widgets/skeleton_cards/swin_menu_skeleton_card.dart';
import 'package:the_movie/app/modules/movie_search/movie_search_binding.dart';
import 'package:the_movie/app/theme/appColors.dart';
import 'package:the_movie/app/global_widgets/kText.dart';
import 'package:the_movie/app/modules/home/home_controller.dart';
import 'package:the_movie/app/modules/movie_search/movie_search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const KText(
                  text: 'watch_now',
                  fontSize: 28,
                ),
                IconButton(
                  onPressed: () => Get.to(() => const MovieSearchPage(),
                      binding: MovieSearchBinding()),
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(75),
            child: SizedBox(
              height: 60,
              child: Obx(
                () => Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      child: GestureDetector(
                        onTap: controller.popularity,
                        child: Container(
                          alignment: Alignment.center,
                          width: (MediaQuery.of(context).size.width / 3) - 10,
                          decoration: BoxDecoration(
                            color: controller.position.value == 0
                                ? green
                                : catagoryListColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: KText(text: 'popularity'),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      child: GestureDetector(
                        onTap: controller.billboard,
                        child: Container(
                          alignment: Alignment.center,
                          width: (MediaQuery.of(context).size.width / 3) - 10,
                          decoration: BoxDecoration(
                            color: controller.position.value == 1
                                ? green
                                : catagoryListColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: KText(text: 'billboard'),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      child: GestureDetector(
                        onTap: controller.boys,
                        child: Container(
                          alignment: Alignment.center,
                          width: (MediaQuery.of(context).size.width / 3) - 10,
                          decoration: BoxDecoration(
                            color: controller.position.value == 2
                                ? green
                                : catagoryListColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: KText(text: 'boys'),
                          ),
                        ),
                      ),
                    )
                  ],
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
            () => !controller.loading.value
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            childAspectRatio: .66),
                    itemCount: controller.position.value == 0
                        ? controller.totalItemsPopularity.value
                        : controller.position.value == 1
                            ? controller.totalItemsBillboard.value
                            : controller.totalItemsBoys.value,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    primary: false,
                    itemBuilder: (context, index) {
                      if (controller.position.value == 0) {
                        if (index >= controller.moviesPopularity.length - 1) {
                          controller.popularity();
                        }
                      }
                      if (controller.position.value == 1) {
                        if (index >= controller.moviesBillboard.length - 1) {
                          controller.billboard();
                        }
                      }
                      if (controller.position.value == 2) {
                        if (index >= controller.moviesBoys.length - 1) {
                          controller.boys();
                        }
                      }
                      final Movies item = controller.position.value == 0
                          ? controller.moviesPopularity[index]
                          : controller.position.value == 1
                              ? controller.moviesBillboard[index]
                              : controller.moviesBoys[index];
                      return MovieMenuCard(item: item);
                    },
                  )
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            childAspectRatio: .66),
                    itemCount: 6,
                    shrinkWrap: true,
                    primary: false,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return const SkeletonMenuCard();
                    },
                  ),
          ),
        ),
        bottomSheet: Container(
          color: primaryColor2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: () {},
                child: const Icon(
                  Icons.home,
                  size: 30,
                  color: Colors.grey,
                ),
              ),
              MaterialButton(
                onPressed: () {},
                child: const Icon(
                  Icons.movie,
                  size: 30,
                  color: Colors.grey,
                ),
              ),
              MaterialButton(
                onPressed: () {},
                child: const Icon(
                  Icons.favorite,
                  size: 30,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
