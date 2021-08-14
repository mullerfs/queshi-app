class Asset {
  final int id;
  final String operation;
  final String ticker;
  final String ticker_type;
  final String strategy;
  final double amount;
  final double entry_price;
  final String entry_date;
  final String currency;
  final String exchange;
  final String house;

  Asset(
      {required this.id,
      required this.operation,
      required this.ticker,
      required this.ticker_type,
      required this.strategy,
      required this.amount,
      required this.entry_price,
      required this.entry_date,
      required this.currency,
      required this.exchange,
      required this.house});

  double get entry_amount {
    return amount * entry_price;
  }
}
