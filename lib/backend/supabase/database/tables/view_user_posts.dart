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

  int? get catId => getField<int>('cat_id');
  set catId(int? value) => setField<int>('cat_id', value);

  String? get catName => getField<String>('cat_name');
  set catName(String? value) => setField<String>('cat_name', value);

  String? get detailTable => getField<String>('detail_table');
  set detailTable(String? value) => setField<String>('detail_table', value);

  int? get subCatId => getField<int>('sub_cat_id');
  set subCatId(int? value) => setField<int>('sub_cat_id', value);

  String? get subCatName => getField<String>('sub_cat_name');
  set subCatName(String? value) => setField<String>('sub_cat_name', value);

  String? get sourceId => getField<String>('source_id');
  set sourceId(String? value) => setField<String>('source_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  bool? get isExpired => getField<bool>('is_expired');
  set isExpired(bool? value) => setField<bool>('is_expired', value);

  String? get userName => getField<String>('user_name');
  set userName(String? value) => setField<String>('user_name', value);

  String? get userAvatar => getField<String>('user_avatar');
  set userAvatar(String? value) => setField<String>('user_avatar', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  List<String> get images => getListField<String>('images');
  set images(List<String>? value) => setListField<String>('images', value);

  bool? get hasImages => getField<bool>('has_images');
  set hasImages(bool? value) => setField<bool>('has_images', value);

  int? get postLikes => getField<int>('post_likes');
  set postLikes(int? value) => setField<int>('post_likes', value);

  String? get effectiveColorHex => getField<String>('effective_color_hex');
  set effectiveColorHex(String? value) =>
      setField<String>('effective_color_hex', value);

  String? get effectiveIconImage => getField<String>('effective_icon_image');
  set effectiveIconImage(String? value) =>
      setField<String>('effective_icon_image', value);
}
