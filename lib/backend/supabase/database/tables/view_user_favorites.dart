import '../database.dart';

class ViewUserFavoritesTable extends SupabaseTable<ViewUserFavoritesRow> {
  @override
  String get tableName => 'view_user_favorites';

  @override
  ViewUserFavoritesRow createRow(Map<String, dynamic> data) =>
      ViewUserFavoritesRow(data);
}

class ViewUserFavoritesRow extends SupabaseDataRow {
  ViewUserFavoritesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewUserFavoritesTable();

  String? get postId => getField<String>('post_id');
  set postId(String? value) => setField<String>('post_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  int? get postLikes => getField<int>('post_likes');
  set postLikes(int? value) => setField<int>('post_likes', value);

  DateTime? get postCreatedAt => getField<DateTime>('post_created_at');
  set postCreatedAt(DateTime? value) =>
      setField<DateTime>('post_created_at', value);

  List<String> get images => getListField<String>('images');
  set images(List<String>? value) => setListField<String>('images', value);

  String? get userCity => getField<String>('user_city');
  set userCity(String? value) => setField<String>('user_city', value);
}
