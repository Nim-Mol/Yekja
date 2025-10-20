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

  int get subCatId => getField<int>('sub_cat_id')!;
  set subCatId(int value) => setField<int>('sub_cat_id', value);

  int get catId => getField<int>('cat_id')!;
  set catId(int value) => setField<int>('cat_id', value);

  String get subCatName => getField<String>('sub_cat_name')!;
  set subCatName(String value) => setField<String>('sub_cat_name', value);

  String? get subCatNameFa => getField<String>('sub_cat_name_fa');
  set subCatNameFa(String? value) => setField<String>('sub_cat_name_fa', value);

  int? get uniqueSubcatId => getField<int>('unique_subcat_id');
  set uniqueSubcatId(int? value) => setField<int>('unique_subcat_id', value);

  bool get isActive => getField<bool>('is_active')!;
  set isActive(bool value) => setField<bool>('is_active', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
