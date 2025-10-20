import '../database.dart';

class ViewTopSubcategoriesTable extends SupabaseTable<ViewTopSubcategoriesRow> {
  @override
  String get tableName => 'view_top_subcategories';

  @override
  ViewTopSubcategoriesRow createRow(Map<String, dynamic> data) =>
      ViewTopSubcategoriesRow(data);
}

class ViewTopSubcategoriesRow extends SupabaseDataRow {
  ViewTopSubcategoriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewTopSubcategoriesTable();

  int? get mainCatId => getField<int>('main_cat_id');
  set mainCatId(int? value) => setField<int>('main_cat_id', value);

  String? get mainCatName => getField<String>('main_cat_name');
  set mainCatName(String? value) => setField<String>('main_cat_name', value);

  int? get catId => getField<int>('cat_id');
  set catId(int? value) => setField<int>('cat_id', value);

  String? get catName => getField<String>('cat_name');
  set catName(String? value) => setField<String>('cat_name', value);

  String? get detailTable => getField<String>('detail_table');
  set detailTable(String? value) => setField<String>('detail_table', value);

  int? get subCatId => getField<int>('sub_cat_id');
  set subCatId(int? value) => setField<int>('sub_cat_id', value);

  int? get uniqueSubcatId => getField<int>('unique_subcat_id');
  set uniqueSubcatId(int? value) => setField<int>('unique_subcat_id', value);

  String? get subCatName => getField<String>('sub_cat_name');
  set subCatName(String? value) => setField<String>('sub_cat_name', value);

  int? get subPostCount => getField<int>('sub_post_count');
  set subPostCount(int? value) => setField<int>('sub_post_count', value);

  int? get totalLikes => getField<int>('total_likes');
  set totalLikes(int? value) => setField<int>('total_likes', value);

  int? get catPostCount => getField<int>('cat_post_count');
  set catPostCount(int? value) => setField<int>('cat_post_count', value);

  int? get catPostLikes => getField<int>('cat_post_likes');
  set catPostLikes(int? value) => setField<int>('cat_post_likes', value);

  String? get effectiveColorHex => getField<String>('effective_color_hex');
  set effectiveColorHex(String? value) =>
      setField<String>('effective_color_hex', value);

  String? get effectiveIconImage => getField<String>('effective_icon_image');
  set effectiveIconImage(String? value) =>
      setField<String>('effective_icon_image', value);
}
