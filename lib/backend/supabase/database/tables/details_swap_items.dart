import '../database.dart';

class DetailsSwapItemsTable extends SupabaseTable<DetailsSwapItemsRow> {
  @override
  String get tableName => 'details_swap_items';

  @override
  DetailsSwapItemsRow createRow(Map<String, dynamic> data) =>
      DetailsSwapItemsRow(data);
}

class DetailsSwapItemsRow extends SupabaseDataRow {
  DetailsSwapItemsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DetailsSwapItemsTable();

  String get postId => getField<String>('post_id')!;
  set postId(String value) => setField<String>('post_id', value);

  bool get openForSwap => getField<bool>('open_for_swap')!;
  set openForSwap(bool value) => setField<bool>('open_for_swap', value);

  String? get wishlistText => getField<String>('wishlist_text');
  set wishlistText(String? value) => setField<String>('wishlist_text', value);

  String? get deliveryMethod => getField<String>('delivery_method');
  set deliveryMethod(String? value) =>
      setField<String>('delivery_method', value);

  int? get price => getField<int>('price');
  set price(int? value) => setField<int>('price', value);

  String? get priceText => getField<String>('price_text');
  set priceText(String? value) => setField<String>('price_text', value);

  String? get priceUnit => getField<String>('price_unit');
  set priceUnit(String? value) => setField<String>('price_unit', value);

  bool get acceptAlternatives => getField<bool>('accept_alternatives')!;
  set acceptAlternatives(bool value) =>
      setField<bool>('accept_alternatives', value);

  bool get allowCashAdjustment => getField<bool>('allow_cash_adjustment')!;
  set allowCashAdjustment(bool value) =>
      setField<bool>('allow_cash_adjustment', value);
}
