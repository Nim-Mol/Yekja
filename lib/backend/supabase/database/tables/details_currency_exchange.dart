import '../database.dart';

class DetailsCurrencyExchangeTable
    extends SupabaseTable<DetailsCurrencyExchangeRow> {
  @override
  String get tableName => 'details_currency_exchange';

  @override
  DetailsCurrencyExchangeRow createRow(Map<String, dynamic> data) =>
      DetailsCurrencyExchangeRow(data);
}

class DetailsCurrencyExchangeRow extends SupabaseDataRow {
  DetailsCurrencyExchangeRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DetailsCurrencyExchangeTable();

  String get postId => getField<String>('post_id')!;
  set postId(String value) => setField<String>('post_id', value);

  String? get currency => getField<String>('currency');
  set currency(String? value) => setField<String>('currency', value);

  double? get amount => getField<double>('amount');
  set amount(double? value) => setField<double>('amount', value);

  String? get method => getField<String>('method');
  set method(String? value) => setField<String>('method', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  String? get priceText => getField<String>('price_text');
  set priceText(String? value) => setField<String>('price_text', value);

  bool get isNegotiable => getField<bool>('is_negotiable')!;
  set isNegotiable(bool value) => setField<bool>('is_negotiable', value);

  bool get allowPartial => getField<bool>('allow_partial')!;
  set allowPartial(bool value) => setField<bool>('allow_partial', value);

  String? get intend => getField<String>('intend');
  set intend(String? value) => setField<String>('intend', value);
}
