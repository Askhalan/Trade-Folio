class CompanyModel {
  final String symbol;
  final String name;

  final String region;
  final String marketOpen;
  final String marketClose;

  final String currency;

  CompanyModel({
    required this.symbol,
    required this.name,
    required this.region,
    required this.marketOpen,
    required this.marketClose,
    required this.currency,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      symbol: json['1. symbol'],
      name: json['2. name'],
      region: json['4. region'],
      marketOpen: json['5. marketOpen'],
      marketClose: json['6. marketClose'],
      currency: json['8. currency'],
    );
  }
}
