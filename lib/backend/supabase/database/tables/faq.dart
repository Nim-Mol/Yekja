import '../database.dart';

class FaqTable extends SupabaseTable<FaqRow> {
  @override
  String get tableName => 'faq';

  @override
  FaqRow createRow(Map<String, dynamic> data) => FaqRow(data);
}

class FaqRow extends SupabaseDataRow {
  FaqRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FaqTable();

  int get faqId => getField<int>('faq_id')!;
  set faqId(int value) => setField<int>('faq_id', value);

  String get faqKey => getField<String>('faq_key')!;
  set faqKey(String value) => setField<String>('faq_key', value);

  int get sortOrder => getField<int>('sort_order')!;
  set sortOrder(int value) => setField<int>('sort_order', value);

  bool get isActive => getField<bool>('is_active')!;
  set isActive(bool value) => setField<bool>('is_active', value);

  String get questionEn => getField<String>('question_en')!;
  set questionEn(String value) => setField<String>('question_en', value);

  String get answerEn => getField<String>('answer_en')!;
  set answerEn(String value) => setField<String>('answer_en', value);

  String get questionFa => getField<String>('question_fa')!;
  set questionFa(String value) => setField<String>('question_fa', value);

  String get answerFa => getField<String>('answer_fa')!;
  set answerFa(String value) => setField<String>('answer_fa', value);

  String get questionNl => getField<String>('question_nl')!;
  set questionNl(String value) => setField<String>('question_nl', value);

  String get answerNl => getField<String>('answer_nl')!;
  set answerNl(String value) => setField<String>('answer_nl', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);
}
