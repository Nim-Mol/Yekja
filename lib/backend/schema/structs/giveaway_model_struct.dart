// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GiveawayModelStruct extends BaseStruct {
  GiveawayModelStruct({
    String? condition,
    String? deliveryMethod,
    bool? isFreeDelivery,
    bool? openForSwap,
    String? wishlistText,
  })  : _condition = condition,
        _deliveryMethod = deliveryMethod,
        _isFreeDelivery = isFreeDelivery,
        _openForSwap = openForSwap,
        _wishlistText = wishlistText;

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

  static GiveawayModelStruct fromMap(Map<String, dynamic> data) =>
      GiveawayModelStruct(
        condition: data['condition'] as String?,
        deliveryMethod: data['delivery_method'] as String?,
        isFreeDelivery: data['is_free_delivery'] as bool?,
        openForSwap: data['open_for_swap'] as bool?,
        wishlistText: data['wishlist_text'] as String?,
      );

  static GiveawayModelStruct? maybeFromMap(dynamic data) => data is Map
      ? GiveawayModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'condition': _condition,
        'delivery_method': _deliveryMethod,
        'is_free_delivery': _isFreeDelivery,
        'open_for_swap': _openForSwap,
        'wishlist_text': _wishlistText,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
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

  static GiveawayModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      GiveawayModelStruct(
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
  String toString() => 'GiveawayModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GiveawayModelStruct &&
        condition == other.condition &&
        deliveryMethod == other.deliveryMethod &&
        isFreeDelivery == other.isFreeDelivery &&
        openForSwap == other.openForSwap &&
        wishlistText == other.wishlistText;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [condition, deliveryMethod, isFreeDelivery, openForSwap, wishlistText]);
}

GiveawayModelStruct createGiveawayModelStruct({
  String? condition,
  String? deliveryMethod,
  bool? isFreeDelivery,
  bool? openForSwap,
  String? wishlistText,
}) =>
    GiveawayModelStruct(
      condition: condition,
      deliveryMethod: deliveryMethod,
      isFreeDelivery: isFreeDelivery,
      openForSwap: openForSwap,
      wishlistText: wishlistText,
    );
