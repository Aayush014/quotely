import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotely/Screens/favourite_quote_screen.dart';

import '../Controller/quote_controller.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuoteController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favourite Category",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Obx(
        ()=> ListView.builder(
          itemCount: controller.categoryFavoriteList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Get.to(
                    const FavouriteQuoteScreen(),
                    transition: Transition.circularReveal,
                  );
                  controller.categoryFavoriteListAdd(controller.categoryFavoriteList[index]);
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child:  ListTile(
                    shape: const CircleBorder(),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          controller.categoryFavoriteList[index],
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    leading: const Icon(CupertinoIcons.quote_bubble),
                    trailing: const Icon(Icons.navigate_next),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
