import '../database.dart';

class ViewSubcategoriesTable extends SupabaseTable<ViewSubcategoriesRow> {
  @override
  String get tableName => 'view_subcategories';

  @override
  ViewSubcategoriesRow createRow(Map<String, dynamic> data) =>
      ViewSubcategoriesRow(data);
}

class ViewSubcategoriesRow extends SupabaseDataRow {
  ViewSubcategoriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewSubcategoriesTable();

  int? get mainCatId => getField<int>('main_cat_id');
  set mainCatId(int? value) => setField<int>('main_cat_id', value);

  String? get mainCatName => getField<String>('main_cat_name');
  set mainCatName(String? value) => setField<String>('main_cat_name', value);

  String? get mainCatNameFa => getField<String>('main_cat_name_fa');
  set mainCatNameFa(String? value) =>
      setField<String>('main_cat_name_fa', value);

  bool? get mainActive => getField<bool>('main_active');
  set mainActive(bool? value) => setField<bool>('main_active', value);

  String? get mainColorHex => getField<String>('main_color_hex');
  set mainColorHex(String? value) => setField<String>('main_color_hex', value);

  String? get mainIconImage => getField<String>('main_icon_image');
  set mainIconImage(String? value) =>
      setField<String>('main_icon_image', value);

  int? get catId => getField<int>('cat_id');
  set catId(int? value) => setField<int>('cat_id', value);

  String? get catName => getField<String>('cat_name');
  set catName(String? value) => setField<String>('cat_name', value);

  String? get catNameFa => getField<String>('cat_name_fa');
  set catNameFa(String? value) => setField<String>('cat_name_fa', value);

  bool? get catActive => getField<bool>('cat_active');
  set catActive(bool? value) => setField<bool>('cat_active', value);

  String? get catColorHex => getField<String>('cat_color_hex');
  set catColorHex(String? value) => setField<String>('cat_color_hex', value);

  String? get catIconImage => getField<String>('cat_icon_image');
  set catIconImage(String? value) => setField<String>('cat_icon_image', value);

  int? get subCatId => getField<int>('sub_cat_id');
  set subCatId(int? value) => setField<int>('sub_cat_id', value);

  String? get subCatName => getField<String>('sub_cat_name');
  set subCatName(String? value) => setField<String>('sub_cat_name', value);

  String? get subCatNameFa => getField<String>('sub_cat_name_fa');
  set subCatNameFa(String? value) => setField<String>('sub_cat_name_fa', value);

  int? get uniqueSubcatId => getField<int>('unique_subcat_id');
  set uniqueSubcatId(int? value) => setField<int>('unique_subcat_id', value);

  bool? get subActive => getField<bool>('sub_active');
  set subActive(bool? value) => setField<bool>('sub_active', value);

  String? get effectiveColorHex => getField<String>('effective_color_hex');
  set effectiveColorHex(String? value) =>
      setField<String>('effective_color_hex', value);

  String? get effectiveIconImage => getField<String>('effective_icon_image');
  set effectiveIconImage(String? value) =>
      setField<String>('effective_icon_image', value);

  String? get detailTable => getField<String>('detail_table');
  set detailTable(String? value) => setField<String>('detail_table', value);
}
