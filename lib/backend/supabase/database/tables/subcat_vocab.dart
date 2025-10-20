import '../database.dart';

class SubcatVocabTable extends SupabaseTable<SubcatVocabRow> {
  @override
  String get tableName => 'subcat_vocab';

  @override
  SubcatVocabRow createRow(Map<String, dynamic> data) => SubcatVocabRow(data);
}

class SubcatVocabRow extends SupabaseDataRow {
  SubcatVocabRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SubcatVocabTable();

  int get uniqueSubcatId => getField<int>('unique_subcat_id')!;
  set uniqueSubcatId(int value) => setField<int>('unique_subcat_id', value);

  String get subCatName => getField<String>('sub_cat_name')!;
  set subCatName(String value) => setField<String>('sub_cat_name', value);
}
