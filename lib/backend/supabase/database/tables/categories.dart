import '../database.dart';

class CategoriesTable extends SupabaseTable<CategoriesRow> {
  @override
  String get tableName => 'categories';

  @override
  CategoriesRow createRow(Map<String, dynamic> data) => CategoriesRow(data);
}

class CategoriesRow extends SupabaseDataRow {
  CategoriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CategoriesTable();

  int get catId => getField<int>('cat_id')!;
  set catId(int value) => setField<int>('cat_id', value);

  String get catName => getField<String>('cat_name')!;
  set catName(String value) => setField<String>('cat_name', value);

  int get mainCatId => getField<int>('main_cat_id')!;
  set mainCatId(int value) => setField<int>('main_cat_id', value);

  String get mainCatName => getField<String>('main_cat_name')!;
  set mainCatName(String value) => setField<String>('main_cat_name', value);

  dynamic get catNameI18n => getField<dynamic>('cat_name_i18n');
  set catNameI18n(dynamic value) => setField<dynamic>('cat_name_i18n', value);

  dynamic get mainCatNameI18n => getField<dynamic>('main_cat_name_i18n');
  set mainCatNameI18n(dynamic value) =>
      setField<dynamic>('main_cat_name_i18n', value);
}
