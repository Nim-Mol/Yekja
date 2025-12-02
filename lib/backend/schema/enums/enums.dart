import 'package:collection/collection.dart';

enum DeliveryOptions {
  Free,
  PostNL,
  Negotiable,
}

enum TimeUnit {
  hour,
  day,
  week,
  month,
  year,
}

enum PriceOptions {
  Free,
  Negotiable,
  Estimated,
}

enum ContactSubject {
  Bug,
  Help,
  Advertisement,
  Collaboration,
  General,
}

enum Languages {
  Farsi,
  English,
  Turkish,
  Arabic,
  Dutch,
  Kurdish,
  Urdu,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (DeliveryOptions):
      return DeliveryOptions.values.deserialize(value) as T?;
    case (TimeUnit):
      return TimeUnit.values.deserialize(value) as T?;
    case (PriceOptions):
      return PriceOptions.values.deserialize(value) as T?;
    case (ContactSubject):
      return ContactSubject.values.deserialize(value) as T?;
    case (Languages):
      return Languages.values.deserialize(value) as T?;
    default:
      return null;
  }
}
