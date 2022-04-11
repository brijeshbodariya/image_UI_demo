class RadiologyTests {
  final String _title;
  final String _subtitle;
  final String _description;
  final String _offer;
  final String _mrp;
  final String _price;
  final String _offerPrice;
  final String _add;

  RadiologyTests(this._title, this._subtitle, this._description, this._offer,
      this._mrp, this._price, this._offerPrice, this._add);

  String get title => _title;
  String get subtitle => _subtitle;
  String get description => _description;
  String get offer => _offer;
  String get mrp => _mrp;
  String get price => _price;
  String get offerPrice => _offerPrice;
  String get add => _add;
}
