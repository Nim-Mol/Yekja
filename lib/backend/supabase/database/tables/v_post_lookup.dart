import '../database.dart';

class VPostLookupTable extends SupabaseTable<VPostLookupRow> {
  @override
  String get tableName => 'v_post_lookup';

  @override
  VPostLookupRow createRow(Map<String, dynamic> data) => VPostLookupRow(data);
}

class VPostLookupRow extends SupabaseDataRow {
  VPostLookupRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VPostLookupTable();

  String? get postId => getField<String>('post_id');
  set postId(String? value) => setField<String>('post_id', value);

  String? get postSource => getField<String>('post_source');
  set postSource(String? value) => setField<String>('post_source', value);

  bool? get postDeleted => getField<bool>('post_deleted');
  set postDeleted(bool? value) => setField<bool>('post_deleted', value);

  String? get postOwnerId => getField<String>('post_owner_id');
  set postOwnerId(String? value) => setField<String>('post_owner_id', value);

  String? get postTitle => getField<String>('post_title');
  set postTitle(String? value) => setField<String>('post_title', value);

  String? get postImage => getField<String>('post_image');
  set postImage(String? value) => setField<String>('post_image', value);
}
