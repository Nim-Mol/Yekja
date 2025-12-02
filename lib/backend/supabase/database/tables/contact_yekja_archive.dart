import '../database.dart';

class ContactYekjaArchiveTable extends SupabaseTable<ContactYekjaArchiveRow> {
  @override
  String get tableName => 'contact_yekja_archive';

  @override
  ContactYekjaArchiveRow createRow(Map<String, dynamic> data) =>
      ContactYekjaArchiveRow(data);
}

class ContactYekjaArchiveRow extends SupabaseDataRow {
  ContactYekjaArchiveRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ContactYekjaArchiveTable();

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

  bool? get resolved => getField<bool>('resolved');
  set resolved(bool? value) => setField<bool>('resolved', value);
}
