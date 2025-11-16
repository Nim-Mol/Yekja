import '../database.dart';

class ConsentsTable extends SupabaseTable<ConsentsRow> {
  @override
  String get tableName => 'consents';

  @override
  ConsentsRow createRow(Map<String, dynamic> data) => ConsentsRow(data);
}

class ConsentsRow extends SupabaseDataRow {
  ConsentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ConsentsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  bool? get showProfileImage => getField<bool>('show_profile_image');
  set showProfileImage(bool? value) =>
      setField<bool>('show_profile_image', value);

  bool? get showSocialmedia => getField<bool>('show_socialmedia');
  set showSocialmedia(bool? value) => setField<bool>('show_socialmedia', value);

  bool? get allowCall => getField<bool>('allow_call');
  set allowCall(bool? value) => setField<bool>('allow_call', value);

  bool? get allowMessage => getField<bool>('allow_message');
  set allowMessage(bool? value) => setField<bool>('allow_message', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  bool get showFav => getField<bool>('show_fav')!;
  set showFav(bool value) => setField<bool>('show_fav', value);

  bool get termsAndPolicy => getField<bool>('terms_and_policy')!;
  set termsAndPolicy(bool value) => setField<bool>('terms_and_policy', value);
}
