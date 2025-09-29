// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CitiesModelStruct extends BaseStruct {
  CitiesModelStruct({
    int? id,
    String? name,
    int? provinceId,
    String? province,
  })  : _id = id,
        _name = name,
        _provinceId = provinceId,
        _province = province;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "province_id" field.
  int? _provinceId;
  int get provinceId => _provinceId ?? 0;
  set provinceId(int? val) => _provinceId = val;

  void incrementProvinceId(int amount) => provinceId = provinceId + amount;

  bool hasProvinceId() => _provinceId != null;

  // "province" field.
  String? _province;
  String get province => _province ?? '';
  set province(String? val) => _province = val;

  bool hasProvince() => _province != null;

  static CitiesModelStruct fromMap(Map<String, dynamic> data) =>
      CitiesModelStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        provinceId: castToType<int>(data['province_id']),
        province: data['province'] as String?,
      );

  static CitiesModelStruct? maybeFromMap(dynamic data) => data is Map
      ? CitiesModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'province_id': _provinceId,
        'province': _province,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'province_id': serializeParam(
          _provinceId,
          ParamType.int,
        ),
        'province': serializeParam(
          _province,
          ParamType.String,
        ),
      }.withoutNulls;

  static CitiesModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      CitiesModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        provinceId: deserializeParam(
          data['province_id'],
          ParamType.int,
          false,
        ),
        province: deserializeParam(
          data['province'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CitiesModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CitiesModelStruct &&
        id == other.id &&
        name == other.name &&
        provinceId == other.provinceId &&
        province == other.province;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, name, provinceId, province]);
}

CitiesModelStruct createCitiesModelStruct({
  int? id,
  String? name,
  int? provinceId,
  String? province,
}) =>
    CitiesModelStruct(
      id: id,
      name: name,
      provinceId: provinceId,
      province: province,
    );
