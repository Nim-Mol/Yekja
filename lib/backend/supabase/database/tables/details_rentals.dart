import '../database.dart';

class DetailsRentalsTable extends SupabaseTable<DetailsRentalsRow> {
  @override
  String get tableName => 'details_rentals';

  @override
  DetailsRentalsRow createRow(Map<String, dynamic> data) =>
      DetailsRentalsRow(data);
}

class DetailsRentalsRow extends SupabaseDataRow {
  DetailsRentalsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DetailsRentalsTable();

  String get postId => getField<String>('post_id')!;
  set postId(String value) => setField<String>('post_id', value);

  String get intend => getField<String>('intend')!;
  set intend(String value) => setField<String>('intend', value);

  String? get rentalType => getField<String>('rental_type');
  set rentalType(String? value) => setField<String>('rental_type', value);

  int? get price => getField<int>('price');
  set price(int? value) => setField<int>('price', value);

  String? get pricePeriod => getField<String>('price_period');
  set pricePeriod(String? value) => setField<String>('price_period', value);

  String? get priceText => getField<String>('price_text');
  set priceText(String? value) => setField<String>('price_text', value);

  bool get isNegotiable => getField<bool>('is_negotiable')!;
  set isNegotiable(bool value) => setField<bool>('is_negotiable', value);

  int? get deposit => getField<int>('deposit');
  set deposit(int? value) => setField<int>('deposit', value);

  String? get depositText => getField<String>('deposit_text');
  set depositText(String? value) => setField<String>('deposit_text', value);

  DateTime? get availableFrom => getField<DateTime>('available_from');
  set availableFrom(DateTime? value) =>
      setField<DateTime>('available_from', value);

  DateTime? get availableUntil => getField<DateTime>('available_until');
  set availableUntil(DateTime? value) =>
      setField<DateTime>('available_until', value);

  int? get totalArea => getField<int>('total_area');
  set totalArea(int? value) => setField<int>('total_area', value);

  bool get furnished => getField<bool>('furnished')!;
  set furnished(bool value) => setField<bool>('furnished', value);

  bool get utilitiesIncluded => getField<bool>('utilities_included')!;
  set utilitiesIncluded(bool value) =>
      setField<bool>('utilities_included', value);

  bool get registrationPossible => getField<bool>('registration_possible')!;
  set registrationPossible(bool value) =>
      setField<bool>('registration_possible', value);
}
