class GlobalQuoteModel {
  final String symbol;
  final String high;
  final String low;
  final String price;
  final String volume;
  final String latestTradingDay;
  final String change;

  GlobalQuoteModel({
    required this.symbol,
    required this.high,
    required this.low,
    required this.price,
    required this.volume,
    required this.latestTradingDay,
    required this.change,
  });

  factory GlobalQuoteModel.fromJson(Map<String, dynamic> json) {
    return GlobalQuoteModel(
      symbol: json['01. symbol'],
      high: json['03. high'],
      low: json['04. low'],
      price: json['05. price'],
      volume: json['06. volume'],
      latestTradingDay: json['07. latest trading day'],
      change: json['09. change'],
    );
  }
}
