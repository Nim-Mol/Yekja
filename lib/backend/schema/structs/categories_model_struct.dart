// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriesModelStruct extends BaseStruct {
  CategoriesModelStruct({
    String? image,
    String? name,
    String? price,
  })  : _image = image,
        _name = name,
        _price = price;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "price" field.
  String? _price;
  String get price => _price ?? '';
  set price(String? val) => _price = val;

  bool hasPrice() => _price != null;

  static CategoriesModelStruct fromMap(Map<String, dynamic> data) =>
      CategoriesModelStruct(
        image: data['image'] as String?,
        name: data['name'] as String?,
        price: data['price'] as String?,
      );

  static CategoriesModelStruct? maybeFromMap(dynamic data) => data is Map
      ? CategoriesModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'image': _image,
        'name': _name,
        'price': _price,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.String,
        ),
      }.withoutNulls;

  static CategoriesModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      CategoriesModelStruct(
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
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
  String toString() => 'CategoriesModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CategoriesModelStruct &&
        image == other.image &&
        name == other.name &&
        price == other.price;
  }

  @override
  int get hashCode => const ListEquality().hash([image, name, price]);
}

CategoriesModelStruct createCategoriesModelStruct({
  String? image,
  String? name,
  String? price,
}) =>
    CategoriesModelStruct(
      image: image,
      name: name,
      price: price,
    );
