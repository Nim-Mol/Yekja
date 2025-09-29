// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReportingDataStruct extends BaseStruct {
  ReportingDataStruct({
    String? postId,
    String? postTitle,
    bool? isProfile,
    String? profileId,
    String? profileOwnerName,
    String? reporterId,
  })  : _postId = postId,
        _postTitle = postTitle,
        _isProfile = isProfile,
        _profileId = profileId,
        _profileOwnerName = profileOwnerName,
        _reporterId = reporterId;

  // "post_id" field.
  String? _postId;
  String get postId => _postId ?? '';
  set postId(String? val) => _postId = val;

  bool hasPostId() => _postId != null;

  // "post_title" field.
  String? _postTitle;
  String get postTitle => _postTitle ?? '';
  set postTitle(String? val) => _postTitle = val;

  bool hasPostTitle() => _postTitle != null;

  // "is_profile" field.
  bool? _isProfile;
  bool get isProfile => _isProfile ?? false;
  set isProfile(bool? val) => _isProfile = val;

  bool hasIsProfile() => _isProfile != null;

  // "profile_id" field.
  String? _profileId;
  String get profileId => _profileId ?? '';
  set profileId(String? val) => _profileId = val;

  bool hasProfileId() => _profileId != null;

  // "profile_owner_name" field.
  String? _profileOwnerName;
  String get profileOwnerName => _profileOwnerName ?? '';
  set profileOwnerName(String? val) => _profileOwnerName = val;

  bool hasProfileOwnerName() => _profileOwnerName != null;

  // "reporter_id" field.
  String? _reporterId;
  String get reporterId => _reporterId ?? '';
  set reporterId(String? val) => _reporterId = val;

  bool hasReporterId() => _reporterId != null;

  static ReportingDataStruct fromMap(Map<String, dynamic> data) =>
      ReportingDataStruct(
        postId: data['post_id'] as String?,
        postTitle: data['post_title'] as String?,
        isProfile: data['is_profile'] as bool?,
        profileId: data['profile_id'] as String?,
        profileOwnerName: data['profile_owner_name'] as String?,
        reporterId: data['reporter_id'] as String?,
      );

  static ReportingDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ReportingDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'post_id': _postId,
        'post_title': _postTitle,
        'is_profile': _isProfile,
        'profile_id': _profileId,
        'profile_owner_name': _profileOwnerName,
        'reporter_id': _reporterId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'post_id': serializeParam(
          _postId,
          ParamType.String,
        ),
        'post_title': serializeParam(
          _postTitle,
          ParamType.String,
        ),
        'is_profile': serializeParam(
          _isProfile,
          ParamType.bool,
        ),
        'profile_id': serializeParam(
          _profileId,
          ParamType.String,
        ),
        'profile_owner_name': serializeParam(
          _profileOwnerName,
          ParamType.String,
        ),
        'reporter_id': serializeParam(
          _reporterId,
          ParamType.String,
        ),
      }.withoutNulls;

  static ReportingDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ReportingDataStruct(
        postId: deserializeParam(
          data['post_id'],
          ParamType.String,
          false,
        ),
        postTitle: deserializeParam(
          data['post_title'],
          ParamType.String,
          false,
        ),
        isProfile: deserializeParam(
          data['is_profile'],
          ParamType.bool,
          false,
        ),
        profileId: deserializeParam(
          data['profile_id'],
          ParamType.String,
          false,
        ),
        profileOwnerName: deserializeParam(
          data['profile_owner_name'],
          ParamType.String,
          false,
        ),
        reporterId: deserializeParam(
          data['reporter_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ReportingDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ReportingDataStruct &&
        postId == other.postId &&
        postTitle == other.postTitle &&
        isProfile == other.isProfile &&
        profileId == other.profileId &&
        profileOwnerName == other.profileOwnerName &&
        reporterId == other.reporterId;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [postId, postTitle, isProfile, profileId, profileOwnerName, reporterId]);
}

ReportingDataStruct createReportingDataStruct({
  String? postId,
  String? postTitle,
  bool? isProfile,
  String? profileId,
  String? profileOwnerName,
  String? reporterId,
}) =>
    ReportingDataStruct(
      postId: postId,
      postTitle: postTitle,
      isProfile: isProfile,
      profileId: profileId,
      profileOwnerName: profileOwnerName,
      reporterId: reporterId,
    );
