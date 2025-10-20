// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostModelStruct extends BaseStruct {
  PostModelStruct({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? ownerId,
    String? title,
    String? description,
    int? subCatId,
    String? subCatName,
    int? catId,
    String? catName,
    int? mainCatId,
    String? mainCatName,
    String? city,
    int? postLikes,
    bool? reported,
    List<String>? images,
  })  : _id = id,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _ownerId = ownerId,
        _title = title,
        _description = description,
        _subCatId = subCatId,
        _subCatName = subCatName,
        _catId = catId,
        _catName = catName,
        _mainCatId = mainCatId,
        _mainCatName = mainCatName,
        _city = city,
        _postLikes = postLikes,
        _reported = reported,
        _images = images;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  set updatedAt(DateTime? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  // "owner_id" field.
  String? _ownerId;
  String get ownerId => _ownerId ?? '';
  set ownerId(String? val) => _ownerId = val;

  bool hasOwnerId() => _ownerId != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "sub_cat_id" field.
  int? _subCatId;
  int get subCatId => _subCatId ?? 0;
  set subCatId(int? val) => _subCatId = val;

  void incrementSubCatId(int amount) => subCatId = subCatId + amount;

  bool hasSubCatId() => _subCatId != null;

  // "sub_cat_name" field.
  String? _subCatName;
  String get subCatName => _subCatName ?? '';
  set subCatName(String? val) => _subCatName = val;

  bool hasSubCatName() => _subCatName != null;

  // "cat_id" field.
  int? _catId;
  int get catId => _catId ?? 0;
  set catId(int? val) => _catId = val;

  void incrementCatId(int amount) => catId = catId + amount;

  bool hasCatId() => _catId != null;

  // "cat_name" field.
  String? _catName;
  String get catName => _catName ?? '';
  set catName(String? val) => _catName = val;

  bool hasCatName() => _catName != null;

  // "main_cat_id" field.
  int? _mainCatId;
  int get mainCatId => _mainCatId ?? 0;
  set mainCatId(int? val) => _mainCatId = val;

  void incrementMainCatId(int amount) => mainCatId = mainCatId + amount;

  bool hasMainCatId() => _mainCatId != null;

  // "main_cat_name" field.
  String? _mainCatName;
  String get mainCatName => _mainCatName ?? '';
  set mainCatName(String? val) => _mainCatName = val;

  bool hasMainCatName() => _mainCatName != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  // "post_likes" field.
  int? _postLikes;
  int get postLikes => _postLikes ?? 0;
  set postLikes(int? val) => _postLikes = val;

  void incrementPostLikes(int amount) => postLikes = postLikes + amount;

  bool hasPostLikes() => _postLikes != null;

  // "reported" field.
  bool? _reported;
  bool get reported => _reported ?? false;
  set reported(bool? val) => _reported = val;

  bool hasReported() => _reported != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  set images(List<String>? val) => _images = val;

  void updateImages(Function(List<String>) updateFn) {
    updateFn(_images ??= []);
  }

  bool hasImages() => _images != null;

  static PostModelStruct fromMap(Map<String, dynamic> data) => PostModelStruct(
        id: data['id'] as String?,
        createdAt: data['created_at'] as DateTime?,
        updatedAt: data['updated_at'] as DateTime?,
        ownerId: data['owner_id'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        subCatId: castToType<int>(data['sub_cat_id']),
        subCatName: data['sub_cat_name'] as String?,
        catId: castToType<int>(data['cat_id']),
        catName: data['cat_name'] as String?,
        mainCatId: castToType<int>(data['main_cat_id']),
        mainCatName: data['main_cat_name'] as String?,
        city: data['city'] as String?,
        postLikes: castToType<int>(data['post_likes']),
        reported: data['reported'] as bool?,
        images: getDataList(data['images']),
      );

  static PostModelStruct? maybeFromMap(dynamic data) => data is Map
      ? PostModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'created_at': _createdAt,
        'updated_at': _updatedAt,
        'owner_id': _ownerId,
        'title': _title,
        'description': _description,
        'sub_cat_id': _subCatId,
        'sub_cat_name': _subCatName,
        'cat_id': _catId,
        'cat_name': _catName,
        'main_cat_id': _mainCatId,
        'main_cat_name': _mainCatName,
        'city': _city,
        'post_likes': _postLikes,
        'reported': _reported,
        'images': _images,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.DateTime,
        ),
        'owner_id': serializeParam(
          _ownerId,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'sub_cat_id': serializeParam(
          _subCatId,
          ParamType.int,
        ),
        'sub_cat_name': serializeParam(
          _subCatName,
          ParamType.String,
        ),
        'cat_id': serializeParam(
          _catId,
          ParamType.int,
        ),
        'cat_name': serializeParam(
          _catName,
          ParamType.String,
        ),
        'main_cat_id': serializeParam(
          _mainCatId,
          ParamType.int,
        ),
        'main_cat_name': serializeParam(
          _mainCatName,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'post_likes': serializeParam(
          _postLikes,
          ParamType.int,
        ),
        'reported': serializeParam(
          _reported,
          ParamType.bool,
        ),
        'images': serializeParam(
          _images,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static PostModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      PostModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.DateTime,
          false,
        ),
        ownerId: deserializeParam(
          data['owner_id'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        subCatId: deserializeParam(
          data['sub_cat_id'],
          ParamType.int,
          false,
        ),
        subCatName: deserializeParam(
          data['sub_cat_name'],
          ParamType.String,
          false,
        ),
        catId: deserializeParam(
          data['cat_id'],
          ParamType.int,
          false,
        ),
        catName: deserializeParam(
          data['cat_name'],
          ParamType.String,
          false,
        ),
        mainCatId: deserializeParam(
          data['main_cat_id'],
          ParamType.int,
          false,
        ),
        mainCatName: deserializeParam(
          data['main_cat_name'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        postLikes: deserializeParam(
          data['post_likes'],
          ParamType.int,
          false,
        ),
        reported: deserializeParam(
          data['reported'],
          ParamType.bool,
          false,
        ),
        images: deserializeParam<String>(
          data['images'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'PostModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PostModelStruct &&
        id == other.id &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        ownerId == other.ownerId &&
        title == other.title &&
        description == other.description &&
        subCatId == other.subCatId &&
        subCatName == other.subCatName &&
        catId == other.catId &&
        catName == other.catName &&
        mainCatId == other.mainCatId &&
        mainCatName == other.mainCatName &&
        city == other.city &&
        postLikes == other.postLikes &&
        reported == other.reported &&
        listEquality.equals(images, other.images);
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        createdAt,
        updatedAt,
        ownerId,
        title,
        description,
        subCatId,
        subCatName,
        catId,
        catName,
        mainCatId,
        mainCatName,
        city,
        postLikes,
        reported,
        images
      ]);
}

PostModelStruct createPostModelStruct({
  String? id,
  DateTime? createdAt,
  DateTime? updatedAt,
  String? ownerId,
  String? title,
  String? description,
  int? subCatId,
  String? subCatName,
  int? catId,
  String? catName,
  int? mainCatId,
  String? mainCatName,
  String? city,
  int? postLikes,
  bool? reported,
}) =>
    PostModelStruct(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      ownerId: ownerId,
      title: title,
      description: description,
      subCatId: subCatId,
      subCatName: subCatName,
      catId: catId,
      catName: catName,
      mainCatId: mainCatId,
      mainCatName: mainCatName,
      city: city,
      postLikes: postLikes,
      reported: reported,
    );
