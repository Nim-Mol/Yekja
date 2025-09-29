import '../database.dart';

class ReviewsTable extends SupabaseTable<ReviewsRow> {
  @override
  String get tableName => 'reviews';

  @override
  ReviewsRow createRow(Map<String, dynamic> data) => ReviewsRow(data);
}

class ReviewsRow extends SupabaseDataRow {
  ReviewsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ReviewsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get writerId => getField<String>('writer_id');
  set writerId(String? value) => setField<String>('writer_id', value);

  String? get postownerId => getField<String>('postowner_id');
  set postownerId(String? value) => setField<String>('postowner_id', value);

  String? get postItemId => getField<String>('postItem_id');
  set postItemId(String? value) => setField<String>('postItem_id', value);

  String? get note => getField<String>('note');
  set note(String? value) => setField<String>('note', value);

  int? get comunicationScore => getField<int>('comunication_score');
  set comunicationScore(int? value) =>
      setField<int>('comunication_score', value);

  int? get reliabilityScore => getField<int>('reliability_score');
  set reliabilityScore(int? value) => setField<int>('reliability_score', value);

  int? get fairnessScore => getField<int>('fairness_score');
  set fairnessScore(int? value) => setField<int>('fairness_score', value);

  int? get qualityScsore => getField<int>('quality_scsore');
  set qualityScsore(int? value) => setField<int>('quality_scsore', value);

  String? get reviewedUserId => getField<String>('reviewed_user_id');
  set reviewedUserId(String? value) =>
      setField<String>('reviewed_user_id', value);
}
