class HealthCheckUpHome {
  final String _title;
  final String _subtitle;
  final String _imageUrl;
  final String _rating;
  final String _ratingTitle;
  final String _offer;
  final String _mrp;
  final String _price;
  final String _offerPrice;
  final String _add;

  HealthCheckUpHome(
      this._title,
      this._subtitle,
      this._imageUrl,
      this._rating,
      this._ratingTitle,
      this._offer,
      this._mrp,
      this._price,
      this._offerPrice,
      this._add);

  String get title => _title;
  String get subtitle => _subtitle;
  String get imageUrl => _imageUrl;
  String get rating => _rating;
  String get ratingTitle => _ratingTitle;
  String get offer => _offer;
  String get mrp => _mrp;
  String get price => _price;
  String get offerPrice => _offerPrice;
  String get add => _add;
}
