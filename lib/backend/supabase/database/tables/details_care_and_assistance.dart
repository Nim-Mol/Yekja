import '../database.dart';

class DetailsCareAndAssistanceTable
    extends SupabaseTable<DetailsCareAndAssistanceRow> {
  @override
  String get tableName => 'details_care_and_assistance';

  @override
  DetailsCareAndAssistanceRow createRow(Map<String, dynamic> data) =>
      DetailsCareAndAssistanceRow(data);
}

class DetailsCareAndAssistanceRow extends SupabaseDataRow {
  DetailsCareAndAssistanceRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DetailsCareAndAssistanceTable();

  String get postId => getField<String>('post_id')!;
  set postId(String value) => setField<String>('post_id', value);

  String get intend => getField<String>('intend')!;
  set intend(String value) => setField<String>('intend', value);

  DateTime? get deadline => getField<DateTime>('deadline');
  set deadline(DateTime? value) => setField<DateTime>('deadline', value);

  String? get compensationType => getField<String>('compensation_type');
  set compensationType(String? value) =>
      setField<String>('compensation_type', value);

  bool get openForSwap => getField<bool>('open_for_swap')!;
  set openForSwap(bool value) => setField<bool>('open_for_swap', value);

  String? get wishlistText => getField<String>('wishlist_text');
  set wishlistText(String? value) => setField<String>('wishlist_text', value);
}
