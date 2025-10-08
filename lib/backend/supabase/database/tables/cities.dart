import '../database.dart';

class CitiesTable extends SupabaseTable<CitiesRow> {
  @override
  String get tableName => 'cities';

  @override
  CitiesRow createRow(Map<String, dynamic> data) => CitiesRow(data);
}

class CitiesRow extends SupabaseDataRow {
  CitiesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CitiesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get provinceId => getField<int>('province_id');
  set provinceId(int? value) => setField<int>('province_id', value);

  String? get province => getField<String>('province');
  set province(String? value) => setField<String>('province', value);

  dynamic get nameI18n => getField<dynamic>('name_i18n');
  set nameI18n(dynamic value) => setField<dynamic>('name_i18n', value);

  dynamic get provinceI18n => getField<dynamic>('province_i18n');
  set provinceI18n(dynamic value) => setField<dynamic>('province_i18n', value);
}
