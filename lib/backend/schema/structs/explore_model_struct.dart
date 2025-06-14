// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExploreModelStruct extends BaseStruct {
  ExploreModelStruct({
    String? name,
    String? image,
    String? price,
  })  : _name = name,
        _image = image,
        _price = price;

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

  // "price" field.
  String? _price;
  String get price => _price ?? '';
  set price(String? val) => _price = val;

  bool hasPrice() => _price != null;

  static ExploreModelStruct fromMap(Map<String, dynamic> data) =>
      ExploreModelStruct(
        name: data['name'] as String?,
        image: data['image'] as String?,
        price: data['price'] as String?,
      );

  static ExploreModelStruct? maybeFromMap(dynamic data) => data is Map
      ? ExploreModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'image': _image,
        'price': _price,
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
        'price': serializeParam(
          _price,
          ParamType.String,
        ),
      }.withoutNulls;

  static ExploreModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      ExploreModelStruct(
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
        price: deserializeParam(
          data['price'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ExploreModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ExploreModelStruct &&
        name == other.name &&
        image == other.image &&
        price == other.price;
  }

  @override
  int get hashCode => const ListEquality().hash([name, image, price]);
}

ExploreModelStruct createExploreModelStruct({
  String? name,
  String? image,
  String? price,
}) =>
    ExploreModelStruct(
      name: name,
      image: image,
      price: price,
    );
