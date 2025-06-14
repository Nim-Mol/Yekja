// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatmodelStruct extends BaseStruct {
  ChatmodelStruct({
    String? image,
    String? title,
    String? description,
    String? time,
  })  : _image = image,
        _title = title,
        _description = description,
        _time = time;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

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

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  set time(String? val) => _time = val;

  bool hasTime() => _time != null;

  static ChatmodelStruct fromMap(Map<String, dynamic> data) => ChatmodelStruct(
        image: data['image'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        time: data['time'] as String?,
      );

  static ChatmodelStruct? maybeFromMap(dynamic data) => data is Map
      ? ChatmodelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'image': _image,
        'title': _title,
        'description': _description,
        'time': _time,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'image': serializeParam(
          _image,
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
        'time': serializeParam(
          _time,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChatmodelStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatmodelStruct(
        image: deserializeParam(
          data['image'],
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
        time: deserializeParam(
          data['time'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChatmodelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatmodelStruct &&
        image == other.image &&
        title == other.title &&
        description == other.description &&
        time == other.time;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([image, title, description, time]);
}

ChatmodelStruct createChatmodelStruct({
  String? image,
  String? title,
  String? description,
  String? time,
}) =>
    ChatmodelStruct(
      image: image,
      title: title,
      description: description,
      time: time,
    );
