import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/quote_controller.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuoteController controller = Get.find();
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
              height: height / 3.3,
              child: Image.asset(
                "Assets/Images/category.png",
                fit: BoxFit.cover,
              )),
          const Padding(
            padding: EdgeInsets.only(top: 30, bottom: 20),
            child: Text(
              "What areas of your life would\nyou like to improve ?",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, height: 1),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: categoryList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 20 / 9),
              itemBuilder: (context, index) {
                return CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    controller.categoryListAdd(categoryList[index]);
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color:  Colors.black,
                            width: 2),
                      ),
                      child: Text(
                        categoryList[index],
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}

List categoryList = [
  "Love",
  "Affirmation",
  "Motivation",
  "Deep",
  "Positive",
  "Mental Health",
  "Discipline",
  "Broken",
  "Self Esteem",
  "Success",
  "Friendship",
  "Loyalty",
  "Kindness",
  "Funny",
  "Happy",
  "Sad",
  "Hope",
  "Gratitude",
  "Ego",
  "Patience"
];
