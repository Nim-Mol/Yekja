import '../database.dart';

class ViewPostSearchFaTable extends SupabaseTable<ViewPostSearchFaRow> {
  @override
  String get tableName => 'view_post_search_fa';

  @override
  ViewPostSearchFaRow createRow(Map<String, dynamic> data) =>
      ViewPostSearchFaRow(data);
}

class ViewPostSearchFaRow extends SupabaseDataRow {
  ViewPostSearchFaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewPostSearchFaTable();

  String? get postId => getField<String>('post_id');
  set postId(String? value) => setField<String>('post_id', value);

  String? get ownerId => getField<String>('owner_id');
  set ownerId(String? value) => setField<String>('owner_id', value);

  String? get userName => getField<String>('user_name');
  set userName(String? value) => setField<String>('user_name', value);

  bool? get yekjaVerified => getField<bool>('yekja_verified');
  set yekjaVerified(bool? value) => setField<bool>('yekja_verified', value);

  String? get profileAvatar => getField<String>('profile_avatar');
  set profileAvatar(String? value) => setField<String>('profile_avatar', value);

  double? get review => getField<double>('review');
  set review(double? value) => setField<double>('review', value);

  int? get ratings => getField<int>('ratings');
  set ratings(int? value) => setField<int>('ratings', value);

  String? get detailTable => getField<String>('detail_table');
  set detailTable(String? value) => setField<String>('detail_table', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  List<String> get images => getListField<String>('images');
  set images(List<String>? value) => setListField<String>('images', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  int? get cityId => getField<int>('city_id');
  set cityId(int? value) => setField<int>('city_id', value);

  int? get postLikes => getField<int>('post_likes');
  set postLikes(int? value) => setField<int>('post_likes', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get subCatId => getField<int>('sub_cat_id');
  set subCatId(int? value) => setField<int>('sub_cat_id', value);

  int? get uniqueSubcatId => getField<int>('unique_subcat_id');
  set uniqueSubcatId(int? value) => setField<int>('unique_subcat_id', value);

  String? get subCatName => getField<String>('sub_cat_name');
  set subCatName(String? value) => setField<String>('sub_cat_name', value);

  String? get subCatCode => getField<String>('sub_cat_code');
  set subCatCode(String? value) => setField<String>('sub_cat_code', value);

  int? get catId => getField<int>('cat_id');
  set catId(int? value) => setField<int>('cat_id', value);

  String? get catName => getField<String>('cat_name');
  set catName(String? value) => setField<String>('cat_name', value);

  String? get catCode => getField<String>('cat_code');
  set catCode(String? value) => setField<String>('cat_code', value);

  int? get mainCatId => getField<int>('main_cat_id');
  set mainCatId(int? value) => setField<int>('main_cat_id', value);

  String? get mainCatName => getField<String>('main_cat_name');
  set mainCatName(String? value) => setField<String>('main_cat_name', value);

  String? get mainCatCode => getField<String>('main_cat_code');
  set mainCatCode(String? value) => setField<String>('main_cat_code', value);

  String? get effectiveColorHex => getField<String>('effective_color_hex');
  set effectiveColorHex(String? value) =>
      setField<String>('effective_color_hex', value);

  String? get effectiveIconImage => getField<String>('effective_icon_image');
  set effectiveIconImage(String? value) =>
      setField<String>('effective_icon_image', value);

  dynamic get details => getField<dynamic>('details');
  set details(dynamic value) => setField<dynamic>('details', value);

  bool? get showProfileImage => getField<bool>('show_profile_image');
  set showProfileImage(bool? value) =>
      setField<bool>('show_profile_image', value);

  bool? get showSocialmedia => getField<bool>('show_socialmedia');
  set showSocialmedia(bool? value) => setField<bool>('show_socialmedia', value);

  bool? get allowMessage => getField<bool>('allow_message');
  set allowMessage(bool? value) => setField<bool>('allow_message', value);

  bool? get allowCall => getField<bool>('allow_call');
  set allowCall(bool? value) => setField<bool>('allow_call', value);

  String? get mainCatLabel => getField<String>('main_cat_label');
  set mainCatLabel(String? value) => setField<String>('main_cat_label', value);

  String? get catLabel => getField<String>('cat_label');
  set catLabel(String? value) => setField<String>('cat_label', value);

  String? get subCatLabel => getField<String>('sub_cat_label');
  set subCatLabel(String? value) => setField<String>('sub_cat_label', value);

  dynamic get detailsLabels => getField<dynamic>('details_labels');
  set detailsLabels(dynamic value) =>
      setField<dynamic>('details_labels', value);

  String? get detailsText => getField<String>('details_text');
  set detailsText(String? value) => setField<String>('details_text', value);

  String? get detailsLabelText => getField<String>('details_label_text');
  set detailsLabelText(String? value) =>
      setField<String>('details_label_text', value);
}
