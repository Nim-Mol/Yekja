import '../database.dart';

class ViewShoutoutTable extends SupabaseTable<ViewShoutoutRow> {
  @override
  String get tableName => 'view_shoutout';

  @override
  ViewShoutoutRow createRow(Map<String, dynamic> data) => ViewShoutoutRow(data);
}

class ViewShoutoutRow extends SupabaseDataRow {
  ViewShoutoutRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewShoutoutTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get username => getField<String>('username');
  set username(String? value) => setField<String>('username', value);

  String? get profileAvatar => getField<String>('profile_avatar');
  set profileAvatar(String? value) => setField<String>('profile_avatar', value);

  String? get header => getField<String>('header');
  set header(String? value) => setField<String>('header', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  int? get likes => getField<int>('likes');
  set likes(int? value) => setField<int>('likes', value);

  double? get reviewScore => getField<double>('review_score');
  set reviewScore(double? value) => setField<double>('review_score', value);

  int? get ratings => getField<int>('ratings');
  set ratings(int? value) => setField<int>('ratings', value);

  String? get headerFa => getField<String>('header_fa');
  set headerFa(String? value) => setField<String>('header_fa', value);

  String? get descriptionFa => getField<String>('description_fa');
  set descriptionFa(String? value) => setField<String>('description_fa', value);

  String? get headerNl => getField<String>('header_nl');
  set headerNl(String? value) => setField<String>('header_nl', value);

  String? get descriptionNl => getField<String>('description_nl');
  set descriptionNl(String? value) => setField<String>('description_nl', value);

  bool? get showProfileImage => getField<bool>('show_profile_image');
  set showProfileImage(bool? value) =>
      setField<bool>('show_profile_image', value);
}
