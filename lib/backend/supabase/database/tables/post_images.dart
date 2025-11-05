import '../database.dart';

class PostImagesTable extends SupabaseTable<PostImagesRow> {
  @override
  String get tableName => 'post_images';

  @override
  PostImagesRow createRow(Map<String, dynamic> data) => PostImagesRow(data);
}

class PostImagesRow extends SupabaseDataRow {
  PostImagesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PostImagesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get postId => getField<String>('post_id')!;
  set postId(String value) => setField<String>('post_id', value);

  String get imageUrl => getField<String>('image_url')!;
  set imageUrl(String value) => setField<String>('image_url', value);

  int get sortOrder => getField<int>('sort_order')!;
  set sortOrder(int value) => setField<int>('sort_order', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
