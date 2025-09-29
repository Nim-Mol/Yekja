import '../database.dart';

class UserExtArchiveTable extends SupabaseTable<UserExtArchiveRow> {
  @override
  String get tableName => 'user_ext_archive';

  @override
  UserExtArchiveRow createRow(Map<String, dynamic> data) =>
      UserExtArchiveRow(data);
}

class UserExtArchiveRow extends SupabaseDataRow {
  UserExtArchiveRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserExtArchiveTable();

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

  bool get reported => getField<bool>('reported')!;
  set reported(bool value) => setField<bool>('reported', value);

  int? get totalLikes => getField<int>('total_likes');
  set totalLikes(int? value) => setField<int>('total_likes', value);

  double? get review => getField<double>('review');
  set review(double? value) => setField<double>('review', value);

  bool get yekjaVerified => getField<bool>('YekjaVerified')!;
  set yekjaVerified(bool value) => setField<bool>('YekjaVerified', value);

  List<String> get favorities => getListField<String>('favorities');
  set favorities(List<String>? value) =>
      setListField<String>('favorities', value);

  bool get online => getField<bool>('online')!;
  set online(bool value) => setField<bool>('online', value);

  List<String> get userReported => getListField<String>('user_reported');
  set userReported(List<String>? value) =>
      setListField<String>('user_reported', value);

  List<String> get userReviewedIds => getListField<String>('user_reviewed_ids');
  set userReviewedIds(List<String>? value) =>
      setListField<String>('user_reviewed_ids', value);

  DateTime get deletedAt => getField<DateTime>('deleted_at')!;
  set deletedAt(DateTime value) => setField<DateTime>('deleted_at', value);
}
