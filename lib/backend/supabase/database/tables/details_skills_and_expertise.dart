import '../database.dart';

class DetailsSkillsAndExpertiseTable
    extends SupabaseTable<DetailsSkillsAndExpertiseRow> {
  @override
  String get tableName => 'details_skills_and_expertise';

  @override
  DetailsSkillsAndExpertiseRow createRow(Map<String, dynamic> data) =>
      DetailsSkillsAndExpertiseRow(data);
}

class DetailsSkillsAndExpertiseRow extends SupabaseDataRow {
  DetailsSkillsAndExpertiseRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DetailsSkillsAndExpertiseTable();

  String get postId => getField<String>('post_id')!;
  set postId(String value) => setField<String>('post_id', value);

  String get intend => getField<String>('intend')!;
  set intend(String value) => setField<String>('intend', value);

  int? get price => getField<int>('price');
  set price(int? value) => setField<int>('price', value);

  String? get priceUnit => getField<String>('price_unit');
  set priceUnit(String? value) => setField<String>('price_unit', value);

  String? get priceText => getField<String>('price_text');
  set priceText(String? value) => setField<String>('price_text', value);

  bool get isNegotiable => getField<bool>('is_negotiable')!;
  set isNegotiable(bool value) => setField<bool>('is_negotiable', value);

  String? get languages => getField<String>('languages');
  set languages(String? value) => setField<String>('languages', value);

  String? get serviceMode => getField<String>('service_mode');
  set serviceMode(String? value) => setField<String>('service_mode', value);

  String? get experienceYears => getField<String>('experience_years');
  set experienceYears(String? value) =>
      setField<String>('experience_years', value);
}
