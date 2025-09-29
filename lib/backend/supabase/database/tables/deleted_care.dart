import '../database.dart';

class DeletedCareTable extends SupabaseTable<DeletedCareRow> {
  @override
  String get tableName => 'deleted_care';

  @override
  DeletedCareRow createRow(Map<String, dynamic> data) => DeletedCareRow(data);
}

class DeletedCareRow extends SupabaseDataRow {
  DeletedCareRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DeletedCareTable();

  String get careId => getField<String>('care_id')!;
  set careId(String value) => setField<String>('care_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  List<String> get images => getListField<String>('images');
  set images(List<String>? value) => setListField<String>('images', value);

  bool get reported => getField<bool>('reported')!;
  set reported(bool value) => setField<bool>('reported', value);

  int? get subCatId => getField<int>('sub_cat_id');
  set subCatId(int? value) => setField<int>('sub_cat_id', value);

  int get postLikes => getField<int>('post_likes')!;
  set postLikes(int value) => setField<int>('post_likes', value);

  DateTime get deletedAt => getField<DateTime>('deleted_at')!;
  set deletedAt(DateTime value) => setField<DateTime>('deleted_at', value);
}
