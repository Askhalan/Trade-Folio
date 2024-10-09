import 'dart:developer';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:tradefolio/controller/search_controller.dart';
import 'package:tradefolio/model/company_model.dart';
import 'package:tradefolio/model/company_with_quote_model.dart';
import 'package:tradefolio/model/global_quote_model.dart';

class WatchlistController extends GetxController {
  final HomeController homeController = Get.find();
  final String _boxName = "watchlistBox";
  var watchItemsList = <CompanyModel>[].obs;

  Future<Box<CompanyModel>> get _box async =>
      await Hive.openBox<CompanyModel>(_boxName);

  // Add a company to the watchlist
  Future<void> addToWatchlist(
      CompanyWithQuoteModel companyWithQuoteModel) async {
    var box = await _box;
    final company = CompanyModel.fromCompanyWithQuote(companyWithQuoteModel);
    await box.add(company);
    await fetchWatchlist(); // Refresh the list after adding to avoid duplicates
  }

  // Fetch companies from Hive watchlist
  Future<void> fetchWatchlist() async {
    log('entered fetch watchlist');
    var box = await _box;
    watchItemsList.clear(); // Clear the list first to avoid duplicates
    watchItemsList.addAll(box.values.toList());
  }

  // Delete a company from the watchlist
  Future<void> deleteCompanyFromWatchlist(CompanyModel companyModel) async {
    var box = await _box;
    final key = box.keys.firstWhere(
      (k) => box.get(k)?.symbol == companyModel.symbol,
      orElse: () => null,
    );

    if (key != null) {
      await box.delete(key);
      await fetchWatchlist(); // Refresh the list after deleting
     
    }
  }

Future<void> syncStockPriceIfNeeded(CompanyModel company) async {
  final cachedPrice = company.quote?.price;
  
  // Show cached price immediately
  if (cachedPrice != null) {
    company.quote?.price = cachedPrice;
  }

  final stockQuote = await homeController.fetchPrice(company.symbol);

  if (stockQuote != null) {
    company.updateSyncTime(); // Update the sync time
    company.updateQuote(stockQuote); // Update with fetched quote

    await _updateCompanyInHive(company); // Store updated company in Hive
  }
}
 
  // Helper function to update a company in Hive after syncing stock price
  Future<void> _updateCompanyInHive(CompanyModel company) async {
    var box = await _box;

    // Find the key associated with the company symbol
    final key =
        box.keys.firstWhere((k) => box.get(k)?.symbol == company.symbol);
    await box.put(key, company); // Update company in the box
  }

  Future<String> liveStockPrice(CompanyModel company) async {
    final GlobalQuoteModel? quote =
        await homeController.fetchPrice(company.symbol);
    if (quote != null) {
      return quote.price;
    } else {
      return "loading";
    }
  }
}
