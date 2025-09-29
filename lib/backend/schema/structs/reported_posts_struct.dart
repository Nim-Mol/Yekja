// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReportedPostsStruct extends BaseStruct {
  ReportedPostsStruct({
    String? postId,
    bool? reported,
  })  : _postId = postId,
        _reported = reported;

  // "postId" field.
  String? _postId;
  String get postId => _postId ?? '';
  set postId(String? val) => _postId = val;

  bool hasPostId() => _postId != null;

  // "reported" field.
  bool? _reported;
  bool get reported => _reported ?? false;
  set reported(bool? val) => _reported = val;

  bool hasReported() => _reported != null;

  static ReportedPostsStruct fromMap(Map<String, dynamic> data) =>
      ReportedPostsStruct(
        postId: data['postId'] as String?,
        reported: data['reported'] as bool?,
      );

  static ReportedPostsStruct? maybeFromMap(dynamic data) => data is Map
      ? ReportedPostsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'postId': _postId,
        'reported': _reported,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'postId': serializeParam(
          _postId,
          ParamType.String,
        ),
        'reported': serializeParam(
          _reported,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ReportedPostsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ReportedPostsStruct(
        postId: deserializeParam(
          data['postId'],
          ParamType.String,
          false,
        ),
        reported: deserializeParam(
          data['reported'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ReportedPostsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ReportedPostsStruct &&
        postId == other.postId &&
        reported == other.reported;
  }

  @override
  int get hashCode => const ListEquality().hash([postId, reported]);
}

ReportedPostsStruct createReportedPostsStruct({
  String? postId,
  bool? reported,
}) =>
    ReportedPostsStruct(
      postId: postId,
      reported: reported,
    );
