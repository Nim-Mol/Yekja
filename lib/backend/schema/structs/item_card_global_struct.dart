// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemCardGlobalStruct extends BaseStruct {
  ItemCardGlobalStruct({
    String? title,
    String? description,
    String? itemLocation,
    DateTime? createdAt,
    int? catID,
    int? itemLikes,
    String? mainImagePath,
    String? postUserId,
    String? avatar,
    String? subCatName,
    Color? fillColor,
    String? catName,
  })  : _title = title,
        _description = description,
        _itemLocation = itemLocation,
        _createdAt = createdAt,
        _catID = catID,
        _itemLikes = itemLikes,
        _mainImagePath = mainImagePath,
        _postUserId = postUserId,
        _avatar = avatar,
        _subCatName = subCatName,
        _fillColor = fillColor,
        _catName = catName;

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

  // "Avatar" field.
  String? _avatar;
  String get avatar => _avatar ?? '';
  set avatar(String? val) => _avatar = val;

  bool hasAvatar() => _avatar != null;

  // "sub_cat_name" field.
  String? _subCatName;
  String get subCatName => _subCatName ?? '';
  set subCatName(String? val) => _subCatName = val;

  bool hasSubCatName() => _subCatName != null;

  // "fillColor" field.
  Color? _fillColor;
  Color? get fillColor => _fillColor;
  set fillColor(Color? val) => _fillColor = val;

  bool hasFillColor() => _fillColor != null;

  // "catName" field.
  String? _catName;
  String get catName => _catName ?? '';
  set catName(String? val) => _catName = val;

  bool hasCatName() => _catName != null;

  static ItemCardGlobalStruct fromMap(Map<String, dynamic> data) =>
      ItemCardGlobalStruct(
        title: data['title'] as String?,
        description: data['description'] as String?,
        itemLocation: data['itemLocation'] as String?,
        createdAt: data['createdAt'] as DateTime?,
        catID: castToType<int>(data['catID']),
        itemLikes: castToType<int>(data['itemLikes']),
        mainImagePath: data['main_imagePath'] as String?,
        postUserId: data['postUserId'] as String?,
        avatar: data['Avatar'] as String?,
        subCatName: data['sub_cat_name'] as String?,
        fillColor: getSchemaColor(data['fillColor']),
        catName: data['catName'] as String?,
      );

  static ItemCardGlobalStruct? maybeFromMap(dynamic data) => data is Map
      ? ItemCardGlobalStruct.fromMap(data.cast<String, dynamic>())
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
        'Avatar': _avatar,
        'sub_cat_name': _subCatName,
        'fillColor': _fillColor,
        'catName': _catName,
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
        'Avatar': serializeParam(
          _avatar,
          ParamType.String,
        ),
        'sub_cat_name': serializeParam(
          _subCatName,
          ParamType.String,
        ),
        'fillColor': serializeParam(
          _fillColor,
          ParamType.Color,
        ),
        'catName': serializeParam(
          _catName,
          ParamType.String,
        ),
      }.withoutNulls;

  static ItemCardGlobalStruct fromSerializableMap(Map<String, dynamic> data) =>
      ItemCardGlobalStruct(
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
        avatar: deserializeParam(
          data['Avatar'],
          ParamType.String,
          false,
        ),
        subCatName: deserializeParam(
          data['sub_cat_name'],
          ParamType.String,
          false,
        ),
        fillColor: deserializeParam(
          data['fillColor'],
          ParamType.Color,
          false,
        ),
        catName: deserializeParam(
          data['catName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ItemCardGlobalStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ItemCardGlobalStruct &&
        title == other.title &&
        description == other.description &&
        itemLocation == other.itemLocation &&
        createdAt == other.createdAt &&
        catID == other.catID &&
        itemLikes == other.itemLikes &&
        mainImagePath == other.mainImagePath &&
        postUserId == other.postUserId &&
        avatar == other.avatar &&
        subCatName == other.subCatName &&
        fillColor == other.fillColor &&
        catName == other.catName;
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
        postUserId,
        avatar,
        subCatName,
        fillColor,
        catName
      ]);
}

ItemCardGlobalStruct createItemCardGlobalStruct({
  String? title,
  String? description,
  String? itemLocation,
  DateTime? createdAt,
  int? catID,
  int? itemLikes,
  String? mainImagePath,
  String? postUserId,
  String? avatar,
  String? subCatName,
  Color? fillColor,
  String? catName,
}) =>
    ItemCardGlobalStruct(
      title: title,
      description: description,
      itemLocation: itemLocation,
      createdAt: createdAt,
      catID: catID,
      itemLikes: itemLikes,
      mainImagePath: mainImagePath,
      postUserId: postUserId,
      avatar: avatar,
      subCatName: subCatName,
      fillColor: fillColor,
      catName: catName,
    );
