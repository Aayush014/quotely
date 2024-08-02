import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:outlined_text/outlined_text.dart';
import 'package:quotely/Controller/quote_controller.dart';
import 'package:quotely/Screens/category_screen.dart';
import 'package:quotely/Screens/favourite_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    QuoteController controller = Get.put(QuoteController());

    return Scaffold(
      body: Obx(
        () {
          if (controller.quoteList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("Assets/Images/bg.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                PageView(
                  physics: const ClampingScrollPhysics(),
                  scrollBehavior: const CupertinoScrollBehavior(),
                  scrollDirection: Axis.vertical,
                  children: List.generate(
                    controller.quoteRandomList.length,
                    (index) {
                      // ignore: avoid_print
                      print(controller.quoteRandomList[index].quote);

                      return Stack(
                        children: [
                          SizedBox(
                            height: height,
                            width: width,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  OutlinedText(
                                    text: Text(
                                      controller.quoteRandomList[index].quote,
                                      style: const TextStyle(
                                        fontSize: 30,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    strokes: [
                                      OutlinedTextStroke(
                                        color: Colors.black,
                                        width: 4,
                                      ),
                                    ],
                                  ),
                                  OutlinedText(
                                    text: Text(
                                      controller
                                          .quoteRandomList[index].category!,
                                      style: const TextStyle(
                                        fontSize: 30,
                                        color: Colors.red,
                                      ),
                                    ),
                                    strokes: [
                                      OutlinedTextStroke(
                                        color: Colors.black,
                                        width: 3.5,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 150),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Obx(
                                () {
                                  return LikeButton(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    size: 60,
                                    circleColor: CircleColor(
                                      start: Colors.red.shade300,
                                      end: Colors.red.shade500,
                                    ),
                                    animationDuration:
                                        const Duration(milliseconds: 1500),
                                    bubblesColor: BubblesColor(
                                      dotPrimaryColor: Colors.red.shade200,
                                      dotSecondaryColor: Colors.pink.shade200,
                                    ),
                                    isLiked: controller
                                        .quoteRandomList[index].isLike,
                                    likeBuilder: (bool isLiked) {
                                      return Icon(
                                        isLiked
                                            ? CupertinoIcons.heart_fill
                                            : CupertinoIcons.heart,
                                        color: Colors.red,
                                        size: 60,
                                      );
                                    },
                                    onTap: (bool isLiked) async {
                                      controller.favoriteQuotes(index);
                                      return !isLiked;
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 30, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CupertinoButton(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        color: Colors.grey.shade900,
                        onPressed: () {
                          Get.to(const CategoryScreen(),
                              transition: Transition.circularReveal);
                        },
                        child: const Icon(CupertinoIcons.line_horizontal_3),
                      ),
                      CupertinoButton(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        color: Colors.grey.shade900,
                        onPressed: () {
                          Get.to(const FavouriteScreen(),
                              transition: Transition.circularReveal);
                        },
                        child: const Icon(CupertinoIcons.heart_fill),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CupertinoButton(
        color: Colors.grey.shade900,
        padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 20),
        onPressed: () {},
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(CupertinoIcons.paintbrush_fill),
            Text("    Theme"),
          ],
        ),
      ),
    );
  }
}
