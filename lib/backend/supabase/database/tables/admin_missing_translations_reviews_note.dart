import '../database.dart';

class AdminMissingTranslationsReviewsNoteTable
    extends SupabaseTable<AdminMissingTranslationsReviewsNoteRow> {
  @override
  String get tableName => 'admin_missing_translations_reviews_note';

  @override
  AdminMissingTranslationsReviewsNoteRow createRow(Map<String, dynamic> data) =>
      AdminMissingTranslationsReviewsNoteRow(data);
}

class AdminMissingTranslationsReviewsNoteRow extends SupabaseDataRow {
  AdminMissingTranslationsReviewsNoteRow(Map<String, dynamic> data)
      : super(data);

  @override
  SupabaseTable get table => AdminMissingTranslationsReviewsNoteTable();

  String? get reviewId => getField<String>('review_id');
  set reviewId(String? value) => setField<String>('review_id', value);

  String? get note => getField<String>('note');
  set note(String? value) => setField<String>('note', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
