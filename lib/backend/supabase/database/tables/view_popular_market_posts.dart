import '../database.dart';

class ViewPopularMarketPostsTable
    extends SupabaseTable<ViewPopularMarketPostsRow> {
  @override
  String get tableName => 'view_popular_market_posts';

  @override
  ViewPopularMarketPostsRow createRow(Map<String, dynamic> data) =>
      ViewPopularMarketPostsRow(data);
}

class ViewPopularMarketPostsRow extends SupabaseDataRow {
  ViewPopularMarketPostsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewPopularMarketPostsTable();

  String? get marketId => getField<String>('market_id');
  set marketId(String? value) => setField<String>('market_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get mainCatId => getField<int>('main_cat_id');
  set mainCatId(int? value) => setField<int>('main_cat_id', value);

  int? get catId => getField<int>('cat_id');
  set catId(int? value) => setField<int>('cat_id', value);

  String? get catName => getField<String>('cat_name');
  set catName(String? value) => setField<String>('cat_name', value);

  String? get subCatName => getField<String>('sub_cat_name');
  set subCatName(String? value) => setField<String>('sub_cat_name', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  int? get price => getField<int>('price');
  set price(int? value) => setField<int>('price', value);

  String? get priceText => getField<String>('price_text');
  set priceText(String? value) => setField<String>('price_text', value);

  String? get timeUnit => getField<String>('time_unit');
  set timeUnit(String? value) => setField<String>('time_unit', value);

  List<String> get images => getListField<String>('images');
  set images(List<String>? value) => setListField<String>('images', value);

  int? get postLikes => getField<int>('post_likes');
  set postLikes(int? value) => setField<int>('post_likes', value);

  String? get userCity => getField<String>('user_city');
  set userCity(String? value) => setField<String>('user_city', value);
}
