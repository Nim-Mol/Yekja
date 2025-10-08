import '../database.dart';

class UserExtTable extends SupabaseTable<UserExtRow> {
  @override
  String get tableName => 'user_ext';

  @override
  UserExtRow createRow(Map<String, dynamic> data) => UserExtRow(data);
}

class UserExtRow extends SupabaseDataRow {
  UserExtRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserExtTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get firstName => getField<String>('firstName');
  set firstName(String? value) => setField<String>('firstName', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  bool get isVerified => getField<bool>('IsVerified')!;
  set isVerified(bool value) => setField<bool>('IsVerified', value);

  String? get lastName => getField<String>('lastName');
  set lastName(String? value) => setField<String>('lastName', value);

  String? get biography => getField<String>('biography');
  set biography(String? value) => setField<String>('biography', value);

  String? get phonenumber => getField<String>('phonenumber');
  set phonenumber(String? value) => setField<String>('phonenumber', value);

  String? get profileAvatar => getField<String>('profile_avatar');
  set profileAvatar(String? value) => setField<String>('profile_avatar', value);

  String? get profileWallpaper => getField<String>('profile_wallpaper');
  set profileWallpaper(String? value) =>
      setField<String>('profile_wallpaper', value);

  String? get userCity => getField<String>('user_city');
  set userCity(String? value) => setField<String>('user_city', value);

  String get userName => getField<String>('userName')!;
  set userName(String value) => setField<String>('userName', value);

  int? get totalLikes => getField<int>('total_likes');
  set totalLikes(int? value) => setField<int>('total_likes', value);

  double get review => getField<double>('review')!;
  set review(double value) => setField<double>('review', value);

  bool get yekjaVerified => getField<bool>('YekjaVerified')!;
  set yekjaVerified(bool value) => setField<bool>('YekjaVerified', value);

  List<String> get userReviewedIds => getListField<String>('user_reviewed_ids');
  set userReviewedIds(List<String>? value) =>
      setListField<String>('user_reviewed_ids', value);

  bool? get reported => getField<bool>('reported');
  set reported(bool? value) => setField<bool>('reported', value);

  dynamic get biographyI18n => getField<dynamic>('biography_i18n');
  set biographyI18n(dynamic value) =>
      setField<dynamic>('biography_i18n', value);

  dynamic get userCityI18n => getField<dynamic>('user_city_i18n');
  set userCityI18n(dynamic value) =>
      setField<dynamic>('user_city_i18n', value);

  String? get role => getField<String>('Role');
  set role(String? value) => setField<String>('Role', value);

  int get ratings => getField<int>('ratings')!;
  set ratings(int value) => setField<int>('ratings', value);
}
