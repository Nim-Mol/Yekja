// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MarketModelStruct extends BaseStruct {
  MarketModelStruct({
    String? id,
    String? userId,
    String? title,
    String? description,
    int? mainCatID,
    String? maincatName,
    int? catId,
    String? catName,
    int? subCatID,
    String? subCatName,
    int? price,
    String? priceText,
    int? likes,
    List<String>? images,
    bool? reported,
    bool? isOpenToExchange,
    String? exchangeDescription,
    List<String>? exchangeWishList,
    List<int>? exchangeSubCatIds,
    String? timeUnit,
    String? deliveryMethod,
  })  : _id = id,
        _userId = userId,
        _title = title,
        _description = description,
        _mainCatID = mainCatID,
        _maincatName = maincatName,
        _catId = catId,
        _catName = catName,
        _subCatID = subCatID,
        _subCatName = subCatName,
        _price = price,
        _priceText = priceText,
        _likes = likes,
        _images = images,
        _reported = reported,
        _isOpenToExchange = isOpenToExchange,
        _exchangeDescription = exchangeDescription,
        _exchangeWishList = exchangeWishList,
        _exchangeSubCatIds = exchangeSubCatIds,
        _timeUnit = timeUnit,
        _deliveryMethod = deliveryMethod;

  // "Id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

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

  // "mainCatID" field.
  int? _mainCatID;
  int get mainCatID => _mainCatID ?? 0;
  set mainCatID(int? val) => _mainCatID = val;

  void incrementMainCatID(int amount) => mainCatID = mainCatID + amount;

  bool hasMainCatID() => _mainCatID != null;

  // "maincat_name" field.
  String? _maincatName;
  String get maincatName => _maincatName ?? '';
  set maincatName(String? val) => _maincatName = val;

  bool hasMaincatName() => _maincatName != null;

  // "cat_id" field.
  int? _catId;
  int get catId => _catId ?? 0;
  set catId(int? val) => _catId = val;

  void incrementCatId(int amount) => catId = catId + amount;

  bool hasCatId() => _catId != null;

  // "cat_name" field.
  String? _catName;
  String get catName => _catName ?? '';
  set catName(String? val) => _catName = val;

  bool hasCatName() => _catName != null;

  // "subCatID" field.
  int? _subCatID;
  int get subCatID => _subCatID ?? 0;
  set subCatID(int? val) => _subCatID = val;

  void incrementSubCatID(int amount) => subCatID = subCatID + amount;

  bool hasSubCatID() => _subCatID != null;

  // "sub_cat_name" field.
  String? _subCatName;
  String get subCatName => _subCatName ?? '';
  set subCatName(String? val) => _subCatName = val;

  bool hasSubCatName() => _subCatName != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  set price(int? val) => _price = val;

  void incrementPrice(int amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "price_text" field.
  String? _priceText;
  String get priceText => _priceText ?? '';
  set priceText(String? val) => _priceText = val;

  bool hasPriceText() => _priceText != null;

  // "likes" field.
  int? _likes;
  int get likes => _likes ?? 0;
  set likes(int? val) => _likes = val;

  void incrementLikes(int amount) => likes = likes + amount;

  bool hasLikes() => _likes != null;

  // "Images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  set images(List<String>? val) => _images = val;

  void updateImages(Function(List<String>) updateFn) {
    updateFn(_images ??= []);
  }

  bool hasImages() => _images != null;

  // "reported" field.
  bool? _reported;
  bool get reported => _reported ?? false;
  set reported(bool? val) => _reported = val;

  bool hasReported() => _reported != null;

  // "is_open_to_exchange" field.
  bool? _isOpenToExchange;
  bool get isOpenToExchange => _isOpenToExchange ?? false;
  set isOpenToExchange(bool? val) => _isOpenToExchange = val;

  bool hasIsOpenToExchange() => _isOpenToExchange != null;

  // "exchange_description" field.
  String? _exchangeDescription;
  String get exchangeDescription => _exchangeDescription ?? '';
  set exchangeDescription(String? val) => _exchangeDescription = val;

  bool hasExchangeDescription() => _exchangeDescription != null;

  // "exchange_wish_list" field.
  List<String>? _exchangeWishList;
  List<String> get exchangeWishList => _exchangeWishList ?? const [];
  set exchangeWishList(List<String>? val) => _exchangeWishList = val;

  void updateExchangeWishList(Function(List<String>) updateFn) {
    updateFn(_exchangeWishList ??= []);
  }

  bool hasExchangeWishList() => _exchangeWishList != null;

  // "exchange_sub_cat_ids" field.
  List<int>? _exchangeSubCatIds;
  List<int> get exchangeSubCatIds => _exchangeSubCatIds ?? const [];
  set exchangeSubCatIds(List<int>? val) => _exchangeSubCatIds = val;

  void updateExchangeSubCatIds(Function(List<int>) updateFn) {
    updateFn(_exchangeSubCatIds ??= []);
  }

  bool hasExchangeSubCatIds() => _exchangeSubCatIds != null;

  // "timeUnit" field.
  String? _timeUnit;
  String get timeUnit => _timeUnit ?? '';
  set timeUnit(String? val) => _timeUnit = val;

  bool hasTimeUnit() => _timeUnit != null;

  // "delivery_method" field.
  String? _deliveryMethod;
  String get deliveryMethod => _deliveryMethod ?? '';
  set deliveryMethod(String? val) => _deliveryMethod = val;

  bool hasDeliveryMethod() => _deliveryMethod != null;

  static MarketModelStruct fromMap(Map<String, dynamic> data) =>
      MarketModelStruct(
        id: data['Id'] as String?,
        userId: data['userId'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        mainCatID: castToType<int>(data['mainCatID']),
        maincatName: data['maincat_name'] as String?,
        catId: castToType<int>(data['cat_id']),
        catName: data['cat_name'] as String?,
        subCatID: castToType<int>(data['subCatID']),
        subCatName: data['sub_cat_name'] as String?,
        price: castToType<int>(data['price']),
        priceText: data['price_text'] as String?,
        likes: castToType<int>(data['likes']),
        images: getDataList(data['Images']),
        reported: data['reported'] as bool?,
        isOpenToExchange: data['is_open_to_exchange'] as bool?,
        exchangeDescription: data['exchange_description'] as String?,
        exchangeWishList: getDataList(data['exchange_wish_list']),
        exchangeSubCatIds: getDataList(data['exchange_sub_cat_ids']),
        timeUnit: data['timeUnit'] as String?,
        deliveryMethod: data['delivery_method'] as String?,
      );

  static MarketModelStruct? maybeFromMap(dynamic data) => data is Map
      ? MarketModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Id': _id,
        'userId': _userId,
        'title': _title,
        'description': _description,
        'mainCatID': _mainCatID,
        'maincat_name': _maincatName,
        'cat_id': _catId,
        'cat_name': _catName,
        'subCatID': _subCatID,
        'sub_cat_name': _subCatName,
        'price': _price,
        'price_text': _priceText,
        'likes': _likes,
        'Images': _images,
        'reported': _reported,
        'is_open_to_exchange': _isOpenToExchange,
        'exchange_description': _exchangeDescription,
        'exchange_wish_list': _exchangeWishList,
        'exchange_sub_cat_ids': _exchangeSubCatIds,
        'timeUnit': _timeUnit,
        'delivery_method': _deliveryMethod,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Id': serializeParam(
          _id,
          ParamType.String,
        ),
        'userId': serializeParam(
          _userId,
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
        'mainCatID': serializeParam(
          _mainCatID,
          ParamType.int,
        ),
        'maincat_name': serializeParam(
          _maincatName,
          ParamType.String,
        ),
        'cat_id': serializeParam(
          _catId,
          ParamType.int,
        ),
        'cat_name': serializeParam(
          _catName,
          ParamType.String,
        ),
        'subCatID': serializeParam(
          _subCatID,
          ParamType.int,
        ),
        'sub_cat_name': serializeParam(
          _subCatName,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.int,
        ),
        'price_text': serializeParam(
          _priceText,
          ParamType.String,
        ),
        'likes': serializeParam(
          _likes,
          ParamType.int,
        ),
        'Images': serializeParam(
          _images,
          ParamType.String,
          isList: true,
        ),
        'reported': serializeParam(
          _reported,
          ParamType.bool,
        ),
        'is_open_to_exchange': serializeParam(
          _isOpenToExchange,
          ParamType.bool,
        ),
        'exchange_description': serializeParam(
          _exchangeDescription,
          ParamType.String,
        ),
        'exchange_wish_list': serializeParam(
          _exchangeWishList,
          ParamType.String,
          isList: true,
        ),
        'exchange_sub_cat_ids': serializeParam(
          _exchangeSubCatIds,
          ParamType.int,
          isList: true,
        ),
        'timeUnit': serializeParam(
          _timeUnit,
          ParamType.String,
        ),
        'delivery_method': serializeParam(
          _deliveryMethod,
          ParamType.String,
        ),
      }.withoutNulls;

  static MarketModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      MarketModelStruct(
        id: deserializeParam(
          data['Id'],
          ParamType.String,
          false,
        ),
        userId: deserializeParam(
          data['userId'],
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
        mainCatID: deserializeParam(
          data['mainCatID'],
          ParamType.int,
          false,
        ),
        maincatName: deserializeParam(
          data['maincat_name'],
          ParamType.String,
          false,
        ),
        catId: deserializeParam(
          data['cat_id'],
          ParamType.int,
          false,
        ),
        catName: deserializeParam(
          data['cat_name'],
          ParamType.String,
          false,
        ),
        subCatID: deserializeParam(
          data['subCatID'],
          ParamType.int,
          false,
        ),
        subCatName: deserializeParam(
          data['sub_cat_name'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.int,
          false,
        ),
        priceText: deserializeParam(
          data['price_text'],
          ParamType.String,
          false,
        ),
        likes: deserializeParam(
          data['likes'],
          ParamType.int,
          false,
        ),
        images: deserializeParam<String>(
          data['Images'],
          ParamType.String,
          true,
        ),
        reported: deserializeParam(
          data['reported'],
          ParamType.bool,
          false,
        ),
        isOpenToExchange: deserializeParam(
          data['is_open_to_exchange'],
          ParamType.bool,
          false,
        ),
        exchangeDescription: deserializeParam(
          data['exchange_description'],
          ParamType.String,
          false,
        ),
        exchangeWishList: deserializeParam<String>(
          data['exchange_wish_list'],
          ParamType.String,
          true,
        ),
        exchangeSubCatIds: deserializeParam<int>(
          data['exchange_sub_cat_ids'],
          ParamType.int,
          true,
        ),
        timeUnit: deserializeParam(
          data['timeUnit'],
          ParamType.String,
          false,
        ),
        deliveryMethod: deserializeParam(
          data['delivery_method'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MarketModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MarketModelStruct &&
        id == other.id &&
        userId == other.userId &&
        title == other.title &&
        description == other.description &&
        mainCatID == other.mainCatID &&
        maincatName == other.maincatName &&
        catId == other.catId &&
        catName == other.catName &&
        subCatID == other.subCatID &&
        subCatName == other.subCatName &&
        price == other.price &&
        priceText == other.priceText &&
        likes == other.likes &&
        listEquality.equals(images, other.images) &&
        reported == other.reported &&
        isOpenToExchange == other.isOpenToExchange &&
        exchangeDescription == other.exchangeDescription &&
        listEquality.equals(exchangeWishList, other.exchangeWishList) &&
        listEquality.equals(exchangeSubCatIds, other.exchangeSubCatIds) &&
        timeUnit == other.timeUnit &&
        deliveryMethod == other.deliveryMethod;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        userId,
        title,
        description,
        mainCatID,
        maincatName,
        catId,
        catName,
        subCatID,
        subCatName,
        price,
        priceText,
        likes,
        images,
        reported,
        isOpenToExchange,
        exchangeDescription,
        exchangeWishList,
        exchangeSubCatIds,
        timeUnit,
        deliveryMethod
      ]);
}

MarketModelStruct createMarketModelStruct({
  String? id,
  String? userId,
  String? title,
  String? description,
  int? mainCatID,
  String? maincatName,
  int? catId,
  String? catName,
  int? subCatID,
  String? subCatName,
  int? price,
  String? priceText,
  int? likes,
  bool? reported,
  bool? isOpenToExchange,
  String? exchangeDescription,
  String? timeUnit,
  String? deliveryMethod,
}) =>
    MarketModelStruct(
      id: id,
      userId: userId,
      title: title,
      description: description,
      mainCatID: mainCatID,
      maincatName: maincatName,
      catId: catId,
      catName: catName,
      subCatID: subCatID,
      subCatName: subCatName,
      price: price,
      priceText: priceText,
      likes: likes,
      reported: reported,
      isOpenToExchange: isOpenToExchange,
      exchangeDescription: exchangeDescription,
      timeUnit: timeUnit,
      deliveryMethod: deliveryMethod,
    );
