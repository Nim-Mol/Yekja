import '../database.dart';

class EventAttendeesTable extends SupabaseTable<EventAttendeesRow> {
  @override
  String get tableName => 'event_attendees';

  @override
  EventAttendeesRow createRow(Map<String, dynamic> data) =>
      EventAttendeesRow(data);
}

class EventAttendeesRow extends SupabaseDataRow {
  EventAttendeesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EventAttendeesTable();

  String get postId => getField<String>('post_id')!;
  set postId(String value) => setField<String>('post_id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  DateTime get joinedAt => getField<DateTime>('joined_at')!;
  set joinedAt(DateTime value) => setField<DateTime>('joined_at', value);
}
