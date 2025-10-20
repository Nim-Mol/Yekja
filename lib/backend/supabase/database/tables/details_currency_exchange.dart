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

  String? get offeredCurrency => getField<String>('offered_currency');
  set offeredCurrency(String? value) =>
      setField<String>('offered_currency', value);

  double? get offeredAmount => getField<double>('offered_amount');
  set offeredAmount(double? value) => setField<double>('offered_amount', value);

  String? get requestedCurrency => getField<String>('requested_currency');
  set requestedCurrency(String? value) =>
      setField<String>('requested_currency', value);

  double? get requestedAmount => getField<double>('requested_amount');
  set requestedAmount(double? value) =>
      setField<double>('requested_amount', value);

  double? get rate => getField<double>('rate');
  set rate(double? value) => setField<double>('rate', value);

  String? get rateText => getField<String>('rate_text');
  set rateText(String? value) => setField<String>('rate_text', value);

  bool? get feeIncluded => getField<bool>('fee_included');
  set feeIncluded(bool? value) => setField<bool>('fee_included', value);

  bool? get allowPartial => getField<bool>('allow_partial');
  set allowPartial(bool? value) => setField<bool>('allow_partial', value);

  String? get method => getField<String>('method');
  set method(String? value) => setField<String>('method', value);
}
