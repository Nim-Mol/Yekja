import '../database.dart';

class MonitoringGuestTable extends SupabaseTable<MonitoringGuestRow> {
  @override
  String get tableName => 'monitoring_guest';

  @override
  MonitoringGuestRow createRow(Map<String, dynamic> data) =>
      MonitoringGuestRow(data);
}

class MonitoringGuestRow extends SupabaseDataRow {
  MonitoringGuestRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MonitoringGuestTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get sessionId => getField<String>('session_id');
  set sessionId(String? value) => setField<String>('session_id', value);

  String? get device => getField<String>('device');
  set device(String? value) => setField<String>('device', value);

  double? get deviceLog => getField<double>('device_log');
  set deviceLog(double? value) => setField<double>('device_log', value);

  bool? get signedUp => getField<bool>('signed_up');
  set signedUp(bool? value) => setField<bool>('signed_up', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get userIP => getField<String>('user_IP');
  set userIP(String? value) => setField<String>('user_IP', value);
}
