import '../database.dart';

class ViewCarePostDetailsTable extends SupabaseTable<ViewCarePostDetailsRow> {
  @override
  String get tableName => 'view_care_post_details';

  @override
  ViewCarePostDetailsRow createRow(Map<String, dynamic> data) =>
      ViewCarePostDetailsRow(data);
}

class ViewCarePostDetailsRow extends SupabaseDataRow {
  ViewCarePostDetailsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewCarePostDetailsTable();

  String? get careId => getField<String>('care_id');
  set careId(String? value) => setField<String>('care_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get mainCatId => getField<int>('main_cat_id');
  set mainCatId(int? value) => setField<int>('main_cat_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get userCity => getField<String>('user_city');
  set userCity(String? value) => setField<String>('user_city', value);

  String? get userName => getField<String>('user_name');
  set userName(String? value) => setField<String>('user_name', value);

  String? get userAvatar => getField<String>('user_avatar');
  set userAvatar(String? value) => setField<String>('user_avatar', value);

  bool? get yekjaVerified => getField<bool>('YekjaVerified');
  set yekjaVerified(bool? value) => setField<bool>('YekjaVerified', value);

  String? get subCatName => getField<String>('sub_cat_name');
  set subCatName(String? value) => setField<String>('sub_cat_name', value);

  String? get catName => getField<String>('cat_name');
  set catName(String? value) => setField<String>('cat_name', value);

  String? get mainCatName => getField<String>('main_cat_name');
  set mainCatName(String? value) => setField<String>('main_cat_name', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  List<String> get images => getListField<String>('images');
  set images(List<String>? value) => setListField<String>('images', value);

  int? get postLikes => getField<int>('post_likes');
  set postLikes(int? value) => setField<int>('post_likes', value);

  bool? get reported => getField<bool>('reported');
  set reported(bool? value) => setField<bool>('reported', value);
}
