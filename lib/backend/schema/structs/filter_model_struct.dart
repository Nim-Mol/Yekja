// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FilterModelStruct extends BaseStruct {
  FilterModelStruct({
    int? mainCatId,
    String? userCity,
    int? catId,
    String? catName,
    int? subCatId,
    String? subCatName,
    bool? hasImages,
    List<int>? exchangeWishlistId,
    bool? yekjaVerified,
    String? searchVec,
    String? title,
    String? description,
    int? postLikes,
    List<String>? images,
    String? sourceId,
  })  : _mainCatId = mainCatId,
        _userCity = userCity,
        _catId = catId,
        _catName = catName,
        _subCatId = subCatId,
        _subCatName = subCatName,
        _hasImages = hasImages,
        _exchangeWishlistId = exchangeWishlistId,
        _yekjaVerified = yekjaVerified,
        _searchVec = searchVec,
        _title = title,
        _description = description,
        _postLikes = postLikes,
        _images = images,
        _sourceId = sourceId;

  // "main_cat_id" field.
  int? _mainCatId;
  int get mainCatId => _mainCatId ?? 0;
  set mainCatId(int? val) => _mainCatId = val;

  void incrementMainCatId(int amount) => mainCatId = mainCatId + amount;

  bool hasMainCatId() => _mainCatId != null;

  // "user_city" field.
  String? _userCity;
  String get userCity => _userCity ?? '';
  set userCity(String? val) => _userCity = val;

  bool hasUserCity() => _userCity != null;

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

  // "has_images" field.
  bool? _hasImages;
  bool get hasImages => _hasImages ?? false;
  set hasImages(bool? val) => _hasImages = val;

  bool hasHasImages() => _hasImages != null;

  // "exchange_wishlist_id" field.
  List<int>? _exchangeWishlistId;
  List<int> get exchangeWishlistId => _exchangeWishlistId ?? const [];
  set exchangeWishlistId(List<int>? val) => _exchangeWishlistId = val;

  void updateExchangeWishlistId(Function(List<int>) updateFn) {
    updateFn(_exchangeWishlistId ??= []);
  }

  bool hasExchangeWishlistId() => _exchangeWishlistId != null;

  // "YekjaVerified" field.
  bool? _yekjaVerified;
  bool get yekjaVerified => _yekjaVerified ?? true;
  set yekjaVerified(bool? val) => _yekjaVerified = val;

  bool hasYekjaVerified() => _yekjaVerified != null;

  // "search_vec" field.
  String? _searchVec;
  String get searchVec => _searchVec ?? '';
  set searchVec(String? val) => _searchVec = val;

  bool hasSearchVec() => _searchVec != null;

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

  // "source_id" field.
  String? _sourceId;
  String get sourceId => _sourceId ?? '';
  set sourceId(String? val) => _sourceId = val;

  bool hasSourceId() => _sourceId != null;

  static FilterModelStruct fromMap(Map<String, dynamic> data) =>
      FilterModelStruct(
        mainCatId: castToType<int>(data['main_cat_id']),
        userCity: data['user_city'] as String?,
        catId: castToType<int>(data['cat_id']),
        catName: data['cat_name'] as String?,
        subCatId: castToType<int>(data['sub_cat_id']),
        subCatName: data['sub_cat_name'] as String?,
        hasImages: data['has_images'] as bool?,
        exchangeWishlistId: getDataList(data['exchange_wishlist_id']),
        yekjaVerified: data['YekjaVerified'] as bool?,
        searchVec: data['search_vec'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        postLikes: castToType<int>(data['post_likes']),
        images: getDataList(data['images']),
        sourceId: data['source_id'] as String?,
      );

  static FilterModelStruct? maybeFromMap(dynamic data) => data is Map
      ? FilterModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'main_cat_id': _mainCatId,
        'user_city': _userCity,
        'cat_id': _catId,
        'cat_name': _catName,
        'sub_cat_id': _subCatId,
        'sub_cat_name': _subCatName,
        'has_images': _hasImages,
        'exchange_wishlist_id': _exchangeWishlistId,
        'YekjaVerified': _yekjaVerified,
        'search_vec': _searchVec,
        'title': _title,
        'description': _description,
        'post_likes': _postLikes,
        'images': _images,
        'source_id': _sourceId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'main_cat_id': serializeParam(
          _mainCatId,
          ParamType.int,
        ),
        'user_city': serializeParam(
          _userCity,
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
        'sub_cat_id': serializeParam(
          _subCatId,
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
        'exchange_wishlist_id': serializeParam(
          _exchangeWishlistId,
          ParamType.int,
          isList: true,
        ),
        'YekjaVerified': serializeParam(
          _yekjaVerified,
          ParamType.bool,
        ),
        'search_vec': serializeParam(
          _searchVec,
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
        'post_likes': serializeParam(
          _postLikes,
          ParamType.int,
        ),
        'images': serializeParam(
          _images,
          ParamType.String,
          isList: true,
        ),
        'source_id': serializeParam(
          _sourceId,
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
        userCity: deserializeParam(
          data['user_city'],
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
        hasImages: deserializeParam(
          data['has_images'],
          ParamType.bool,
          false,
        ),
        exchangeWishlistId: deserializeParam<int>(
          data['exchange_wishlist_id'],
          ParamType.int,
          true,
        ),
        yekjaVerified: deserializeParam(
          data['YekjaVerified'],
          ParamType.bool,
          false,
        ),
        searchVec: deserializeParam(
          data['search_vec'],
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
        sourceId: deserializeParam(
          data['source_id'],
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
        userCity == other.userCity &&
        catId == other.catId &&
        catName == other.catName &&
        subCatId == other.subCatId &&
        subCatName == other.subCatName &&
        hasImages == other.hasImages &&
        listEquality.equals(exchangeWishlistId, other.exchangeWishlistId) &&
        yekjaVerified == other.yekjaVerified &&
        searchVec == other.searchVec &&
        title == other.title &&
        description == other.description &&
        postLikes == other.postLikes &&
        listEquality.equals(images, other.images) &&
        sourceId == other.sourceId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        mainCatId,
        userCity,
        catId,
        catName,
        subCatId,
        subCatName,
        hasImages,
        exchangeWishlistId,
        yekjaVerified,
        searchVec,
        title,
        description,
        postLikes,
        images,
        sourceId
      ]);
}

FilterModelStruct createFilterModelStruct({
  int? mainCatId,
  String? userCity,
  int? catId,
  String? catName,
  int? subCatId,
  String? subCatName,
  bool? hasImages,
  bool? yekjaVerified,
  String? searchVec,
  String? title,
  String? description,
  int? postLikes,
  String? sourceId,
}) =>
    FilterModelStruct(
      mainCatId: mainCatId,
      userCity: userCity,
      catId: catId,
      catName: catName,
      subCatId: subCatId,
      subCatName: subCatName,
      hasImages: hasImages,
      yekjaVerified: yekjaVerified,
      searchVec: searchVec,
      title: title,
      description: description,
      postLikes: postLikes,
      sourceId: sourceId,
    );
