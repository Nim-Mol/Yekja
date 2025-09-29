import '../database.dart';

class MonitoringLogsTable extends SupabaseTable<MonitoringLogsRow> {
  @override
  String get tableName => 'monitoring_logs';

  @override
  MonitoringLogsRow createRow(Map<String, dynamic> data) =>
      MonitoringLogsRow(data);
}

class MonitoringLogsRow extends SupabaseDataRow {
  MonitoringLogsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MonitoringLogsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String get scrrenName => getField<String>('scrren_name')!;
  set scrrenName(String value) => setField<String>('scrren_name', value);

  DateTime get timestamp => getField<DateTime>('timestamp')!;
  set timestamp(DateTime value) => setField<DateTime>('timestamp', value);

  String? get action => getField<String>('action');
  set action(String? value) => setField<String>('action', value);
}
