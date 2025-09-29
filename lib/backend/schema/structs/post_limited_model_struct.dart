// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostLimitedModelStruct extends BaseStruct {
  PostLimitedModelStruct({
    int? postId,
    String? postTitle,
    String? postOwnerId,
    String? postOwnerName,
  })  : _postId = postId,
        _postTitle = postTitle,
        _postOwnerId = postOwnerId,
        _postOwnerName = postOwnerName;

  // "post_id" field.
  int? _postId;
  int get postId => _postId ?? 0;
  set postId(int? val) => _postId = val;

  void incrementPostId(int amount) => postId = postId + amount;

  bool hasPostId() => _postId != null;

  // "post_title" field.
  String? _postTitle;
  String get postTitle => _postTitle ?? '';
  set postTitle(String? val) => _postTitle = val;

  bool hasPostTitle() => _postTitle != null;

  // "post_owner_id" field.
  String? _postOwnerId;
  String get postOwnerId => _postOwnerId ?? '';
  set postOwnerId(String? val) => _postOwnerId = val;

  bool hasPostOwnerId() => _postOwnerId != null;

  // "post_owner_name" field.
  String? _postOwnerName;
  String get postOwnerName => _postOwnerName ?? '';
  set postOwnerName(String? val) => _postOwnerName = val;

  bool hasPostOwnerName() => _postOwnerName != null;

  static PostLimitedModelStruct fromMap(Map<String, dynamic> data) =>
      PostLimitedModelStruct(
        postId: castToType<int>(data['post_id']),
        postTitle: data['post_title'] as String?,
        postOwnerId: data['post_owner_id'] as String?,
        postOwnerName: data['post_owner_name'] as String?,
      );

  static PostLimitedModelStruct? maybeFromMap(dynamic data) => data is Map
      ? PostLimitedModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'post_id': _postId,
        'post_title': _postTitle,
        'post_owner_id': _postOwnerId,
        'post_owner_name': _postOwnerName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'post_id': serializeParam(
          _postId,
          ParamType.int,
        ),
        'post_title': serializeParam(
          _postTitle,
          ParamType.String,
        ),
        'post_owner_id': serializeParam(
          _postOwnerId,
          ParamType.String,
        ),
        'post_owner_name': serializeParam(
          _postOwnerName,
          ParamType.String,
        ),
      }.withoutNulls;

  static PostLimitedModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PostLimitedModelStruct(
        postId: deserializeParam(
          data['post_id'],
          ParamType.int,
          false,
        ),
        postTitle: deserializeParam(
          data['post_title'],
          ParamType.String,
          false,
        ),
        postOwnerId: deserializeParam(
          data['post_owner_id'],
          ParamType.String,
          false,
        ),
        postOwnerName: deserializeParam(
          data['post_owner_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PostLimitedModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PostLimitedModelStruct &&
        postId == other.postId &&
        postTitle == other.postTitle &&
        postOwnerId == other.postOwnerId &&
        postOwnerName == other.postOwnerName;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([postId, postTitle, postOwnerId, postOwnerName]);
}

PostLimitedModelStruct createPostLimitedModelStruct({
  int? postId,
  String? postTitle,
  String? postOwnerId,
  String? postOwnerName,
}) =>
    PostLimitedModelStruct(
      postId: postId,
      postTitle: postTitle,
      postOwnerId: postOwnerId,
      postOwnerName: postOwnerName,
    );
