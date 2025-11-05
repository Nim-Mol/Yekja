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

  int get mainCatId => getField<int>('main_cat_id')!;
  set mainCatId(int value) => setField<int>('main_cat_id', value);

  String get catName => getField<String>('cat_name')!;
  set catName(String value) => setField<String>('cat_name', value);

  String? get catNameFa => getField<String>('cat_name_fa');
  set catNameFa(String? value) => setField<String>('cat_name_fa', value);

  String? get colorHex => getField<String>('color_hex');
  set colorHex(String? value) => setField<String>('color_hex', value);

  String? get iconImage => getField<String>('icon_image');
  set iconImage(String? value) => setField<String>('icon_image', value);

  String? get detailTable => getField<String>('detail_table');
  set detailTable(String? value) => setField<String>('detail_table', value);

  bool get isActive => getField<bool>('is_active')!;
  set isActive(bool value) => setField<bool>('is_active', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get colorFillHex => getField<String>('color_fill_hex');
  set colorFillHex(String? value) => setField<String>('color_fill_hex', value);
}
