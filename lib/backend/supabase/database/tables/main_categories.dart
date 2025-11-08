import '../database.dart';

class MainCategoriesTable extends SupabaseTable<MainCategoriesRow> {
  @override
  String get tableName => 'main_categories';

  @override
  MainCategoriesRow createRow(Map<String, dynamic> data) =>
      MainCategoriesRow(data);
}

class MainCategoriesRow extends SupabaseDataRow {
  MainCategoriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MainCategoriesTable();

  int get mainCatId => getField<int>('main_cat_id')!;
  set mainCatId(int value) => setField<int>('main_cat_id', value);

  String get mainCatName => getField<String>('main_cat_name')!;
  set mainCatName(String value) => setField<String>('main_cat_name', value);

  String? get mainCatNameFa => getField<String>('main_cat_name_fa');
  set mainCatNameFa(String? value) =>
      setField<String>('main_cat_name_fa', value);

  String? get colorHex => getField<String>('color_hex');
  set colorHex(String? value) => setField<String>('color_hex', value);

  String? get iconImage => getField<String>('icon_image');
  set iconImage(String? value) => setField<String>('icon_image', value);

  bool get isActive => getField<bool>('is_active')!;
  set isActive(bool value) => setField<bool>('is_active', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get colorFillHex => getField<String>('color_fill_hex');
  set colorFillHex(String? value) => setField<String>('color_fill_hex', value);

  String get mainCatCode => getField<String>('main_cat_code')!;
  set mainCatCode(String value) => setField<String>('main_cat_code', value);

  String? get mainCatNameNl => getField<String>('main_cat_name_nl');
  set mainCatNameNl(String? value) =>
      setField<String>('main_cat_name_nl', value);
}
