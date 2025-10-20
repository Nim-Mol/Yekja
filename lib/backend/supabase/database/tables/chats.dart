import '../database.dart';

class ChatsTable extends SupabaseTable<ChatsRow> {
  @override
  String get tableName => 'chats';

  @override
  ChatsRow createRow(Map<String, dynamic> data) => ChatsRow(data);
}

class ChatsRow extends SupabaseDataRow {
  ChatsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChatsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get sender => getField<String>('sender')!;
  set sender(String value) => setField<String>('sender', value);

  String get recipient => getField<String>('recipient')!;
  set recipient(String value) => setField<String>('recipient', value);

  String get postId => getField<String>('post_id')!;
  set postId(String value) => setField<String>('post_id', value);

  String get senderName => getField<String>('sender_name')!;
  set senderName(String value) => setField<String>('sender_name', value);

  bool? get recipientOnline => getField<bool>('recipient_online');
  set recipientOnline(bool? value) => setField<bool>('recipient_online', value);

  DateTime? get senderDeletedAt => getField<DateTime>('sender_deleted_at');
  set senderDeletedAt(DateTime? value) =>
      setField<DateTime>('sender_deleted_at', value);

  DateTime? get recipientDeletedAt =>
      getField<DateTime>('recipient_deleted_at');
  set recipientDeletedAt(DateTime? value) =>
      setField<DateTime>('recipient_deleted_at', value);

  DateTime? get bumpedAt => getField<DateTime>('bumped_at');
  set bumpedAt(DateTime? value) => setField<DateTime>('bumped_at', value);
}
