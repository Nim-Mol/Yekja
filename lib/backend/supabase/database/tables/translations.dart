import '../database.dart';

class TranslationsTable extends SupabaseTable<TranslationsRow> {
  @override
  String get tableName => 'translations';

  @override
  TranslationsRow createRow(Map<String, dynamic> data) => TranslationsRow(data);
}

class TranslationsRow extends SupabaseDataRow {
  TranslationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TranslationsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get tableNameField => getField<String>('table_name')!;
  set tableNameField(String value) => setField<String>('table_name', value);

  String get recordId => getField<String>('record_id')!;
  set recordId(String value) => setField<String>('record_id', value);

  String get fieldName => getField<String>('field_name')!;
  set fieldName(String value) => setField<String>('field_name', value);

  String get lang => getField<String>('lang')!;
  set lang(String value) => setField<String>('lang', value);

  String get sourceHash => getField<String>('source_hash')!;
  set sourceHash(String value) => setField<String>('source_hash', value);

  String get translated => getField<String>('translated')!;
  set translated(String value) => setField<String>('translated', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
