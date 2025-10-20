import '../database.dart';

class DeletionQueueTable extends SupabaseTable<DeletionQueueRow> {
  @override
  String get tableName => 'deletion_queue';

  @override
  DeletionQueueRow createRow(Map<String, dynamic> data) =>
      DeletionQueueRow(data);
}

class DeletionQueueRow extends SupabaseDataRow {
  DeletionQueueRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DeletionQueueTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  DateTime? get queuedAt => getField<DateTime>('queued_at');
  set queuedAt(DateTime? value) => setField<DateTime>('queued_at', value);

  DateTime? get processedAt => getField<DateTime>('processed_at');
  set processedAt(DateTime? value) => setField<DateTime>('processed_at', value);
}
