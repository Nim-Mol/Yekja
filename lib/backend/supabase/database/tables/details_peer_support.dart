import '../database.dart';

class DetailsPeerSupportTable extends SupabaseTable<DetailsPeerSupportRow> {
  @override
  String get tableName => 'details_peer_support';

  @override
  DetailsPeerSupportRow createRow(Map<String, dynamic> data) =>
      DetailsPeerSupportRow(data);
}

class DetailsPeerSupportRow extends SupabaseDataRow {
  DetailsPeerSupportRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DetailsPeerSupportTable();

  String get postId => getField<String>('post_id')!;
  set postId(String value) => setField<String>('post_id', value);

  String get intend => getField<String>('intend')!;
  set intend(String value) => setField<String>('intend', value);

  DateTime? get deadline => getField<DateTime>('deadline');
  set deadline(DateTime? value) => setField<DateTime>('deadline', value);

  String? get compensationType => getField<String>('compensation_type');
  set compensationType(String? value) =>
      setField<String>('compensation_type', value);
}
