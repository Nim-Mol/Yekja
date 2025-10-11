import '../database.dart';

class AdminMissingTranslationsCareDescriptionTable
    extends SupabaseTable<AdminMissingTranslationsCareDescriptionRow> {
  @override
  String get tableName => 'admin_missing_translations_care_description';

  @override
  AdminMissingTranslationsCareDescriptionRow createRow(
          Map<String, dynamic> data) =>
      AdminMissingTranslationsCareDescriptionRow(data);
}

class AdminMissingTranslationsCareDescriptionRow extends SupabaseDataRow {
  AdminMissingTranslationsCareDescriptionRow(Map<String, dynamic> data)
      : super(data);

  @override
  SupabaseTable get table => AdminMissingTranslationsCareDescriptionTable();

  String? get careId => getField<String>('care_id');
  set careId(String? value) => setField<String>('care_id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);
}
