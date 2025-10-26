import '../database.dart';

class CommunityShoutoutTable extends SupabaseTable<CommunityShoutoutRow> {
  @override
  String get tableName => 'community_shoutout';

  @override
  CommunityShoutoutRow createRow(Map<String, dynamic> data) =>
      CommunityShoutoutRow(data);
}

class CommunityShoutoutRow extends SupabaseDataRow {
  CommunityShoutoutRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CommunityShoutoutTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get description => getField<String>('description')!;
  set description(String value) => setField<String>('description', value);

  int? get likes => getField<int>('likes');
  set likes(int? value) => setField<int>('likes', value);

  String? get header => getField<String>('header');
  set header(String? value) => setField<String>('header', value);
}
