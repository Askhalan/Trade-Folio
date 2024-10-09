import 'package:hive/hive.dart';

part 'global_quote_model.g.dart';

@HiveType(typeId: 12)
class GlobalQuoteModel {
  @HiveField(0)
  final String symbol;

  @HiveField(1)
  final String high;

  @HiveField(2)
  final String low;

  @HiveField(3)
   String price;

  GlobalQuoteModel({
    required this.symbol,
    required this.high,
    required this.low,
    required this.price,
  });

  factory GlobalQuoteModel.fromJson(Map<String, dynamic> json) {
    return GlobalQuoteModel(
      symbol: json['01. symbol'],
      high: json['03. high'],
      low: json['04. low'],
      price: json['05. price'],
    );
  }
}