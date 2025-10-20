import '../database.dart';

class ViewWhoamiTable extends SupabaseTable<ViewWhoamiRow> {
  @override
  String get tableName => 'view_whoami';

  @override
  ViewWhoamiRow createRow(Map<String, dynamic> data) => ViewWhoamiRow(data);
}

class ViewWhoamiRow extends SupabaseDataRow {
  ViewWhoamiRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewWhoamiTable();

  String? get uid => getField<String>('uid');
  set uid(String? value) => setField<String>('uid', value);

  String? get role => getField<String>('role');
  set role(String? value) => setField<String>('role', value);

  bool? get isMember => getField<bool>('is_member');
  set isMember(bool? value) => setField<bool>('is_member', value);

  bool? get isAdmin => getField<bool>('is_admin');
  set isAdmin(bool? value) => setField<bool>('is_admin', value);
}
