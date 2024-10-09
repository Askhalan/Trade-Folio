import 'package:hive/hive.dart';
import 'global_quote_model.dart';
import 'company_with_quote_model.dart';

part 'company_model.g.dart';

@HiveType(typeId: 13)
class CompanyModel {
  @HiveField(0)
  final String symbol;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String region;

  @HiveField(3)
  final String marketOpen;

  @HiveField(4)
  final String marketClose;

  @HiveField(5)
  final String currency;

  @HiveField(6)
  DateTime? lastSyncTime;

  @HiveField(7)
  GlobalQuoteModel? quote; // To store the quote

  CompanyModel({
    required this.symbol,
    required this.name,
    required this.region,
    required this.marketOpen,
    required this.marketClose,
    required this.currency,
    this.quote,
    this.lastSyncTime,
  });

  // Method to update sync time
  void updateSyncTime() {
    lastSyncTime = DateTime.now();
  }

  // Method to update the quote
  void updateQuote(GlobalQuoteModel newQuote) {
    quote = newQuote;
  }

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      symbol: json['1. symbol'],
      name: json['2. name'],
      region: json['4. region'],
      marketOpen: json['5. marketOpen'],
      marketClose: json['6. marketClose'],
      currency: json['8. currency'],
      lastSyncTime: null,
      quote: null,
    );
  }

  // Factory method to include GlobalQuoteModel as part of the constructor
  factory CompanyModel.fromCompanyWithQuote(
      CompanyWithQuoteModel companyWithQuote) {
    return CompanyModel(
      symbol: companyWithQuote.symbol,
      name: companyWithQuote.name,
      region: companyWithQuote.region,
      marketOpen: companyWithQuote.marketOpen,
      marketClose: companyWithQuote.marketClose,
      currency: companyWithQuote.currency,
      // lastSyncTime: null, // Set initial sync time to null

      // Create a GlobalQuoteModel from the companyWithQuote values
      quote: GlobalQuoteModel(
        symbol: companyWithQuote.symbol,
        high: companyWithQuote.high,
        low: companyWithQuote.low,
        price: companyWithQuote.price,
      ),
    );
  }
}