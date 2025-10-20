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

  DateTime? get deadline => getField<DateTime>('deadline');
  set deadline(DateTime? value) => setField<DateTime>('deadline', value);

  String? get compensationType => getField<String>('compensation_type');
  set compensationType(String? value) =>
      setField<String>('compensation_type', value);

  int? get price => getField<int>('price');
  set price(int? value) => setField<int>('price', value);

  String? get priceUnit => getField<String>('price_unit');
  set priceUnit(String? value) => setField<String>('price_unit', value);

  String? get priceText => getField<String>('price_text');
  set priceText(String? value) => setField<String>('price_text', value);

  List<String> get languages => getListField<String>('languages');
  set languages(List<String> value) => setListField<String>('languages', value);

  String? get locationMode => getField<String>('location_mode');
  set locationMode(String? value) => setField<String>('location_mode', value);

  int? get experienceYears => getField<int>('experience_years');
  set experienceYears(int? value) => setField<int>('experience_years', value);

  String? get certifications => getField<String>('certifications');
  set certifications(String? value) =>
      setField<String>('certifications', value);

  bool get materialsIncluded => getField<bool>('materials_included')!;
  set materialsIncluded(bool value) =>
      setField<bool>('materials_included', value);

  bool get travelPossible => getField<bool>('travel_possible')!;
  set travelPossible(bool value) => setField<bool>('travel_possible', value);

  int? get capacity => getField<int>('capacity');
  set capacity(int? value) => setField<int>('capacity', value);
}
