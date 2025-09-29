import '../database.dart';

class TriggerLogTable extends SupabaseTable<TriggerLogRow> {
  @override
  String get tableName => 'trigger_log';

  @override
  TriggerLogRow createRow(Map<String, dynamic> data) => TriggerLogRow(data);
}

class TriggerLogRow extends SupabaseDataRow {
  TriggerLogRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TriggerLogTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get triggeredAt => getField<DateTime>('triggered_at');
  set triggeredAt(DateTime? value) => setField<DateTime>('triggered_at', value);

  String? get triggerName => getField<String>('trigger_name');
  set triggerName(String? value) => setField<String>('trigger_name', value);

  String? get tableNameField => getField<String>('table_name');
  set tableNameField(String? value) => setField<String>('table_name', value);

  String? get operation => getField<String>('operation');
  set operation(String? value) => setField<String>('operation', value);

  dynamic get rowData => getField<dynamic>('row_data');
  set rowData(dynamic value) => setField<dynamic>('row_data', value);
}
