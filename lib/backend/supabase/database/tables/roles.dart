import '../database.dart';

class RolesTable extends SupabaseTable<RolesRow> {
  @override
  String get tableName => 'roles';

  @override
  RolesRow createRow(Map<String, dynamic> data) => RolesRow(data);
}

class RolesRow extends SupabaseDataRow {
  RolesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RolesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get key => getField<String>('key')!;
  set key(String value) => setField<String>('key', value);

  String get label => getField<String>('label')!;
  set label(String value) => setField<String>('label', value);
}
