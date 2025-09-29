// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemCardVerticalStruct extends BaseStruct {
  ItemCardVerticalStruct({
    String? title,
    String? itemLocation,
    int? itemLikes,
    String? category,
    int? catID,
    String? catColor,
    String? subCategory,
    String? mainImagePath,
    int? price,
    String? priceTxt,
    String? timeUnit,
  })  : _title = title,
        _itemLocation = itemLocation,
        _itemLikes = itemLikes,
        _category = category,
        _catID = catID,
        _catColor = catColor,
        _subCategory = subCategory,
        _mainImagePath = mainImagePath,
        _price = price,
        _priceTxt = priceTxt,
        _timeUnit = timeUnit;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "itemLocation" field.
  String? _itemLocation;
  String get itemLocation => _itemLocation ?? '';
  set itemLocation(String? val) => _itemLocation = val;

  bool hasItemLocation() => _itemLocation != null;

  // "itemLikes" field.
  int? _itemLikes;
  int get itemLikes => _itemLikes ?? 0;
  set itemLikes(int? val) => _itemLikes = val;

  void incrementItemLikes(int amount) => itemLikes = itemLikes + amount;

  bool hasItemLikes() => _itemLikes != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;

  bool hasCategory() => _category != null;

  // "catID" field.
  int? _catID;
  int get catID => _catID ?? 0;
  set catID(int? val) => _catID = val;

  void incrementCatID(int amount) => catID = catID + amount;

  bool hasCatID() => _catID != null;

  // "cat_color" field.
  String? _catColor;
  String get catColor => _catColor ?? '';
  set catColor(String? val) => _catColor = val;

  bool hasCatColor() => _catColor != null;

  // "subCategory" field.
  String? _subCategory;
  String get subCategory => _subCategory ?? '';
  set subCategory(String? val) => _subCategory = val;

  bool hasSubCategory() => _subCategory != null;

  // "main_imagePath" field.
  String? _mainImagePath;
  String get mainImagePath => _mainImagePath ?? '';
  set mainImagePath(String? val) => _mainImagePath = val;

  bool hasMainImagePath() => _mainImagePath != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  set price(int? val) => _price = val;

  void incrementPrice(int amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "price_txt" field.
  String? _priceTxt;
  String get priceTxt => _priceTxt ?? '';
  set priceTxt(String? val) => _priceTxt = val;

  bool hasPriceTxt() => _priceTxt != null;

  // "timeUnit" field.
  String? _timeUnit;
  String get timeUnit => _timeUnit ?? '';
  set timeUnit(String? val) => _timeUnit = val;

  bool hasTimeUnit() => _timeUnit != null;

  static ItemCardVerticalStruct fromMap(Map<String, dynamic> data) =>
      ItemCardVerticalStruct(
        title: data['title'] as String?,
        itemLocation: data['itemLocation'] as String?,
        itemLikes: castToType<int>(data['itemLikes']),
        category: data['category'] as String?,
        catID: castToType<int>(data['catID']),
        catColor: data['cat_color'] as String?,
        subCategory: data['subCategory'] as String?,
        mainImagePath: data['main_imagePath'] as String?,
        price: castToType<int>(data['price']),
        priceTxt: data['price_txt'] as String?,
        timeUnit: data['timeUnit'] as String?,
      );

  static ItemCardVerticalStruct? maybeFromMap(dynamic data) => data is Map
      ? ItemCardVerticalStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'itemLocation': _itemLocation,
        'itemLikes': _itemLikes,
        'category': _category,
        'catID': _catID,
        'cat_color': _catColor,
        'subCategory': _subCategory,
        'main_imagePath': _mainImagePath,
        'price': _price,
        'price_txt': _priceTxt,
        'timeUnit': _timeUnit,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'itemLocation': serializeParam(
          _itemLocation,
          ParamType.String,
        ),
        'itemLikes': serializeParam(
          _itemLikes,
          ParamType.int,
        ),
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
        'catID': serializeParam(
          _catID,
          ParamType.int,
        ),
        'cat_color': serializeParam(
          _catColor,
          ParamType.String,
        ),
        'subCategory': serializeParam(
          _subCategory,
          ParamType.String,
        ),
        'main_imagePath': serializeParam(
          _mainImagePath,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.int,
        ),
        'price_txt': serializeParam(
          _priceTxt,
          ParamType.String,
        ),
        'timeUnit': serializeParam(
          _timeUnit,
          ParamType.String,
        ),
      }.withoutNulls;

  static ItemCardVerticalStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ItemCardVerticalStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        itemLocation: deserializeParam(
          data['itemLocation'],
          ParamType.String,
          false,
        ),
        itemLikes: deserializeParam(
          data['itemLikes'],
          ParamType.int,
          false,
        ),
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
        catID: deserializeParam(
          data['catID'],
          ParamType.int,
          false,
        ),
        catColor: deserializeParam(
          data['cat_color'],
          ParamType.String,
          false,
        ),
        subCategory: deserializeParam(
          data['subCategory'],
          ParamType.String,
          false,
        ),
        mainImagePath: deserializeParam(
          data['main_imagePath'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.int,
          false,
        ),
        priceTxt: deserializeParam(
          data['price_txt'],
          ParamType.String,
          false,
        ),
        timeUnit: deserializeParam(
          data['timeUnit'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ItemCardVerticalStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ItemCardVerticalStruct &&
        title == other.title &&
        itemLocation == other.itemLocation &&
        itemLikes == other.itemLikes &&
        category == other.category &&
        catID == other.catID &&
        catColor == other.catColor &&
        subCategory == other.subCategory &&
        mainImagePath == other.mainImagePath &&
        price == other.price &&
        priceTxt == other.priceTxt &&
        timeUnit == other.timeUnit;
  }

  @override
  int get hashCode => const ListEquality().hash([
        title,
        itemLocation,
        itemLikes,
        category,
        catID,
        catColor,
        subCategory,
        mainImagePath,
        price,
        priceTxt,
        timeUnit
      ]);
}

ItemCardVerticalStruct createItemCardVerticalStruct({
  String? title,
  String? itemLocation,
  int? itemLikes,
  String? category,
  int? catID,
  String? catColor,
  String? subCategory,
  String? mainImagePath,
  int? price,
  String? priceTxt,
  String? timeUnit,
}) =>
    ItemCardVerticalStruct(
      title: title,
      itemLocation: itemLocation,
      itemLikes: itemLikes,
      category: category,
      catID: catID,
      catColor: catColor,
      subCategory: subCategory,
      mainImagePath: mainImagePath,
      price: price,
      priceTxt: priceTxt,
      timeUnit: timeUnit,
    );
