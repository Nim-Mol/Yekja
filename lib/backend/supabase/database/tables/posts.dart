import '../database.dart';

class PostsTable extends SupabaseTable<PostsRow> {
  @override
  String get tableName => 'posts';

  @override
  PostsRow createRow(Map<String, dynamic> data) => PostsRow(data);
}

class PostsRow extends SupabaseDataRow {
  PostsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PostsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);

  bool get isExpired => getField<bool>('is_expired')!;
  set isExpired(bool value) => setField<bool>('is_expired', value);

  String get ownerId => getField<String>('owner_id')!;
  set ownerId(String value) => setField<String>('owner_id', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  int get subCatId => getField<int>('sub_cat_id')!;
  set subCatId(int value) => setField<int>('sub_cat_id', value);

  int get postLikes => getField<int>('post_likes')!;
  set postLikes(int value) => setField<int>('post_likes', value);

  bool get reported => getField<bool>('reported')!;
  set reported(bool value) => setField<bool>('reported', value);

  List<String> get images => getListField<String>('images');
  set images(List<String> value) => setListField<String>('images', value);

  int? get catId => getField<int>('cat_id');
  set catId(int? value) => setField<int>('cat_id', value);
}
