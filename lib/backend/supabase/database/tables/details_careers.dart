import '../database.dart';

class DetailsCareersTable extends SupabaseTable<DetailsCareersRow> {
  @override
  String get tableName => 'details_careers';

  @override
  DetailsCareersRow createRow(Map<String, dynamic> data) =>
      DetailsCareersRow(data);
}

class DetailsCareersRow extends SupabaseDataRow {
  DetailsCareersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DetailsCareersTable();

  String get postId => getField<String>('post_id')!;
  set postId(String value) => setField<String>('post_id', value);

  String get intend => getField<String>('intend')!;
  set intend(String value) => setField<String>('intend', value);

  DateTime? get deadline => getField<DateTime>('deadline');
  set deadline(DateTime? value) => setField<DateTime>('deadline', value);

  String? get compensationType => getField<String>('compensation_type');
  set compensationType(String? value) =>
      setField<String>('compensation_type', value);

  int? get salaryMin => getField<int>('salary_min');
  set salaryMin(int? value) => setField<int>('salary_min', value);

  int? get salaryMax => getField<int>('salary_max');
  set salaryMax(int? value) => setField<int>('salary_max', value);

  String? get salaryUnit => getField<String>('salary_unit');
  set salaryUnit(String? value) => setField<String>('salary_unit', value);

  String? get employmentType => getField<String>('employment_type');
  set employmentType(String? value) =>
      setField<String>('employment_type', value);

  String? get locationMode => getField<String>('location_mode');
  set locationMode(String? value) => setField<String>('location_mode', value);

  List<String> get languages => getListField<String>('languages');
  set languages(List<String> value) => setListField<String>('languages', value);

  int? get experienceYearsMin => getField<int>('experience_years_min');
  set experienceYearsMin(int? value) =>
      setField<int>('experience_years_min', value);

  String? get companyName => getField<String>('company_name');
  set companyName(String? value) => setField<String>('company_name', value);

  String? get applicationUrl => getField<String>('application_url');
  set applicationUrl(String? value) =>
      setField<String>('application_url', value);

  DateTime? get eventStartsAt => getField<DateTime>('event_starts_at');
  set eventStartsAt(DateTime? value) =>
      setField<DateTime>('event_starts_at', value);

  DateTime? get eventEndsAt => getField<DateTime>('event_ends_at');
  set eventEndsAt(DateTime? value) =>
      setField<DateTime>('event_ends_at', value);

  bool get isRecruiterProfile => getField<bool>('is_recruiter_profile')!;
  set isRecruiterProfile(bool value) =>
      setField<bool>('is_recruiter_profile', value);
}
