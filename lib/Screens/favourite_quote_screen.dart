import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/quote_controller.dart';

class FavouriteQuoteScreen extends StatelessWidget {
  const FavouriteQuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuoteController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "${controller.categoryFavoriteQuotesList[0].category!} Quotes",
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Obx(
        ()=> ListView.builder(
          itemCount: controller.categoryFavoriteQuotesList.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Container(
              height: 350,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  children: [
                    Text(
                      controller.categoryFavoriteQuotesList[index].category!,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      controller.categoryFavoriteQuotesList[index].quote,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "- ${controller.categoryFavoriteQuotesList[index].author}",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(

                            border: Border.all(color: Colors.black,width: 2),
                            shape: BoxShape.circle
                          ),
                          child: const Icon(Icons.copy,size: 28,),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black,width: 2),
                            shape: BoxShape.circle
                          ),
                          child: const Icon(Icons.share,size: 28,),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30,)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
