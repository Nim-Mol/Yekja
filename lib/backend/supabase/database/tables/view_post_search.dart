import '../database.dart';

class ViewPostSearchTable extends SupabaseTable<ViewPostSearchRow> {
  @override
  String get tableName => 'view_post_search';

  @override
  ViewPostSearchRow createRow(Map<String, dynamic> data) =>
      ViewPostSearchRow(data);
}

class ViewPostSearchRow extends SupabaseDataRow {
  ViewPostSearchRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewPostSearchTable();

  int? get mainCatId => getField<int>('main_cat_id');
  set mainCatId(int? value) => setField<int>('main_cat_id', value);

  String? get sourceId => getField<String>('source_id');
  set sourceId(String? value) => setField<String>('source_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get cityId => getField<int>('city_id');
  set cityId(int? value) => setField<int>('city_id', value);

  String? get userCity => getField<String>('user_city');
  set userCity(String? value) => setField<String>('user_city', value);

  String? get userName => getField<String>('user_name');
  set userName(String? value) => setField<String>('user_name', value);

  String? get userAvatar => getField<String>('user_avatar');
  set userAvatar(String? value) => setField<String>('user_avatar', value);

  bool? get yekjaVerified => getField<bool>('YekjaVerified');
  set yekjaVerified(bool? value) => setField<bool>('YekjaVerified', value);

  int? get subCatId => getField<int>('sub_cat_id');
  set subCatId(int? value) => setField<int>('sub_cat_id', value);

  int? get uniqueSubcatId => getField<int>('unique_subcat_id');
  set uniqueSubcatId(int? value) => setField<int>('unique_subcat_id', value);

  String? get subCatName => getField<String>('sub_cat_name');
  set subCatName(String? value) => setField<String>('sub_cat_name', value);

  int? get catId => getField<int>('cat_id');
  set catId(int? value) => setField<int>('cat_id', value);

  String? get catName => getField<String>('cat_name');
  set catName(String? value) => setField<String>('cat_name', value);

  String? get mainCatName => getField<String>('main_cat_name');
  set mainCatName(String? value) => setField<String>('main_cat_name', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  List<String> get images => getListField<String>('images');
  set images(List<String>? value) => setListField<String>('images', value);

  bool? get hasImages => getField<bool>('has_images');
  set hasImages(bool? value) => setField<bool>('has_images', value);

  int? get postLikes => getField<int>('post_likes');
  set postLikes(int? value) => setField<int>('post_likes', value);

  bool? get reported => getField<bool>('reported');
  set reported(bool? value) => setField<bool>('reported', value);

  int? get price => getField<int>('price');
  set price(int? value) => setField<int>('price', value);

  String? get wishlistText => getField<String>('wishlist_text');
  set wishlistText(String? value) => setField<String>('wishlist_text', value);

  List<int> get exchangeWishlistId => getListField<int>('exchange_wishlist_id');
  set exchangeWishlistId(List<int>? value) =>
      setListField<int>('exchange_wishlist_id', value);

  List<String> get exchangeSubcatNames =>
      getListField<String>('exchange_subcat_names');
  set exchangeSubcatNames(List<String>? value) =>
      setListField<String>('exchange_subcat_names', value);

  String? get deliveryMethod => getField<String>('delivery_method');
  set deliveryMethod(String? value) =>
      setField<String>('delivery_method', value);

  String? get priceText => getField<String>('price_text');
  set priceText(String? value) => setField<String>('price_text', value);

  String? get timeUnit => getField<String>('time_unit');
  set timeUnit(String? value) => setField<String>('time_unit', value);

  bool? get allowCall => getField<bool>('allow_call');
  set allowCall(bool? value) => setField<bool>('allow_call', value);

  bool? get allowMessage => getField<bool>('allow_message');
  set allowMessage(bool? value) => setField<bool>('allow_message', value);

  bool? get showProfileImage => getField<bool>('show_profile_image');
  set showProfileImage(bool? value) =>
      setField<bool>('show_profile_image', value);

  bool? get showSocialmedia => getField<bool>('show_socialmedia');
  set showSocialmedia(bool? value) => setField<bool>('show_socialmedia', value);
}
