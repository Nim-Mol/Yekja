// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SearchModelStruct extends BaseStruct {
  SearchModelStruct({
    String? name,
  }) : _name = name;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  static SearchModelStruct fromMap(Map<String, dynamic> data) =>
      SearchModelStruct(
        name: data['name'] as String?,
      );

  static SearchModelStruct? maybeFromMap(dynamic data) => data is Map
      ? SearchModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static SearchModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      SearchModelStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SearchModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SearchModelStruct && name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([name]);
}

SearchModelStruct createSearchModelStruct({
  String? name,
}) =>
    SearchModelStruct(
      name: name,
    );
