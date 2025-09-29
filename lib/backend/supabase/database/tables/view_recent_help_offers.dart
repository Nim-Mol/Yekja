import '../database.dart';

class ViewRecentHelpOffersTable extends SupabaseTable<ViewRecentHelpOffersRow> {
  @override
  String get tableName => 'view_recent_help_offers';

  @override
  ViewRecentHelpOffersRow createRow(Map<String, dynamic> data) =>
      ViewRecentHelpOffersRow(data);
}

class ViewRecentHelpOffersRow extends SupabaseDataRow {
  ViewRecentHelpOffersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewRecentHelpOffersTable();

  String? get careId => getField<String>('care_id');
  set careId(String? value) => setField<String>('care_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get mainCatId => getField<int>('main_cat_id');
  set mainCatId(int? value) => setField<int>('main_cat_id', value);

  int? get catId => getField<int>('cat_id');
  set catId(int? value) => setField<int>('cat_id', value);

  String? get catName => getField<String>('cat_name');
  set catName(String? value) => setField<String>('cat_name', value);

  int? get subCatId => getField<int>('sub_cat_id');
  set subCatId(int? value) => setField<int>('sub_cat_id', value);

  String? get subCatName => getField<String>('sub_cat_name');
  set subCatName(String? value) => setField<String>('sub_cat_name', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  List<String> get images => getListField<String>('images');
  set images(List<String>? value) => setListField<String>('images', value);

  int? get postLikes => getField<int>('post_likes');
  set postLikes(int? value) => setField<int>('post_likes', value);

  String? get userCity => getField<String>('user_city');
  set userCity(String? value) => setField<String>('user_city', value);
}
