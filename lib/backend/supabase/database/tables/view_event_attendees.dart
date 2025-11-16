import '../database.dart';

class ViewEventAttendeesTable extends SupabaseTable<ViewEventAttendeesRow> {
  @override
  String get tableName => 'view_event_attendees';

  @override
  ViewEventAttendeesRow createRow(Map<String, dynamic> data) =>
      ViewEventAttendeesRow(data);
}

class ViewEventAttendeesRow extends SupabaseDataRow {
  ViewEventAttendeesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewEventAttendeesTable();

  String? get postId => getField<String>('post_id');
  set postId(String? value) => setField<String>('post_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  DateTime? get joinedAt => getField<DateTime>('joined_at');
  set joinedAt(DateTime? value) => setField<DateTime>('joined_at', value);

  String? get userName => getField<String>('user_name');
  set userName(String? value) => setField<String>('user_name', value);

  String? get profileAvatar => getField<String>('profile_avatar');
  set profileAvatar(String? value) => setField<String>('profile_avatar', value);

  bool? get showProfileImage => getField<bool>('show_profile_image');
  set showProfileImage(bool? value) =>
      setField<bool>('show_profile_image', value);

  bool? get yekjaVerified => getField<bool>('yekja_verified');
  set yekjaVerified(bool? value) => setField<bool>('yekja_verified', value);

  double? get review => getField<double>('review');
  set review(double? value) => setField<double>('review', value);

  int? get ratings => getField<int>('ratings');
  set ratings(int? value) => setField<int>('ratings', value);
}
