// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemCardHorizentalStruct extends BaseStruct {
  ItemCardHorizentalStruct({
    String? title,
    String? description,
    String? itemLocation,
    DateTime? createdAt,
    int? catID,
    int? itemLikes,
    String? mainImagePath,
    String? postUserId,
  })  : _title = title,
        _description = description,
        _itemLocation = itemLocation,
        _createdAt = createdAt,
        _catID = catID,
        _itemLikes = itemLikes,
        _mainImagePath = mainImagePath,
        _postUserId = postUserId;

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

  // "itemLocation" field.
  String? _itemLocation;
  String get itemLocation => _itemLocation ?? '';
  set itemLocation(String? val) => _itemLocation = val;

  bool hasItemLocation() => _itemLocation != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "catID" field.
  int? _catID;
  int get catID => _catID ?? 0;
  set catID(int? val) => _catID = val;

  void incrementCatID(int amount) => catID = catID + amount;

  bool hasCatID() => _catID != null;

  // "itemLikes" field.
  int? _itemLikes;
  int get itemLikes => _itemLikes ?? 0;
  set itemLikes(int? val) => _itemLikes = val;

  void incrementItemLikes(int amount) => itemLikes = itemLikes + amount;

  bool hasItemLikes() => _itemLikes != null;

  // "main_imagePath" field.
  String? _mainImagePath;
  String get mainImagePath => _mainImagePath ?? '';
  set mainImagePath(String? val) => _mainImagePath = val;

  bool hasMainImagePath() => _mainImagePath != null;

  // "postUserId" field.
  String? _postUserId;
  String get postUserId => _postUserId ?? '';
  set postUserId(String? val) => _postUserId = val;

  bool hasPostUserId() => _postUserId != null;

  static ItemCardHorizentalStruct fromMap(Map<String, dynamic> data) =>
      ItemCardHorizentalStruct(
        title: data['title'] as String?,
        description: data['description'] as String?,
        itemLocation: data['itemLocation'] as String?,
        createdAt: data['createdAt'] as DateTime?,
        catID: castToType<int>(data['catID']),
        itemLikes: castToType<int>(data['itemLikes']),
        mainImagePath: data['main_imagePath'] as String?,
        postUserId: data['postUserId'] as String?,
      );

  static ItemCardHorizentalStruct? maybeFromMap(dynamic data) => data is Map
      ? ItemCardHorizentalStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'description': _description,
        'itemLocation': _itemLocation,
        'createdAt': _createdAt,
        'catID': _catID,
        'itemLikes': _itemLikes,
        'main_imagePath': _mainImagePath,
        'postUserId': _postUserId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'itemLocation': serializeParam(
          _itemLocation,
          ParamType.String,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'catID': serializeParam(
          _catID,
          ParamType.int,
        ),
        'itemLikes': serializeParam(
          _itemLikes,
          ParamType.int,
        ),
        'main_imagePath': serializeParam(
          _mainImagePath,
          ParamType.String,
        ),
        'postUserId': serializeParam(
          _postUserId,
          ParamType.String,
        ),
      }.withoutNulls;

  static ItemCardHorizentalStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ItemCardHorizentalStruct(
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
        itemLocation: deserializeParam(
          data['itemLocation'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.DateTime,
          false,
        ),
        catID: deserializeParam(
          data['catID'],
          ParamType.int,
          false,
        ),
        itemLikes: deserializeParam(
          data['itemLikes'],
          ParamType.int,
          false,
        ),
        mainImagePath: deserializeParam(
          data['main_imagePath'],
          ParamType.String,
          false,
        ),
        postUserId: deserializeParam(
          data['postUserId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ItemCardHorizentalStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ItemCardHorizentalStruct &&
        title == other.title &&
        description == other.description &&
        itemLocation == other.itemLocation &&
        createdAt == other.createdAt &&
        catID == other.catID &&
        itemLikes == other.itemLikes &&
        mainImagePath == other.mainImagePath &&
        postUserId == other.postUserId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        title,
        description,
        itemLocation,
        createdAt,
        catID,
        itemLikes,
        mainImagePath,
        postUserId
      ]);
}

ItemCardHorizentalStruct createItemCardHorizentalStruct({
  String? title,
  String? description,
  String? itemLocation,
  DateTime? createdAt,
  int? catID,
  int? itemLikes,
  String? mainImagePath,
  String? postUserId,
}) =>
    ItemCardHorizentalStruct(
      title: title,
      description: description,
      itemLocation: itemLocation,
      createdAt: createdAt,
      catID: catID,
      itemLikes: itemLikes,
      mainImagePath: mainImagePath,
      postUserId: postUserId,
    );
