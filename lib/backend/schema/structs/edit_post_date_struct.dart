// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EditPostDateStruct extends BaseStruct {
  EditPostDateStruct({
    String? city,
    String? description,
    String? title,
    List<String>? imags,
    bool? isModified,
  })  : _city = city,
        _description = description,
        _title = title,
        _imags = imags,
        _isModified = isModified;

  // "City" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "Imags" field.
  List<String>? _imags;
  List<String> get imags => _imags ?? const [];
  set imags(List<String>? val) => _imags = val;

  void updateImags(Function(List<String>) updateFn) {
    updateFn(_imags ??= []);
  }

  bool hasImags() => _imags != null;

  // "IsModified" field.
  bool? _isModified;
  bool get isModified => _isModified ?? false;
  set isModified(bool? val) => _isModified = val;

  bool hasIsModified() => _isModified != null;

  static EditPostDateStruct fromMap(Map<String, dynamic> data) =>
      EditPostDateStruct(
        city: data['City'] as String?,
        description: data['Description'] as String?,
        title: data['Title'] as String?,
        imags: getDataList(data['Imags']),
        isModified: data['IsModified'] as bool?,
      );

  static EditPostDateStruct? maybeFromMap(dynamic data) => data is Map
      ? EditPostDateStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'City': _city,
        'Description': _description,
        'Title': _title,
        'Imags': _imags,
        'IsModified': _isModified,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'City': serializeParam(
          _city,
          ParamType.String,
        ),
        'Description': serializeParam(
          _description,
          ParamType.String,
        ),
        'Title': serializeParam(
          _title,
          ParamType.String,
        ),
        'Imags': serializeParam(
          _imags,
          ParamType.String,
          isList: true,
        ),
        'IsModified': serializeParam(
          _isModified,
          ParamType.bool,
        ),
      }.withoutNulls;

  static EditPostDateStruct fromSerializableMap(Map<String, dynamic> data) =>
      EditPostDateStruct(
        city: deserializeParam(
          data['City'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['Description'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['Title'],
          ParamType.String,
          false,
        ),
        imags: deserializeParam<String>(
          data['Imags'],
          ParamType.String,
          true,
        ),
        isModified: deserializeParam(
          data['IsModified'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'EditPostDateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is EditPostDateStruct &&
        city == other.city &&
        description == other.description &&
        title == other.title &&
        listEquality.equals(imags, other.imags) &&
        isModified == other.isModified;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([city, description, title, imags, isModified]);
}

EditPostDateStruct createEditPostDateStruct({
  String? city,
  String? description,
  String? title,
  bool? isModified,
}) =>
    EditPostDateStruct(
      city: city,
      description: description,
      title: title,
      isModified: isModified,
    );
