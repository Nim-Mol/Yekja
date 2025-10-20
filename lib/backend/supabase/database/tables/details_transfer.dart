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

  String? get itemType => getField<String>('item_type');
  set itemType(String? value) => setField<String>('item_type', value);

  bool get isDocument => getField<bool>('is_document')!;
  set isDocument(bool value) => setField<bool>('is_document', value);

  String? get contentsDescription => getField<String>('contents_description');
  set contentsDescription(String? value) =>
      setField<String>('contents_description', value);

  double? get weightKg => getField<double>('weight_kg');
  set weightKg(double? value) => setField<double>('weight_kg', value);

  String? get dimensionsText => getField<String>('dimensions_text');
  set dimensionsText(String? value) =>
      setField<String>('dimensions_text', value);

  bool get isFragile => getField<bool>('is_fragile')!;
  set isFragile(bool value) => setField<bool>('is_fragile', value);

  bool get isPerishable => getField<bool>('is_perishable')!;
  set isPerishable(bool value) => setField<bool>('is_perishable', value);

  bool get requiresCustoms => getField<bool>('requires_customs')!;
  set requiresCustoms(bool value) => setField<bool>('requires_customs', value);

  int? get declaredValue => getField<int>('declared_value');
  set declaredValue(int? value) => setField<int>('declared_value', value);

  String? get transferMethod => getField<String>('transfer_method');
  set transferMethod(String? value) =>
      setField<String>('transfer_method', value);

  String? get handoverMethod => getField<String>('handover_method');
  set handoverMethod(String? value) =>
      setField<String>('handover_method', value);

  String? get deliveryMethod => getField<String>('delivery_method');
  set deliveryMethod(String? value) =>
      setField<String>('delivery_method', value);

  DateTime? get travelDate => getField<DateTime>('travel_date');
  set travelDate(DateTime? value) => setField<DateTime>('travel_date', value);

  DateTime? get readyFrom => getField<DateTime>('ready_from');
  set readyFrom(DateTime? value) => setField<DateTime>('ready_from', value);

  DateTime? get deadline => getField<DateTime>('deadline');
  set deadline(DateTime? value) => setField<DateTime>('deadline', value);

  int? get price => getField<int>('price');
  set price(int? value) => setField<int>('price', value);

  String? get priceText => getField<String>('price_text');
  set priceText(String? value) => setField<String>('price_text', value);
}
