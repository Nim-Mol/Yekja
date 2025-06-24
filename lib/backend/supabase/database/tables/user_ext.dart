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

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  bool get isVerified => getField<bool>('IsVerified')!;
  set isVerified(bool value) => setField<bool>('IsVerified', value);
}
