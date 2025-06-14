// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FilterModelStruct extends BaseStruct {
  FilterModelStruct({
    String? name,
    String? image,
  })  : _name = name,
        _image = image;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  static FilterModelStruct fromMap(Map<String, dynamic> data) =>
      FilterModelStruct(
        name: data['name'] as String?,
        image: data['image'] as String?,
      );

  static FilterModelStruct? maybeFromMap(dynamic data) => data is Map
      ? FilterModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'image': _image,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
      }.withoutNulls;

  static FilterModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      FilterModelStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FilterModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FilterModelStruct &&
        name == other.name &&
        image == other.image;
  }

  @override
  int get hashCode => const ListEquality().hash([name, image]);
}

FilterModelStruct createFilterModelStruct({
  String? name,
  String? image,
}) =>
    FilterModelStruct(
      name: name,
      image: image,
    );
