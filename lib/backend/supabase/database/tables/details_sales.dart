import '../database.dart';

class DetailsSalesTable extends SupabaseTable<DetailsSalesRow> {
  @override
  String get tableName => 'details_sales';

  @override
  DetailsSalesRow createRow(Map<String, dynamic> data) => DetailsSalesRow(data);
}

class DetailsSalesRow extends SupabaseDataRow {
  DetailsSalesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DetailsSalesTable();

  String get postId => getField<String>('post_id')!;
  set postId(String value) => setField<String>('post_id', value);

  int? get price => getField<int>('price');
  set price(int? value) => setField<int>('price', value);

  String? get priceText => getField<String>('price_text');
  set priceText(String? value) => setField<String>('price_text', value);

  String? get condition => getField<String>('condition');
  set condition(String? value) => setField<String>('condition', value);

  String? get deliveryMethod => getField<String>('delivery_method');
  set deliveryMethod(String? value) =>
      setField<String>('delivery_method', value);

  bool get isFreeDelivery => getField<bool>('is_free_delivery')!;
  set isFreeDelivery(bool value) => setField<bool>('is_free_delivery', value);

  bool get openForSwap => getField<bool>('open_for_swap')!;
  set openForSwap(bool value) => setField<bool>('open_for_swap', value);

  String? get wishlistText => getField<String>('wishlist_text');
  set wishlistText(String? value) => setField<String>('wishlist_text', value);
}
