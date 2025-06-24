import '../database.dart';

class ProductsTable extends SupabaseTable<ProductsRow> {
  @override
  String get tableName => 'products';

  @override
  ProductsRow createRow(Map<String, dynamic> data) => ProductsRow(data);
}

class ProductsRow extends SupabaseDataRow {
  ProductsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProductsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  List<String> get typeOfRequest => getListField<String>('type_of_request');
  set typeOfRequest(List<String> value) =>
      setListField<String>('type_of_request', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  List<String> get interestCategory =>
      getListField<String>('interest_category');
  set interestCategory(List<String>? value) =>
      setListField<String>('interest_category', value);

  List<String> get deliveryOptions => getListField<String>('delivery_options');
  set deliveryOptions(List<String>? value) =>
      setListField<String>('delivery_options', value);

  List<String> get images => getListField<String>('images');
  set images(List<String>? value) => setListField<String>('images', value);
}
