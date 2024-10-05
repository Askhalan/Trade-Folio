import 'package:tradefolio/model/company_model.dart';
import 'package:tradefolio/model/global_quote_model.dart';

class CompanyWithQuoteModel {
  final String symbol;
  final String name;
  final String region;
  final String marketOpen;
  final String marketClose;
  final String currency;

  // From GlobalQuoteModel
  final String high;
  final String low;
  final String price;
  final String volume;
  final String latestTradingDay;
  final String change;

  CompanyWithQuoteModel({
    required this.symbol,
    required this.name,
    required this.region,
    required this.marketOpen,
    required this.marketClose,
    required this.currency,
    required this.high,
    required this.low,
    required this.price,
    required this.volume,
    required this.latestTradingDay,
    required this.change,
  });

  factory CompanyWithQuoteModel.fromCompanyAndQuote(CompanyModel company, GlobalQuoteModel quote) {
    return CompanyWithQuoteModel(
      symbol: company.symbol,
      name: company.name,
      region: company.region,
      marketOpen: company.marketOpen,
      marketClose: company.marketClose,
      currency: company.currency,
      high: quote.high,
      low: quote.low,
      price: quote.price,
      volume: quote.volume,
      latestTradingDay: quote.latestTradingDay,
      change: quote.change,
    );
  }
}