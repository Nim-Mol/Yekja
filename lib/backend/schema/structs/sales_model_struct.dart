// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SalesModelStruct extends BaseStruct {
  SalesModelStruct({
    int? price,
    String? priceText,
    String? condition,
    String? deliveryMethod,
    bool? isFreeDelivery,
    bool? openForSwap,
    String? wishlistText,
  })  : _price = price,
        _priceText = priceText,
        _condition = condition,
        _deliveryMethod = deliveryMethod,
        _isFreeDelivery = isFreeDelivery,
        _openForSwap = openForSwap,
        _wishlistText = wishlistText;

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

  // "condition" field.
  String? _condition;
  String get condition => _condition ?? '';
  set condition(String? val) => _condition = val;

  bool hasCondition() => _condition != null;

  // "delivery_method" field.
  String? _deliveryMethod;
  String get deliveryMethod => _deliveryMethod ?? '';
  set deliveryMethod(String? val) => _deliveryMethod = val;

  bool hasDeliveryMethod() => _deliveryMethod != null;

  // "is_free_delivery" field.
  bool? _isFreeDelivery;
  bool get isFreeDelivery => _isFreeDelivery ?? false;
  set isFreeDelivery(bool? val) => _isFreeDelivery = val;

  bool hasIsFreeDelivery() => _isFreeDelivery != null;

  // "open_for_swap" field.
  bool? _openForSwap;
  bool get openForSwap => _openForSwap ?? false;
  set openForSwap(bool? val) => _openForSwap = val;

  bool hasOpenForSwap() => _openForSwap != null;

  // "wishlist_text" field.
  String? _wishlistText;
  String get wishlistText => _wishlistText ?? '';
  set wishlistText(String? val) => _wishlistText = val;

  bool hasWishlistText() => _wishlistText != null;

  static SalesModelStruct fromMap(Map<String, dynamic> data) =>
      SalesModelStruct(
        price: castToType<int>(data['price']),
        priceText: data['price_text'] as String?,
        condition: data['condition'] as String?,
        deliveryMethod: data['delivery_method'] as String?,
        isFreeDelivery: data['is_free_delivery'] as bool?,
        openForSwap: data['open_for_swap'] as bool?,
        wishlistText: data['wishlist_text'] as String?,
      );

  static SalesModelStruct? maybeFromMap(dynamic data) => data is Map
      ? SalesModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'price': _price,
        'price_text': _priceText,
        'condition': _condition,
        'delivery_method': _deliveryMethod,
        'is_free_delivery': _isFreeDelivery,
        'open_for_swap': _openForSwap,
        'wishlist_text': _wishlistText,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'price': serializeParam(
          _price,
          ParamType.int,
        ),
        'price_text': serializeParam(
          _priceText,
          ParamType.String,
        ),
        'condition': serializeParam(
          _condition,
          ParamType.String,
        ),
        'delivery_method': serializeParam(
          _deliveryMethod,
          ParamType.String,
        ),
        'is_free_delivery': serializeParam(
          _isFreeDelivery,
          ParamType.bool,
        ),
        'open_for_swap': serializeParam(
          _openForSwap,
          ParamType.bool,
        ),
        'wishlist_text': serializeParam(
          _wishlistText,
          ParamType.String,
        ),
      }.withoutNulls;

  static SalesModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      SalesModelStruct(
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
        condition: deserializeParam(
          data['condition'],
          ParamType.String,
          false,
        ),
        deliveryMethod: deserializeParam(
          data['delivery_method'],
          ParamType.String,
          false,
        ),
        isFreeDelivery: deserializeParam(
          data['is_free_delivery'],
          ParamType.bool,
          false,
        ),
        openForSwap: deserializeParam(
          data['open_for_swap'],
          ParamType.bool,
          false,
        ),
        wishlistText: deserializeParam(
          data['wishlist_text'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SalesModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SalesModelStruct &&
        price == other.price &&
        priceText == other.priceText &&
        condition == other.condition &&
        deliveryMethod == other.deliveryMethod &&
        isFreeDelivery == other.isFreeDelivery &&
        openForSwap == other.openForSwap &&
        wishlistText == other.wishlistText;
  }

  @override
  int get hashCode => const ListEquality().hash([
        price,
        priceText,
        condition,
        deliveryMethod,
        isFreeDelivery,
        openForSwap,
        wishlistText
      ]);
}

SalesModelStruct createSalesModelStruct({
  int? price,
  String? priceText,
  String? condition,
  String? deliveryMethod,
  bool? isFreeDelivery,
  bool? openForSwap,
  String? wishlistText,
}) =>
    SalesModelStruct(
      price: price,
      priceText: priceText,
      condition: condition,
      deliveryMethod: deliveryMethod,
      isFreeDelivery: isFreeDelivery,
      openForSwap: openForSwap,
      wishlistText: wishlistText,
    );
