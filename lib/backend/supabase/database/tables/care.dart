import '../database.dart';

class CareTable extends SupabaseTable<CareRow> {
  @override
  String get tableName => 'care';

  @override
  CareRow createRow(Map<String, dynamic> data) => CareRow(data);
}

class CareRow extends SupabaseDataRow {
  CareRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CareTable();

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
}
