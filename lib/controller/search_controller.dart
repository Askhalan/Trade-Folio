import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tradefolio/core/utils/constants/api_constants.dart';
import 'package:tradefolio/core/utils/constants/text_strings.dart';
import 'package:tradefolio/core/utils/helpers/http_helper.dart';
import 'package:tradefolio/model/company_model.dart';
import 'package:tradefolio/model/company_with_quote_model.dart';
import 'package:tradefolio/model/global_quote_model.dart';
import 'dart:async';

import 'package:tradefolio/view/widgets/snackbars.dart';

class HomeController extends GetxController {
  var searchResults = <CompanyWithQuoteModel>[].obs; // List of unified models
  var isLoading = false.obs;
  var error = ''.obs;
  Timer? _debounce;

//---- Debouncer -----
// Helps to reduce unwanted API calls by providing a delay.

  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isNotEmpty) {
        searchCompanies(query);
      }
    });
  }

//---- Search ----

// --- Function for searching companies
  Future<void> searchCompanies(String keyword) async {
    isLoading.value = true;
    searchResults.clear();

    if (keyword.isEmpty) {
      isLoading.value = false;
      return;
    }

    try {
      final response = await http.get(Uri.parse('$searchUrl$keyword$apiKey'));

      final data = await JHttpHelper.handleHttpResponse(
          response); // Using the helper function

      if (data == null) {
        return; // If the response handling fails, stop further processing.
      }

      // Checking for API rate limit message
      if (data.toString().contains(JTexts.apiLimitResponse)) {
        error.value = JTexts.apiLimitMessage;
        JMessages.snackbarerror(
            title: JTexts.apiLimitTitle, message: error.value);
        // return;
      }

      // Checking if response contains companies
      if (data.containsKey(JTexts.searchResponse) &&
          data[JTexts.searchResponse] is List) {
        final companies = (data[JTexts.searchResponse] as List)
            .map((item) => CompanyModel.fromJson(item))
            .toList();

        if (companies.isNotEmpty) {
          for (var company in companies) {
            final quote = await fetchPrice(company.symbol);
            if (quote != null) {
              // Combine company and quote into a unified model
              final companyWithQuote =
                  CompanyWithQuoteModel.fromCompanyAndQuote(company, quote);
              searchResults.add(companyWithQuote);
            }
          }
        } else {
          error.value = "No matching companies found.";
        }
      }
    } catch (e) {
      JMessages.snackbarerror(title: "${JTexts.eDefault}  $e");
    } finally {
      isLoading.value = false;
    }
  }

// --- Function for fetching the price
  Future<GlobalQuoteModel?> fetchPrice(String symbol) async {
    try {
      final response = await http.get(Uri.parse('$quoteUrl$symbol$apiKey'));

      final data =
          await JHttpHelper.handleHttpResponse(response); //helper function

      if (data != null && data.containsKey('Global Quote')) {
        return GlobalQuoteModel.fromJson(data['Global Quote']);
      } else {
        return null; // If no 'Global Quote' in response, return null
      }
    } catch (e) {
      return null; // In case of exception, return null
    }
  }

  @override
  void onClose() {
    _debounce?.cancel();
    super.onClose();
  }
}
