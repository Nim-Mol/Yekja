import '../database.dart';

class ReportedTable extends SupabaseTable<ReportedRow> {
  @override
  String get tableName => 'reported';

  @override
  ReportedRow createRow(Map<String, dynamic> data) => ReportedRow(data);
}

class ReportedRow extends SupabaseDataRow {
  ReportedRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ReportedTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get reason => getField<String>('reason')!;
  set reason(String value) => setField<String>('reason', value);

  String? get userprofileId => getField<String>('userprofile_id');
  set userprofileId(String? value) => setField<String>('userprofile_id', value);

  String get reporter => getField<String>('reporter')!;
  set reporter(String value) => setField<String>('reporter', value);

  bool get isprofile => getField<bool>('isprofile')!;
  set isprofile(bool value) => setField<bool>('isprofile', value);

  String? get postId => getField<String>('post_id');
  set postId(String? value) => setField<String>('post_id', value);

  dynamic get reasonI18n => getField<dynamic>('reason_i18n');
  set reasonI18n(dynamic value) => setField<dynamic>('reason_i18n', value);
}
