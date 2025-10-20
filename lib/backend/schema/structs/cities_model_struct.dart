// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CitiesModelStruct extends BaseStruct {
  CitiesModelStruct({
    int? id,
    String? name,
  })  : _id = id,
        _name = name;

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

  static CitiesModelStruct fromMap(Map<String, dynamic> data) =>
      CitiesModelStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
      );

  static CitiesModelStruct? maybeFromMap(dynamic data) => data is Map
      ? CitiesModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
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
      );

  @override
  String toString() => 'CitiesModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CitiesModelStruct && id == other.id && name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name]);
}

CitiesModelStruct createCitiesModelStruct({
  int? id,
  String? name,
}) =>
    CitiesModelStruct(
      id: id,
      name: name,
    );
