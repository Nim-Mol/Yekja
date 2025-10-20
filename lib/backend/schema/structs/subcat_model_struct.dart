// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubcatModelStruct extends BaseStruct {
  SubcatModelStruct({
    int? mainCatId,
    String? mainCatName,
    int? catId,
    String? catName,
    int? subCatId,
    int? uniqueSubcatId,
    String? subCatName,
    String? effectiveColorHex,
    String? effectiveIconImage,
    int? totalLikes,
    int? catPostCount,
    int? catPostLikes,
  })  : _mainCatId = mainCatId,
        _mainCatName = mainCatName,
        _catId = catId,
        _catName = catName,
        _subCatId = subCatId,
        _uniqueSubcatId = uniqueSubcatId,
        _subCatName = subCatName,
        _effectiveColorHex = effectiveColorHex,
        _effectiveIconImage = effectiveIconImage,
        _totalLikes = totalLikes,
        _catPostCount = catPostCount,
        _catPostLikes = catPostLikes;

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

  // "unique_subcat_id" field.
  int? _uniqueSubcatId;
  int get uniqueSubcatId => _uniqueSubcatId ?? 0;
  set uniqueSubcatId(int? val) => _uniqueSubcatId = val;

  void incrementUniqueSubcatId(int amount) =>
      uniqueSubcatId = uniqueSubcatId + amount;

  bool hasUniqueSubcatId() => _uniqueSubcatId != null;

  // "sub_cat_name" field.
  String? _subCatName;
  String get subCatName => _subCatName ?? '';
  set subCatName(String? val) => _subCatName = val;

  bool hasSubCatName() => _subCatName != null;

  // "effective_color_hex" field.
  String? _effectiveColorHex;
  String get effectiveColorHex => _effectiveColorHex ?? '';
  set effectiveColorHex(String? val) => _effectiveColorHex = val;

  bool hasEffectiveColorHex() => _effectiveColorHex != null;

  // "effective_icon_image" field.
  String? _effectiveIconImage;
  String get effectiveIconImage => _effectiveIconImage ?? '';
  set effectiveIconImage(String? val) => _effectiveIconImage = val;

  bool hasEffectiveIconImage() => _effectiveIconImage != null;

  // "total_likes" field.
  int? _totalLikes;
  int get totalLikes => _totalLikes ?? 0;
  set totalLikes(int? val) => _totalLikes = val;

  void incrementTotalLikes(int amount) => totalLikes = totalLikes + amount;

  bool hasTotalLikes() => _totalLikes != null;

  // "cat_post_count" field.
  int? _catPostCount;
  int get catPostCount => _catPostCount ?? 0;
  set catPostCount(int? val) => _catPostCount = val;

  void incrementCatPostCount(int amount) =>
      catPostCount = catPostCount + amount;

  bool hasCatPostCount() => _catPostCount != null;

  // "cat_post_likes" field.
  int? _catPostLikes;
  int get catPostLikes => _catPostLikes ?? 0;
  set catPostLikes(int? val) => _catPostLikes = val;

  void incrementCatPostLikes(int amount) =>
      catPostLikes = catPostLikes + amount;

  bool hasCatPostLikes() => _catPostLikes != null;

  static SubcatModelStruct fromMap(Map<String, dynamic> data) =>
      SubcatModelStruct(
        mainCatId: castToType<int>(data['main_cat_id']),
        mainCatName: data['main_cat_name'] as String?,
        catId: castToType<int>(data['cat_id']),
        catName: data['cat_name'] as String?,
        subCatId: castToType<int>(data['sub_cat_id']),
        uniqueSubcatId: castToType<int>(data['unique_subcat_id']),
        subCatName: data['sub_cat_name'] as String?,
        effectiveColorHex: data['effective_color_hex'] as String?,
        effectiveIconImage: data['effective_icon_image'] as String?,
        totalLikes: castToType<int>(data['total_likes']),
        catPostCount: castToType<int>(data['cat_post_count']),
        catPostLikes: castToType<int>(data['cat_post_likes']),
      );

  static SubcatModelStruct? maybeFromMap(dynamic data) => data is Map
      ? SubcatModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'main_cat_id': _mainCatId,
        'main_cat_name': _mainCatName,
        'cat_id': _catId,
        'cat_name': _catName,
        'sub_cat_id': _subCatId,
        'unique_subcat_id': _uniqueSubcatId,
        'sub_cat_name': _subCatName,
        'effective_color_hex': _effectiveColorHex,
        'effective_icon_image': _effectiveIconImage,
        'total_likes': _totalLikes,
        'cat_post_count': _catPostCount,
        'cat_post_likes': _catPostLikes,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'main_cat_id': serializeParam(
          _mainCatId,
          ParamType.int,
        ),
        'main_cat_name': serializeParam(
          _mainCatName,
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
        'unique_subcat_id': serializeParam(
          _uniqueSubcatId,
          ParamType.int,
        ),
        'sub_cat_name': serializeParam(
          _subCatName,
          ParamType.String,
        ),
        'effective_color_hex': serializeParam(
          _effectiveColorHex,
          ParamType.String,
        ),
        'effective_icon_image': serializeParam(
          _effectiveIconImage,
          ParamType.String,
        ),
        'total_likes': serializeParam(
          _totalLikes,
          ParamType.int,
        ),
        'cat_post_count': serializeParam(
          _catPostCount,
          ParamType.int,
        ),
        'cat_post_likes': serializeParam(
          _catPostLikes,
          ParamType.int,
        ),
      }.withoutNulls;

  static SubcatModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      SubcatModelStruct(
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
        uniqueSubcatId: deserializeParam(
          data['unique_subcat_id'],
          ParamType.int,
          false,
        ),
        subCatName: deserializeParam(
          data['sub_cat_name'],
          ParamType.String,
          false,
        ),
        effectiveColorHex: deserializeParam(
          data['effective_color_hex'],
          ParamType.String,
          false,
        ),
        effectiveIconImage: deserializeParam(
          data['effective_icon_image'],
          ParamType.String,
          false,
        ),
        totalLikes: deserializeParam(
          data['total_likes'],
          ParamType.int,
          false,
        ),
        catPostCount: deserializeParam(
          data['cat_post_count'],
          ParamType.int,
          false,
        ),
        catPostLikes: deserializeParam(
          data['cat_post_likes'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'SubcatModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SubcatModelStruct &&
        mainCatId == other.mainCatId &&
        mainCatName == other.mainCatName &&
        catId == other.catId &&
        catName == other.catName &&
        subCatId == other.subCatId &&
        uniqueSubcatId == other.uniqueSubcatId &&
        subCatName == other.subCatName &&
        effectiveColorHex == other.effectiveColorHex &&
        effectiveIconImage == other.effectiveIconImage &&
        totalLikes == other.totalLikes &&
        catPostCount == other.catPostCount &&
        catPostLikes == other.catPostLikes;
  }

  @override
  int get hashCode => const ListEquality().hash([
        mainCatId,
        mainCatName,
        catId,
        catName,
        subCatId,
        uniqueSubcatId,
        subCatName,
        effectiveColorHex,
        effectiveIconImage,
        totalLikes,
        catPostCount,
        catPostLikes
      ]);
}

SubcatModelStruct createSubcatModelStruct({
  int? mainCatId,
  String? mainCatName,
  int? catId,
  String? catName,
  int? subCatId,
  int? uniqueSubcatId,
  String? subCatName,
  String? effectiveColorHex,
  String? effectiveIconImage,
  int? totalLikes,
  int? catPostCount,
  int? catPostLikes,
}) =>
    SubcatModelStruct(
      mainCatId: mainCatId,
      mainCatName: mainCatName,
      catId: catId,
      catName: catName,
      subCatId: subCatId,
      uniqueSubcatId: uniqueSubcatId,
      subCatName: subCatName,
      effectiveColorHex: effectiveColorHex,
      effectiveIconImage: effectiveIconImage,
      totalLikes: totalLikes,
      catPostCount: catPostCount,
      catPostLikes: catPostLikes,
    );
