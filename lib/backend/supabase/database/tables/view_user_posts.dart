import '../database.dart';

class ViewUserPostsTable extends SupabaseTable<ViewUserPostsRow> {
  @override
  String get tableName => 'view_user_posts';

  @override
  ViewUserPostsRow createRow(Map<String, dynamic> data) =>
      ViewUserPostsRow(data);
}

class ViewUserPostsRow extends SupabaseDataRow {
  ViewUserPostsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewUserPostsTable();

  int? get mainCatId => getField<int>('main_cat_id');
  set mainCatId(int? value) => setField<int>('main_cat_id', value);

  String? get sourceId => getField<String>('source_id');
  set sourceId(String? value) => setField<String>('source_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get userCity => getField<String>('user_city');
  set userCity(String? value) => setField<String>('user_city', value);

  int? get catId => getField<int>('cat_id');
  set catId(int? value) => setField<int>('cat_id', value);

  String? get catName => getField<String>('cat_name');
  set catName(String? value) => setField<String>('cat_name', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  List<String> get images => getListField<String>('images');
  set images(List<String>? value) => setListField<String>('images', value);

  int? get postLikes => getField<int>('post_likes');
  set postLikes(int? value) => setField<int>('post_likes', value);
}
