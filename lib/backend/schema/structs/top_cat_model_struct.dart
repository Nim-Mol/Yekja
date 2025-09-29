// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TopCatModelStruct extends BaseStruct {
  TopCatModelStruct({
    int? mainCatId,
    String? mainCatName,
    int? catId,
    String? catName,
    int? subCatId,
    int? uniqueSubcatId,
    String? subCatName,
    int? totalLikes,
  })  : _mainCatId = mainCatId,
        _mainCatName = mainCatName,
        _catId = catId,
        _catName = catName,
        _subCatId = subCatId,
        _uniqueSubcatId = uniqueSubcatId,
        _subCatName = subCatName,
        _totalLikes = totalLikes;

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

  // "total_likes" field.
  int? _totalLikes;
  int get totalLikes => _totalLikes ?? 0;
  set totalLikes(int? val) => _totalLikes = val;

  void incrementTotalLikes(int amount) => totalLikes = totalLikes + amount;

  bool hasTotalLikes() => _totalLikes != null;

  static TopCatModelStruct fromMap(Map<String, dynamic> data) =>
      TopCatModelStruct(
        mainCatId: castToType<int>(data['main_cat_id']),
        mainCatName: data['main_cat_name'] as String?,
        catId: castToType<int>(data['cat_id']),
        catName: data['cat_name'] as String?,
        subCatId: castToType<int>(data['sub_cat_id']),
        uniqueSubcatId: castToType<int>(data['unique_subcat_id']),
        subCatName: data['sub_cat_name'] as String?,
        totalLikes: castToType<int>(data['total_likes']),
      );

  static TopCatModelStruct? maybeFromMap(dynamic data) => data is Map
      ? TopCatModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'main_cat_id': _mainCatId,
        'main_cat_name': _mainCatName,
        'cat_id': _catId,
        'cat_name': _catName,
        'sub_cat_id': _subCatId,
        'unique_subcat_id': _uniqueSubcatId,
        'sub_cat_name': _subCatName,
        'total_likes': _totalLikes,
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
        'total_likes': serializeParam(
          _totalLikes,
          ParamType.int,
        ),
      }.withoutNulls;

  static TopCatModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      TopCatModelStruct(
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
        totalLikes: deserializeParam(
          data['total_likes'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'TopCatModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TopCatModelStruct &&
        mainCatId == other.mainCatId &&
        mainCatName == other.mainCatName &&
        catId == other.catId &&
        catName == other.catName &&
        subCatId == other.subCatId &&
        uniqueSubcatId == other.uniqueSubcatId &&
        subCatName == other.subCatName &&
        totalLikes == other.totalLikes;
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
        totalLikes
      ]);
}

TopCatModelStruct createTopCatModelStruct({
  int? mainCatId,
  String? mainCatName,
  int? catId,
  String? catName,
  int? subCatId,
  int? uniqueSubcatId,
  String? subCatName,
  int? totalLikes,
}) =>
    TopCatModelStruct(
      mainCatId: mainCatId,
      mainCatName: mainCatName,
      catId: catId,
      catName: catName,
      subCatId: subCatId,
      uniqueSubcatId: uniqueSubcatId,
      subCatName: subCatName,
      totalLikes: totalLikes,
    );
