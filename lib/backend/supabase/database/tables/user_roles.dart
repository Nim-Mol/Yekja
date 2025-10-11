import '../database.dart';

class UserRolesTable extends SupabaseTable<UserRolesRow> {
  @override
  String get tableName => 'user_roles';

  @override
  UserRolesRow createRow(Map<String, dynamic> data) => UserRolesRow(data);
}

class UserRolesRow extends SupabaseDataRow {
  UserRolesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserRolesTable();

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get roleId => getField<String>('role_id')!;
  set roleId(String value) => setField<String>('role_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);
}
