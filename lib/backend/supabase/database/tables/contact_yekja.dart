import '../database.dart';

class ContactYekjaTable extends SupabaseTable<ContactYekjaRow> {
  @override
  String get tableName => 'contact_yekja';

  @override
  ContactYekjaRow createRow(Map<String, dynamic> data) => ContactYekjaRow(data);
}

class ContactYekjaRow extends SupabaseDataRow {
  ContactYekjaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ContactYekjaTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get subject => getField<String>('subject')!;
  set subject(String value) => setField<String>('subject', value);

  String get message => getField<String>('message')!;
  set message(String value) => setField<String>('message', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  List<String> get img => getListField<String>('img');
  set img(List<String>? value) => setListField<String>('img', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);
}
