import '../database.dart';

class AdminMissingTranslationsMarketDescriptionTable
    extends SupabaseTable<AdminMissingTranslationsMarketDescriptionRow> {
  @override
  String get tableName => 'admin_missing_translations_market_description';

  @override
  AdminMissingTranslationsMarketDescriptionRow createRow(
          Map<String, dynamic> data) =>
      AdminMissingTranslationsMarketDescriptionRow(data);
}

class AdminMissingTranslationsMarketDescriptionRow extends SupabaseDataRow {
  AdminMissingTranslationsMarketDescriptionRow(Map<String, dynamic> data)
      : super(data);

  @override
  SupabaseTable get table => AdminMissingTranslationsMarketDescriptionTable();

  String? get marketId => getField<String>('market_id');
  set marketId(String? value) => setField<String>('market_id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);
}
