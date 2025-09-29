import '../database.dart';

class UserFavoritesTable extends SupabaseTable<UserFavoritesRow> {
  @override
  String get tableName => 'user_favorites';

  @override
  UserFavoritesRow createRow(Map<String, dynamic> data) =>
      UserFavoritesRow(data);
}

class UserFavoritesRow extends SupabaseDataRow {
  UserFavoritesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserFavoritesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get postId => getField<String>('post_id')!;
  set postId(String value) => setField<String>('post_id', value);
}
