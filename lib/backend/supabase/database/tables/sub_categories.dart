import '../database.dart';

class SubCategoriesTable extends SupabaseTable<SubCategoriesRow> {
  @override
  String get tableName => 'sub_categories';

  @override
  SubCategoriesRow createRow(Map<String, dynamic> data) =>
      SubCategoriesRow(data);
}

class SubCategoriesRow extends SupabaseDataRow {
  SubCategoriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SubCategoriesTable();

  String get subCatName => getField<String>('sub_cat_name')!;
  set subCatName(String value) => setField<String>('sub_cat_name', value);

  int get catId => getField<int>('cat_id')!;
  set catId(int value) => setField<int>('cat_id', value);

  String get catName => getField<String>('cat_name')!;
  set catName(String value) => setField<String>('cat_name', value);

  int get mainCatId => getField<int>('main_cat_id')!;
  set mainCatId(int value) => setField<int>('main_cat_id', value);

  String get mainCatName => getField<String>('main_cat_name')!;
  set mainCatName(String value) => setField<String>('main_cat_name', value);

  int? get isProduct => getField<int>('is_product');
  set isProduct(int? value) => setField<int>('is_product', value);

  int get subCatId => getField<int>('sub_cat_id')!;
  set subCatId(int value) => setField<int>('sub_cat_id', value);

  int? get uniqueSubcatId => getField<int>('unique_subcat_id');
  set uniqueSubcatId(int? value) => setField<int>('unique_subcat_id', value);

  dynamic get subCatNameI18n => getField<dynamic>('sub_cat_name_i18n');
  set subCatNameI18n(dynamic value) =>
      setField<dynamic>('sub_cat_name_i18n', value);

  dynamic get catNameI18n => getField<dynamic>('cat_name_i18n');
  set catNameI18n(dynamic value) => setField<dynamic>('cat_name_i18n', value);

  dynamic get mainCatNameI18n => getField<dynamic>('main_cat_name_i18n');
  set mainCatNameI18n(dynamic value) =>
      setField<dynamic>('main_cat_name_i18n', value);
}
