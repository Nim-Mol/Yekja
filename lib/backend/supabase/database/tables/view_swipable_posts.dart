import '../database.dart';

class ViewSwipablePostsTable extends SupabaseTable<ViewSwipablePostsRow> {
  @override
  String get tableName => 'view_swipable_posts';

  @override
  ViewSwipablePostsRow createRow(Map<String, dynamic> data) =>
      ViewSwipablePostsRow(data);
}

class ViewSwipablePostsRow extends SupabaseDataRow {
  ViewSwipablePostsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewSwipablePostsTable();

  String? get sourceId => getField<String>('source_id');
  set sourceId(String? value) => setField<String>('source_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  List<String> get images => getListField<String>('images');
  set images(List<String>? value) => setListField<String>('images', value);

  int? get postLikes => getField<int>('post_likes');
  set postLikes(int? value) => setField<int>('post_likes', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  int? get mainCatId => getField<int>('main_cat_id');
  set mainCatId(int? value) => setField<int>('main_cat_id', value);

  String? get mainCatName => getField<String>('main_cat_name');
  set mainCatName(String? value) => setField<String>('main_cat_name', value);

  int? get catId => getField<int>('cat_id');
  set catId(int? value) => setField<int>('cat_id', value);

  String? get catName => getField<String>('cat_name');
  set catName(String? value) => setField<String>('cat_name', value);

  String? get catNameFa => getField<String>('cat_name_fa');
  set catNameFa(String? value) => setField<String>('cat_name_fa', value);

  String? get catNameNl => getField<String>('cat_name_nl');
  set catNameNl(String? value) => setField<String>('cat_name_nl', value);

  String? get detailTable => getField<String>('detail_table');
  set detailTable(String? value) => setField<String>('detail_table', value);

  String? get effectiveColorHex => getField<String>('effective_color_hex');
  set effectiveColorHex(String? value) =>
      setField<String>('effective_color_hex', value);

  String? get effectiveIconImage => getField<String>('effective_icon_image');
  set effectiveIconImage(String? value) =>
      setField<String>('effective_icon_image', value);

  String? get ownerId => getField<String>('owner_id');
  set ownerId(String? value) => setField<String>('owner_id', value);

  String? get userName => getField<String>('user_name');
  set userName(String? value) => setField<String>('user_name', value);

  String? get profileAvatar => getField<String>('profile_avatar');
  set profileAvatar(String? value) => setField<String>('profile_avatar', value);

  bool? get showProfileImage => getField<bool>('show_profile_image');
  set showProfileImage(bool? value) =>
      setField<bool>('show_profile_image', value);
}
