// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReviewCardDataStruct extends BaseStruct {
  ReviewCardDataStruct({
    String? userName,
    String? userAvatar,
    int? comunicationScore,
    int? qualitScore,
    int? reliabilityScore,
    String? note,
    DateTime? createAt,
    double? avarageScore,
    int? fairnessScore,
    String? reviewerId,
  })  : _userName = userName,
        _userAvatar = userAvatar,
        _comunicationScore = comunicationScore,
        _qualitScore = qualitScore,
        _reliabilityScore = reliabilityScore,
        _note = note,
        _createAt = createAt,
        _avarageScore = avarageScore,
        _fairnessScore = fairnessScore,
        _reviewerId = reviewerId;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;

  bool hasUserName() => _userName != null;

  // "userAvatar" field.
  String? _userAvatar;
  String get userAvatar => _userAvatar ?? '';
  set userAvatar(String? val) => _userAvatar = val;

  bool hasUserAvatar() => _userAvatar != null;

  // "comunicationScore" field.
  int? _comunicationScore;
  int get comunicationScore => _comunicationScore ?? 0;
  set comunicationScore(int? val) => _comunicationScore = val;

  void incrementComunicationScore(int amount) =>
      comunicationScore = comunicationScore + amount;

  bool hasComunicationScore() => _comunicationScore != null;

  // "qualitScore" field.
  int? _qualitScore;
  int get qualitScore => _qualitScore ?? 0;
  set qualitScore(int? val) => _qualitScore = val;

  void incrementQualitScore(int amount) => qualitScore = qualitScore + amount;

  bool hasQualitScore() => _qualitScore != null;

  // "reliabilityScore" field.
  int? _reliabilityScore;
  int get reliabilityScore => _reliabilityScore ?? 0;
  set reliabilityScore(int? val) => _reliabilityScore = val;

  void incrementReliabilityScore(int amount) =>
      reliabilityScore = reliabilityScore + amount;

  bool hasReliabilityScore() => _reliabilityScore != null;

  // "Note" field.
  String? _note;
  String get note => _note ?? '';
  set note(String? val) => _note = val;

  bool hasNote() => _note != null;

  // "createAt" field.
  DateTime? _createAt;
  DateTime? get createAt => _createAt;
  set createAt(DateTime? val) => _createAt = val;

  bool hasCreateAt() => _createAt != null;

  // "AvarageScore" field.
  double? _avarageScore;
  double get avarageScore => _avarageScore ?? 0.0;
  set avarageScore(double? val) => _avarageScore = val;

  void incrementAvarageScore(double amount) =>
      avarageScore = avarageScore + amount;

  bool hasAvarageScore() => _avarageScore != null;

  // "fairnessScore" field.
  int? _fairnessScore;
  int get fairnessScore => _fairnessScore ?? 0;
  set fairnessScore(int? val) => _fairnessScore = val;

  void incrementFairnessScore(int amount) =>
      fairnessScore = fairnessScore + amount;

  bool hasFairnessScore() => _fairnessScore != null;

  // "reviewer_id" field.
  String? _reviewerId;
  String get reviewerId => _reviewerId ?? '';
  set reviewerId(String? val) => _reviewerId = val;

  bool hasReviewerId() => _reviewerId != null;

  static ReviewCardDataStruct fromMap(Map<String, dynamic> data) =>
      ReviewCardDataStruct(
        userName: data['userName'] as String?,
        userAvatar: data['userAvatar'] as String?,
        comunicationScore: castToType<int>(data['comunicationScore']),
        qualitScore: castToType<int>(data['qualitScore']),
        reliabilityScore: castToType<int>(data['reliabilityScore']),
        note: data['Note'] as String?,
        createAt: data['createAt'] as DateTime?,
        avarageScore: castToType<double>(data['AvarageScore']),
        fairnessScore: castToType<int>(data['fairnessScore']),
        reviewerId: data['reviewer_id'] as String?,
      );

  static ReviewCardDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ReviewCardDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'userName': _userName,
        'userAvatar': _userAvatar,
        'comunicationScore': _comunicationScore,
        'qualitScore': _qualitScore,
        'reliabilityScore': _reliabilityScore,
        'Note': _note,
        'createAt': _createAt,
        'AvarageScore': _avarageScore,
        'fairnessScore': _fairnessScore,
        'reviewer_id': _reviewerId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'userName': serializeParam(
          _userName,
          ParamType.String,
        ),
        'userAvatar': serializeParam(
          _userAvatar,
          ParamType.String,
        ),
        'comunicationScore': serializeParam(
          _comunicationScore,
          ParamType.int,
        ),
        'qualitScore': serializeParam(
          _qualitScore,
          ParamType.int,
        ),
        'reliabilityScore': serializeParam(
          _reliabilityScore,
          ParamType.int,
        ),
        'Note': serializeParam(
          _note,
          ParamType.String,
        ),
        'createAt': serializeParam(
          _createAt,
          ParamType.DateTime,
        ),
        'AvarageScore': serializeParam(
          _avarageScore,
          ParamType.double,
        ),
        'fairnessScore': serializeParam(
          _fairnessScore,
          ParamType.int,
        ),
        'reviewer_id': serializeParam(
          _reviewerId,
          ParamType.String,
        ),
      }.withoutNulls;

  static ReviewCardDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ReviewCardDataStruct(
        userName: deserializeParam(
          data['userName'],
          ParamType.String,
          false,
        ),
        userAvatar: deserializeParam(
          data['userAvatar'],
          ParamType.String,
          false,
        ),
        comunicationScore: deserializeParam(
          data['comunicationScore'],
          ParamType.int,
          false,
        ),
        qualitScore: deserializeParam(
          data['qualitScore'],
          ParamType.int,
          false,
        ),
        reliabilityScore: deserializeParam(
          data['reliabilityScore'],
          ParamType.int,
          false,
        ),
        note: deserializeParam(
          data['Note'],
          ParamType.String,
          false,
        ),
        createAt: deserializeParam(
          data['createAt'],
          ParamType.DateTime,
          false,
        ),
        avarageScore: deserializeParam(
          data['AvarageScore'],
          ParamType.double,
          false,
        ),
        fairnessScore: deserializeParam(
          data['fairnessScore'],
          ParamType.int,
          false,
        ),
        reviewerId: deserializeParam(
          data['reviewer_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ReviewCardDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ReviewCardDataStruct &&
        userName == other.userName &&
        userAvatar == other.userAvatar &&
        comunicationScore == other.comunicationScore &&
        qualitScore == other.qualitScore &&
        reliabilityScore == other.reliabilityScore &&
        note == other.note &&
        createAt == other.createAt &&
        avarageScore == other.avarageScore &&
        fairnessScore == other.fairnessScore &&
        reviewerId == other.reviewerId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        userName,
        userAvatar,
        comunicationScore,
        qualitScore,
        reliabilityScore,
        note,
        createAt,
        avarageScore,
        fairnessScore,
        reviewerId
      ]);
}

ReviewCardDataStruct createReviewCardDataStruct({
  String? userName,
  String? userAvatar,
  int? comunicationScore,
  int? qualitScore,
  int? reliabilityScore,
  String? note,
  DateTime? createAt,
  double? avarageScore,
  int? fairnessScore,
  String? reviewerId,
}) =>
    ReviewCardDataStruct(
      userName: userName,
      userAvatar: userAvatar,
      comunicationScore: comunicationScore,
      qualitScore: qualitScore,
      reliabilityScore: reliabilityScore,
      note: note,
      createAt: createAt,
      avarageScore: avarageScore,
      fairnessScore: fairnessScore,
      reviewerId: reviewerId,
    );
