import '../database.dart';

class ViewUserReviewsTable extends SupabaseTable<ViewUserReviewsRow> {
  @override
  String get tableName => 'view_user_reviews';

  @override
  ViewUserReviewsRow createRow(Map<String, dynamic> data) =>
      ViewUserReviewsRow(data);
}

class ViewUserReviewsRow extends SupabaseDataRow {
  ViewUserReviewsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewUserReviewsTable();

  String? get reviewId => getField<String>('review_id');
  set reviewId(String? value) => setField<String>('review_id', value);

  String? get postItemId => getField<String>('postItem_id');
  set postItemId(String? value) => setField<String>('postItem_id', value);

  int? get comunicationScore => getField<int>('comunication_score');
  set comunicationScore(int? value) =>
      setField<int>('comunication_score', value);

  int? get reliabilityScore => getField<int>('reliability_score');
  set reliabilityScore(int? value) => setField<int>('reliability_score', value);

  int? get fairnessScore => getField<int>('fairness_score');
  set fairnessScore(int? value) => setField<int>('fairness_score', value);

  int? get qualityScsore => getField<int>('quality_scsore');
  set qualityScsore(int? value) => setField<int>('quality_scsore', value);

  String? get note => getField<String>('note');
  set note(String? value) => setField<String>('note', value);

  String? get writerId => getField<String>('writer_id');
  set writerId(String? value) => setField<String>('writer_id', value);

  String? get reviewedUserId => getField<String>('reviewed_user_id');
  set reviewedUserId(String? value) =>
      setField<String>('reviewed_user_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get postownerId => getField<String>('postowner_id');
  set postownerId(String? value) => setField<String>('postowner_id', value);

  bool? get ownerSubmitted => getField<bool>('owner_submitted');
  set ownerSubmitted(bool? value) => setField<bool>('owner_submitted', value);

  bool? get customerSubmitted => getField<bool>('customer_submitted');
  set customerSubmitted(bool? value) =>
      setField<bool>('customer_submitted', value);

  bool? get bothReviewSubmitted => getField<bool>('both_review_submitted');
  set bothReviewSubmitted(bool? value) =>
      setField<bool>('both_review_submitted', value);

  String? get profileAvatarWriter => getField<String>('profile_avatar_writer');
  set profileAvatarWriter(String? value) =>
      setField<String>('profile_avatar_writer', value);

  String? get usernameWriter => getField<String>('username_writer');
  set usernameWriter(String? value) =>
      setField<String>('username_writer', value);

  double? get avgReviewScore => getField<double>('avg_review_score');
  set avgReviewScore(double? value) =>
      setField<double>('avg_review_score', value);
}
