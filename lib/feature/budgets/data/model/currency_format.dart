class CurrencyFormat {
  String isoCode;
  String exampleFormat;
  int decimalDigits;
  String decimalSeparator;
  bool symbolFirst;
  String groupSeparator;
  String currencySymbol;
  bool displaySymbol;

  CurrencyFormat({this.isoCode,
    this.exampleFormat,
    this.decimalDigits,
    this.decimalSeparator,
    this.symbolFirst,
    this.groupSeparator,
    this.currencySymbol,
    this.displaySymbol});

  CurrencyFormat.fromJson(Map<String, dynamic> json) {
    isoCode = json['iso_code'];
    exampleFormat = json['example_format'];
    decimalDigits = json['decimal_digits'];
    decimalSeparator = json['decimal_separator'];
    symbolFirst = json['symbol_first'];
    groupSeparator = json['group_separator'];
    currencySymbol = json['currency_symbol'];
    displaySymbol = json['display_symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso_code'] = this.isoCode;
    data['example_format'] = this.exampleFormat;
    data['decimal_digits'] = this.decimalDigits;
    data['decimal_separator'] = this.decimalSeparator;
    data['symbol_first'] = this.symbolFirst;
    data['group_separator'] = this.groupSeparator;
    data['currency_symbol'] = this.currencySymbol;
    data['display_symbol'] = this.displaySymbol;
    return data;
  }
}