import '../database.dart';

class DetailsCareAndAssistanceTable
    extends SupabaseTable<DetailsCareAndAssistanceRow> {
  @override
  String get tableName => 'details_care_and_assistance';

  @override
  DetailsCareAndAssistanceRow createRow(Map<String, dynamic> data) =>
      DetailsCareAndAssistanceRow(data);
}

class DetailsCareAndAssistanceRow extends SupabaseDataRow {
  DetailsCareAndAssistanceRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DetailsCareAndAssistanceTable();

  String get postId => getField<String>('post_id')!;
  set postId(String value) => setField<String>('post_id', value);

  String get intend => getField<String>('intend')!;
  set intend(String value) => setField<String>('intend', value);

  DateTime? get deadline => getField<DateTime>('deadline');
  set deadline(DateTime? value) => setField<DateTime>('deadline', value);

  String? get compensationType => getField<String>('compensation_type');
  set compensationType(String? value) =>
      setField<String>('compensation_type', value);

  String? get locationMode => getField<String>('location_mode');
  set locationMode(String? value) => setField<String>('location_mode', value);

  int? get radiusKm => getField<int>('radius_km');
  set radiusKm(int? value) => setField<int>('radius_km', value);

  int? get durationMin => getField<int>('duration_min');
  set durationMin(int? value) => setField<int>('duration_min', value);

  int? get capacity => getField<int>('capacity');
  set capacity(int? value) => setField<int>('capacity', value);
}
