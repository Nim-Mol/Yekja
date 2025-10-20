// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FilterSmallModelStruct extends BaseStruct {
  FilterSmallModelStruct({
    int? mainCatId,
    int? catId,
  })  : _mainCatId = mainCatId,
        _catId = catId;

  // "main_cat_id" field.
  int? _mainCatId;
  int get mainCatId => _mainCatId ?? 0;
  set mainCatId(int? val) => _mainCatId = val;

  void incrementMainCatId(int amount) => mainCatId = mainCatId + amount;

  bool hasMainCatId() => _mainCatId != null;

  // "cat_id" field.
  int? _catId;
  int get catId => _catId ?? 0;
  set catId(int? val) => _catId = val;

  void incrementCatId(int amount) => catId = catId + amount;

  bool hasCatId() => _catId != null;

  static FilterSmallModelStruct fromMap(Map<String, dynamic> data) =>
      FilterSmallModelStruct(
        mainCatId: castToType<int>(data['main_cat_id']),
        catId: castToType<int>(data['cat_id']),
      );

  static FilterSmallModelStruct? maybeFromMap(dynamic data) => data is Map
      ? FilterSmallModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'main_cat_id': _mainCatId,
        'cat_id': _catId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'main_cat_id': serializeParam(
          _mainCatId,
          ParamType.int,
        ),
        'cat_id': serializeParam(
          _catId,
          ParamType.int,
        ),
      }.withoutNulls;

  static FilterSmallModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      FilterSmallModelStruct(
        mainCatId: deserializeParam(
          data['main_cat_id'],
          ParamType.int,
          false,
        ),
        catId: deserializeParam(
          data['cat_id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'FilterSmallModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FilterSmallModelStruct &&
        mainCatId == other.mainCatId &&
        catId == other.catId;
  }

  @override
  int get hashCode => const ListEquality().hash([mainCatId, catId]);
}

FilterSmallModelStruct createFilterSmallModelStruct({
  int? mainCatId,
  int? catId,
}) =>
    FilterSmallModelStruct(
      mainCatId: mainCatId,
      catId: catId,
    );
