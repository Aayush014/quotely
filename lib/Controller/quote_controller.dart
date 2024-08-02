import 'dart:math';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:quotely/Controller/quotes_db_sarvice.dart';

import '../Model/quote_model.dart';
import 'api_services.dart';

class QuoteController extends GetxController {
  RxList<Quotes> quoteList = <Quotes>[].obs;
  RxList<Quotes> quoteRandomList = <Quotes>[].obs;
  RxList<Quotes> quoteFavoriteList = <Quotes>[].obs;
  ApiServices apiServices = ApiServices();

  @override
  void onInit() {
    fetchQuotes();
    super.onInit();
  }

  Future<void> fetchQuotes() async {
    List<Map<String, dynamic>> json = await apiServices.fetchApi();
    quoteList.value = json
        .asMap()
        .entries
        .map((e) => Quotes.fromMap(e.key, e.value))
        .toList();
    print(quoteList[0].index);
    QuotesDbService.quotesDbService.readDatabase();
    randomQuotes();
  }

  Quotes? getRandomQuote() {
    if (quoteList.isEmpty) {
      return null; // or handle empty list case as needed
    }
    final random = Random();
    return quoteList[random.nextInt(quoteList.length)];
  }

  void randomQuotes() {
    Set<int> indices = {};
    while (indices.length < 10) {
      indices.add(getRandomQuote()!.index);
    }
    quoteRandomList.value = indices.map((i) => quoteList[i]).toList();
  }

  void favoriteQuotes(int index) {
    var quote = quoteRandomList[index];
    quote.isLike = !quote.isLike;
    quoteList[quote.index].isLike = quote.isLike;

    if (quote.isLike) {
      quoteFavoriteList.add(quote);
    } else {
      quoteFavoriteList.remove(quote);
    }
    Set<String> catogeryFavoriteSet = {};
    for (var element in quoteFavoriteList) {
      catogeryFavoriteSet.add(element.category!);
    }
    categoryFavoriteList.value = catogeryFavoriteSet.toList();
    print(categoryFavoriteList);
    categoryFavoriteList.refresh();

    quoteRandomList.refresh();
    quoteList.refresh();
  }

  RxList<String> categoryFavoriteList = <String>[].obs;

  void categoryListAdd(String catogery) {
    quoteRandomList.clear();
    quoteRandomList.refresh();

    for (var element in quoteList) {
      if (element.category == catogery) {
        quoteRandomList.add(element);
      }
    }
    quoteRandomList.refresh();
    QuotesDbService.quotesDbService.readDatabase();
  }

  RxList<Quotes> categoryFavoriteQuotesList = <Quotes>[].obs;

  void categoryFavoriteListAdd(String catogery) {
    categoryFavoriteQuotesList.clear();
    for (var element in quoteFavoriteList) {
      if (element.category == catogery) {
        categoryFavoriteQuotesList.add(element);
      }
    }
    categoryFavoriteQuotesList.refresh();
  }
}
