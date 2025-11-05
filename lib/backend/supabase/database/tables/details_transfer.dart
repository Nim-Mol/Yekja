import '../database.dart';

class DetailsTransferTable extends SupabaseTable<DetailsTransferRow> {
  @override
  String get tableName => 'details_transfer';

  @override
  DetailsTransferRow createRow(Map<String, dynamic> data) =>
      DetailsTransferRow(data);
}

class DetailsTransferRow extends SupabaseDataRow {
  DetailsTransferRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DetailsTransferTable();

  String get postId => getField<String>('post_id')!;
  set postId(String value) => setField<String>('post_id', value);

  String get intend => getField<String>('intend')!;
  set intend(String value) => setField<String>('intend', value);

  String get originCountry => getField<String>('origin_country')!;
  set originCountry(String value) => setField<String>('origin_country', value);

  String? get originCity => getField<String>('origin_city');
  set originCity(String? value) => setField<String>('origin_city', value);

  String get destinationCountry => getField<String>('destination_country')!;
  set destinationCountry(String value) =>
      setField<String>('destination_country', value);

  String? get destinationCity => getField<String>('destination_city');
  set destinationCity(String? value) =>
      setField<String>('destination_city', value);

  bool get isDocument => getField<bool>('is_document')!;
  set isDocument(bool value) => setField<bool>('is_document', value);

  String? get weightKg => getField<String>('weight_kg');
  set weightKg(String? value) => setField<String>('weight_kg', value);

  String? get dimensionsText => getField<String>('dimensions_text');
  set dimensionsText(String? value) =>
      setField<String>('dimensions_text', value);

  bool get isFragile => getField<bool>('is_fragile')!;
  set isFragile(bool value) => setField<bool>('is_fragile', value);

  DateTime? get travelDate => getField<DateTime>('travel_date');
  set travelDate(DateTime? value) => setField<DateTime>('travel_date', value);

  DateTime? get deadline => getField<DateTime>('deadline');
  set deadline(DateTime? value) => setField<DateTime>('deadline', value);

  int? get price => getField<int>('price');
  set price(int? value) => setField<int>('price', value);

  String? get priceText => getField<String>('price_text');
  set priceText(String? value) => setField<String>('price_text', value);

  bool get isNegotiable => getField<bool>('is_negotiable')!;
  set isNegotiable(bool value) => setField<bool>('is_negotiable', value);
}
