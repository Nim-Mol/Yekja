import '../database.dart';

class I18nCodeTable extends SupabaseTable<I18nCodeRow> {
  @override
  String get tableName => 'i18n_code';

  @override
  I18nCodeRow createRow(Map<String, dynamic> data) => I18nCodeRow(data);
}

class I18nCodeRow extends SupabaseDataRow {
  I18nCodeRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => I18nCodeTable();

  String get domain => getField<String>('domain')!;
  set domain(String value) => setField<String>('domain', value);

  String get code => getField<String>('code')!;
  set code(String value) => setField<String>('code', value);

  dynamic get labels => getField<dynamic>('labels')!;
  set labels(dynamic value) => setField<dynamic>('labels', value);
}
