// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MyOrderModelStruct extends BaseStruct {
  MyOrderModelStruct({
    String? image,
    String? title,
    String? price,
    String? cname,
    Color? color,
  })  : _image = image,
        _title = title,
        _price = price,
        _cname = cname,
        _color = color;

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

  // "price" field.
  String? _price;
  String get price => _price ?? '';
  set price(String? val) => _price = val;

  bool hasPrice() => _price != null;

  // "Cname" field.
  String? _cname;
  String get cname => _cname ?? '';
  set cname(String? val) => _cname = val;

  bool hasCname() => _cname != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;

  bool hasColor() => _color != null;

  static MyOrderModelStruct fromMap(Map<String, dynamic> data) =>
      MyOrderModelStruct(
        image: data['image'] as String?,
        title: data['title'] as String?,
        price: data['price'] as String?,
        cname: data['Cname'] as String?,
        color: getSchemaColor(data['color']),
      );

  static MyOrderModelStruct? maybeFromMap(dynamic data) => data is Map
      ? MyOrderModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'image': _image,
        'title': _title,
        'price': _price,
        'Cname': _cname,
        'color': _color,
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
        'price': serializeParam(
          _price,
          ParamType.String,
        ),
        'Cname': serializeParam(
          _cname,
          ParamType.String,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
      }.withoutNulls;

  static MyOrderModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      MyOrderModelStruct(
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
        price: deserializeParam(
          data['price'],
          ParamType.String,
          false,
        ),
        cname: deserializeParam(
          data['Cname'],
          ParamType.String,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
      );

  @override
  String toString() => 'MyOrderModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MyOrderModelStruct &&
        image == other.image &&
        title == other.title &&
        price == other.price &&
        cname == other.cname &&
        color == other.color;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([image, title, price, cname, color]);
}

MyOrderModelStruct createMyOrderModelStruct({
  String? image,
  String? title,
  String? price,
  String? cname,
  Color? color,
}) =>
    MyOrderModelStruct(
      image: image,
      title: title,
      price: price,
      cname: cname,
      color: color,
    );
