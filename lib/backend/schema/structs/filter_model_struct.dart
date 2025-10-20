// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FilterModelStruct extends BaseStruct {
  FilterModelStruct({
    int? mainCatId,
    String? postId,
    String? catName,
    String? city,
    int? catId,
    int? subCatId,
    int? cityId,
    String? subCatName,
    bool? hasImages,
    bool? yekjaVerified,
    String? title,
    String? description,
    int? postLikes,
    List<String>? images,
    String? detailTable,
    String? userId,
    String? userName,
    int? uniqueSubcatId,
    String? mainCatName,
    bool? reported,
    String? createdAt,
  })  : _mainCatId = mainCatId,
        _postId = postId,
        _catName = catName,
        _city = city,
        _catId = catId,
        _subCatId = subCatId,
        _cityId = cityId,
        _subCatName = subCatName,
        _hasImages = hasImages,
        _yekjaVerified = yekjaVerified,
        _title = title,
        _description = description,
        _postLikes = postLikes,
        _images = images,
        _detailTable = detailTable,
        _userId = userId,
        _userName = userName,
        _uniqueSubcatId = uniqueSubcatId,
        _mainCatName = mainCatName,
        _reported = reported,
        _createdAt = createdAt;

  // "main_cat_id" field.
  int? _mainCatId;
  int get mainCatId => _mainCatId ?? 0;
  set mainCatId(int? val) => _mainCatId = val;

  void incrementMainCatId(int amount) => mainCatId = mainCatId + amount;

  bool hasMainCatId() => _mainCatId != null;

  // "post_id" field.
  String? _postId;
  String get postId => _postId ?? '';
  set postId(String? val) => _postId = val;

  bool hasPostId() => _postId != null;

  // "cat_name" field.
  String? _catName;
  String get catName => _catName ?? '';
  set catName(String? val) => _catName = val;

  bool hasCatName() => _catName != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  // "cat_id" field.
  int? _catId;
  int get catId => _catId ?? 0;
  set catId(int? val) => _catId = val;

  void incrementCatId(int amount) => catId = catId + amount;

  bool hasCatId() => _catId != null;

  // "sub_cat_id" field.
  int? _subCatId;
  int get subCatId => _subCatId ?? 0;
  set subCatId(int? val) => _subCatId = val;

  void incrementSubCatId(int amount) => subCatId = subCatId + amount;

  bool hasSubCatId() => _subCatId != null;

  // "city_id" field.
  int? _cityId;
  int get cityId => _cityId ?? 0;
  set cityId(int? val) => _cityId = val;

  void incrementCityId(int amount) => cityId = cityId + amount;

  bool hasCityId() => _cityId != null;

  // "sub_cat_name" field.
  String? _subCatName;
  String get subCatName => _subCatName ?? '';
  set subCatName(String? val) => _subCatName = val;

  bool hasSubCatName() => _subCatName != null;

  // "has_images" field.
  bool? _hasImages;
  bool get hasImages => _hasImages ?? false;
  set hasImages(bool? val) => _hasImages = val;

  bool hasHasImages() => _hasImages != null;

  // "yekja_verified" field.
  bool? _yekjaVerified;
  bool get yekjaVerified => _yekjaVerified ?? true;
  set yekjaVerified(bool? val) => _yekjaVerified = val;

  bool hasYekjaVerified() => _yekjaVerified != null;

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

  // "post_likes" field.
  int? _postLikes;
  int get postLikes => _postLikes ?? 0;
  set postLikes(int? val) => _postLikes = val;

  void incrementPostLikes(int amount) => postLikes = postLikes + amount;

  bool hasPostLikes() => _postLikes != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  set images(List<String>? val) => _images = val;

  void updateImages(Function(List<String>) updateFn) {
    updateFn(_images ??= []);
  }

  bool hasImagesField() => _images != null;

  // "detail_table" field.
  String? _detailTable;
  String get detailTable => _detailTable ?? '';
  set detailTable(String? val) => _detailTable = val;

  bool hasDetailTable() => _detailTable != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;

  bool hasUserName() => _userName != null;

  // "unique_subcat_id" field.
  int? _uniqueSubcatId;
  int get uniqueSubcatId => _uniqueSubcatId ?? 0;
  set uniqueSubcatId(int? val) => _uniqueSubcatId = val;

  void incrementUniqueSubcatId(int amount) =>
      uniqueSubcatId = uniqueSubcatId + amount;

  bool hasUniqueSubcatId() => _uniqueSubcatId != null;

  // "main_cat_name" field.
  String? _mainCatName;
  String get mainCatName => _mainCatName ?? '';
  set mainCatName(String? val) => _mainCatName = val;

  bool hasMainCatName() => _mainCatName != null;

  // "reported" field.
  bool? _reported;
  bool get reported => _reported ?? false;
  set reported(bool? val) => _reported = val;

  bool hasReported() => _reported != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  static FilterModelStruct fromMap(Map<String, dynamic> data) =>
      FilterModelStruct(
        mainCatId: castToType<int>(data['main_cat_id']),
        postId: data['post_id'] as String?,
        catName: data['cat_name'] as String?,
        city: data['city'] as String?,
        catId: castToType<int>(data['cat_id']),
        subCatId: castToType<int>(data['sub_cat_id']),
        cityId: castToType<int>(data['city_id']),
        subCatName: data['sub_cat_name'] as String?,
        hasImages: data['has_images'] as bool?,
        yekjaVerified: data['yekja_verified'] as bool?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        postLikes: castToType<int>(data['post_likes']),
        images: getDataList(data['images']),
        detailTable: data['detail_table'] as String?,
        userId: data['user_id'] as String?,
        userName: data['user_name'] as String?,
        uniqueSubcatId: castToType<int>(data['unique_subcat_id']),
        mainCatName: data['main_cat_name'] as String?,
        reported: data['reported'] as bool?,
        createdAt: data['created_at'] as String?,
      );

  static FilterModelStruct? maybeFromMap(dynamic data) => data is Map
      ? FilterModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'main_cat_id': _mainCatId,
        'post_id': _postId,
        'cat_name': _catName,
        'city': _city,
        'cat_id': _catId,
        'sub_cat_id': _subCatId,
        'city_id': _cityId,
        'sub_cat_name': _subCatName,
        'has_images': _hasImages,
        'yekja_verified': _yekjaVerified,
        'title': _title,
        'description': _description,
        'post_likes': _postLikes,
        'images': _images,
        'detail_table': _detailTable,
        'user_id': _userId,
        'user_name': _userName,
        'unique_subcat_id': _uniqueSubcatId,
        'main_cat_name': _mainCatName,
        'reported': _reported,
        'created_at': _createdAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'main_cat_id': serializeParam(
          _mainCatId,
          ParamType.int,
        ),
        'post_id': serializeParam(
          _postId,
          ParamType.String,
        ),
        'cat_name': serializeParam(
          _catName,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'cat_id': serializeParam(
          _catId,
          ParamType.int,
        ),
        'sub_cat_id': serializeParam(
          _subCatId,
          ParamType.int,
        ),
        'city_id': serializeParam(
          _cityId,
          ParamType.int,
        ),
        'sub_cat_name': serializeParam(
          _subCatName,
          ParamType.String,
        ),
        'has_images': serializeParam(
          _hasImages,
          ParamType.bool,
        ),
        'yekja_verified': serializeParam(
          _yekjaVerified,
          ParamType.bool,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'post_likes': serializeParam(
          _postLikes,
          ParamType.int,
        ),
        'images': serializeParam(
          _images,
          ParamType.String,
          isList: true,
        ),
        'detail_table': serializeParam(
          _detailTable,
          ParamType.String,
        ),
        'user_id': serializeParam(
          _userId,
          ParamType.String,
        ),
        'user_name': serializeParam(
          _userName,
          ParamType.String,
        ),
        'unique_subcat_id': serializeParam(
          _uniqueSubcatId,
          ParamType.int,
        ),
        'main_cat_name': serializeParam(
          _mainCatName,
          ParamType.String,
        ),
        'reported': serializeParam(
          _reported,
          ParamType.bool,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
      }.withoutNulls;

  static FilterModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      FilterModelStruct(
        mainCatId: deserializeParam(
          data['main_cat_id'],
          ParamType.int,
          false,
        ),
        postId: deserializeParam(
          data['post_id'],
          ParamType.String,
          false,
        ),
        catName: deserializeParam(
          data['cat_name'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        catId: deserializeParam(
          data['cat_id'],
          ParamType.int,
          false,
        ),
        subCatId: deserializeParam(
          data['sub_cat_id'],
          ParamType.int,
          false,
        ),
        cityId: deserializeParam(
          data['city_id'],
          ParamType.int,
          false,
        ),
        subCatName: deserializeParam(
          data['sub_cat_name'],
          ParamType.String,
          false,
        ),
        hasImages: deserializeParam(
          data['has_images'],
          ParamType.bool,
          false,
        ),
        yekjaVerified: deserializeParam(
          data['yekja_verified'],
          ParamType.bool,
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
        postLikes: deserializeParam(
          data['post_likes'],
          ParamType.int,
          false,
        ),
        images: deserializeParam<String>(
          data['images'],
          ParamType.String,
          true,
        ),
        detailTable: deserializeParam(
          data['detail_table'],
          ParamType.String,
          false,
        ),
        userId: deserializeParam(
          data['user_id'],
          ParamType.String,
          false,
        ),
        userName: deserializeParam(
          data['user_name'],
          ParamType.String,
          false,
        ),
        uniqueSubcatId: deserializeParam(
          data['unique_subcat_id'],
          ParamType.int,
          false,
        ),
        mainCatName: deserializeParam(
          data['main_cat_name'],
          ParamType.String,
          false,
        ),
        reported: deserializeParam(
          data['reported'],
          ParamType.bool,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FilterModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is FilterModelStruct &&
        mainCatId == other.mainCatId &&
        postId == other.postId &&
        catName == other.catName &&
        city == other.city &&
        catId == other.catId &&
        subCatId == other.subCatId &&
        cityId == other.cityId &&
        subCatName == other.subCatName &&
        hasImages == other.hasImages &&
        yekjaVerified == other.yekjaVerified &&
        title == other.title &&
        description == other.description &&
        postLikes == other.postLikes &&
        listEquality.equals(images, other.images) &&
        detailTable == other.detailTable &&
        userId == other.userId &&
        userName == other.userName &&
        uniqueSubcatId == other.uniqueSubcatId &&
        mainCatName == other.mainCatName &&
        reported == other.reported &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode => const ListEquality().hash([
        mainCatId,
        postId,
        catName,
        city,
        catId,
        subCatId,
        cityId,
        subCatName,
        hasImages,
        yekjaVerified,
        title,
        description,
        postLikes,
        images,
        detailTable,
        userId,
        userName,
        uniqueSubcatId,
        mainCatName,
        reported,
        createdAt
      ]);
}

FilterModelStruct createFilterModelStruct({
  int? mainCatId,
  String? postId,
  String? catName,
  String? city,
  int? catId,
  int? subCatId,
  int? cityId,
  String? subCatName,
  bool? hasImages,
  bool? yekjaVerified,
  String? title,
  String? description,
  int? postLikes,
  String? detailTable,
  String? userId,
  String? userName,
  int? uniqueSubcatId,
  String? mainCatName,
  bool? reported,
  String? createdAt,
}) =>
    FilterModelStruct(
      mainCatId: mainCatId,
      postId: postId,
      catName: catName,
      city: city,
      catId: catId,
      subCatId: subCatId,
      cityId: cityId,
      subCatName: subCatName,
      hasImages: hasImages,
      yekjaVerified: yekjaVerified,
      title: title,
      description: description,
      postLikes: postLikes,
      detailTable: detailTable,
      userId: userId,
      userName: userName,
      uniqueSubcatId: uniqueSubcatId,
      mainCatName: mainCatName,
      reported: reported,
      createdAt: createdAt,
    );
