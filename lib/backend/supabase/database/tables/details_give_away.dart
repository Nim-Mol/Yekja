import '../database.dart';

class DetailsGiveAwayTable extends SupabaseTable<DetailsGiveAwayRow> {
  @override
  String get tableName => 'details_give_away';

  @override
  DetailsGiveAwayRow createRow(Map<String, dynamic> data) =>
      DetailsGiveAwayRow(data);
}

class DetailsGiveAwayRow extends SupabaseDataRow {
  DetailsGiveAwayRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DetailsGiveAwayTable();

  String get postId => getField<String>('post_id')!;
  set postId(String value) => setField<String>('post_id', value);

  String? get condition => getField<String>('condition');
  set condition(String? value) => setField<String>('condition', value);

  String? get deliveryMethod => getField<String>('delivery_method');
  set deliveryMethod(String? value) =>
      setField<String>('delivery_method', value);

  bool get openForSwap => getField<bool>('open_for_swap')!;
  set openForSwap(bool value) => setField<bool>('open_for_swap', value);

  String? get wishlistText => getField<String>('wishlist_text');
  set wishlistText(String? value) => setField<String>('wishlist_text', value);
}
