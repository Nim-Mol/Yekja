import '../database.dart';

class DeletedMarketTable extends SupabaseTable<DeletedMarketRow> {
  @override
  String get tableName => 'deleted_market';

  @override
  DeletedMarketRow createRow(Map<String, dynamic> data) =>
      DeletedMarketRow(data);
}

class DeletedMarketRow extends SupabaseDataRow {
  DeletedMarketRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DeletedMarketTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  int? get price => getField<int>('price');
  set price(int? value) => setField<int>('price', value);

  List<String> get images => getListField<String>('images');
  set images(List<String>? value) => setListField<String>('images', value);

  bool get reported => getField<bool>('reported')!;
  set reported(bool value) => setField<bool>('reported', value);

  String? get wishlistText => getField<String>('wishlist_text');
  set wishlistText(String? value) => setField<String>('wishlist_text', value);

  int? get subCatId => getField<int>('sub_cat_id');
  set subCatId(int? value) => setField<int>('sub_cat_id', value);

  List<int> get exchangeWishlistId => getListField<int>('exchange_wishlist_id');
  set exchangeWishlistId(List<int>? value) =>
      setListField<int>('exchange_wishlist_id', value);

  int get postLikes => getField<int>('post_likes')!;
  set postLikes(int value) => setField<int>('post_likes', value);

  String? get deliveryMethod => getField<String>('delivery_method');
  set deliveryMethod(String? value) =>
      setField<String>('delivery_method', value);

  String? get priceText => getField<String>('price_text');
  set priceText(String? value) => setField<String>('price_text', value);

  String? get timeUnit => getField<String>('time_unit');
  set timeUnit(String? value) => setField<String>('time_unit', value);

  String get marketId => getField<String>('market_id')!;
  set marketId(String value) => setField<String>('market_id', value);

  DateTime get deletedAt => getField<DateTime>('deleted_at')!;
  set deletedAt(DateTime value) => setField<DateTime>('deleted_at', value);
}
