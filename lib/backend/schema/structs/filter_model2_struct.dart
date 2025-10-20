// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FilterModel2Struct extends BaseStruct {
  FilterModel2Struct({
    List<int>? mainCatId,
    List<String>? city,
    List<int>? catId,
    List<String>? catName,
    List<int>? subCatId,
    List<String>? subCatName,
    bool? hasImages,
    List<int>? exchangeWishlistId,
    bool? yekjaVerified,
    bool? highRatedUsers,
    List<int>? cityId,
    int? likes,
    String? searchTerm,
    String? sortBy,
    String? sortByText,
  })  : _mainCatId = mainCatId,
        _city = city,
        _catId = catId,
        _catName = catName,
        _subCatId = subCatId,
        _subCatName = subCatName,
        _hasImages = hasImages,
        _exchangeWishlistId = exchangeWishlistId,
        _yekjaVerified = yekjaVerified,
        _highRatedUsers = highRatedUsers,
        _cityId = cityId,
        _likes = likes,
        _searchTerm = searchTerm,
        _sortBy = sortBy,
        _sortByText = sortByText;

  // "main_cat_id" field.
  List<int>? _mainCatId;
  List<int> get mainCatId => _mainCatId ?? const [];
  set mainCatId(List<int>? val) => _mainCatId = val;

  void updateMainCatId(Function(List<int>) updateFn) {
    updateFn(_mainCatId ??= []);
  }

  bool hasMainCatId() => _mainCatId != null;

  // "city" field.
  List<String>? _city;
  List<String> get city => _city ?? const [];
  set city(List<String>? val) => _city = val;

  void updateCity(Function(List<String>) updateFn) {
    updateFn(_city ??= []);
  }

  bool hasCity() => _city != null;

  // "cat_id" field.
  List<int>? _catId;
  List<int> get catId => _catId ?? const [];
  set catId(List<int>? val) => _catId = val;

  void updateCatId(Function(List<int>) updateFn) {
    updateFn(_catId ??= []);
  }

  bool hasCatId() => _catId != null;

  // "cat_name" field.
  List<String>? _catName;
  List<String> get catName => _catName ?? const [];
  set catName(List<String>? val) => _catName = val;

  void updateCatName(Function(List<String>) updateFn) {
    updateFn(_catName ??= []);
  }

  bool hasCatName() => _catName != null;

  // "sub_cat_id" field.
  List<int>? _subCatId;
  List<int> get subCatId => _subCatId ?? const [];
  set subCatId(List<int>? val) => _subCatId = val;

  void updateSubCatId(Function(List<int>) updateFn) {
    updateFn(_subCatId ??= []);
  }

  bool hasSubCatId() => _subCatId != null;

  // "sub_cat_name" field.
  List<String>? _subCatName;
  List<String> get subCatName => _subCatName ?? const [];
  set subCatName(List<String>? val) => _subCatName = val;

  void updateSubCatName(Function(List<String>) updateFn) {
    updateFn(_subCatName ??= []);
  }

  bool hasSubCatName() => _subCatName != null;

  // "has_images" field.
  bool? _hasImages;
  bool get hasImages => _hasImages ?? false;
  set hasImages(bool? val) => _hasImages = val;

  bool hasHasImages() => _hasImages != null;

  // "exchange_wishlist_id" field.
  List<int>? _exchangeWishlistId;
  List<int> get exchangeWishlistId => _exchangeWishlistId ?? const [];
  set exchangeWishlistId(List<int>? val) => _exchangeWishlistId = val;

  void updateExchangeWishlistId(Function(List<int>) updateFn) {
    updateFn(_exchangeWishlistId ??= []);
  }

  bool hasExchangeWishlistId() => _exchangeWishlistId != null;

  // "YekjaVerified" field.
  bool? _yekjaVerified;
  bool get yekjaVerified => _yekjaVerified ?? false;
  set yekjaVerified(bool? val) => _yekjaVerified = val;

  bool hasYekjaVerified() => _yekjaVerified != null;

  // "HighRatedUsers" field.
  bool? _highRatedUsers;
  bool get highRatedUsers => _highRatedUsers ?? false;
  set highRatedUsers(bool? val) => _highRatedUsers = val;

  bool hasHighRatedUsers() => _highRatedUsers != null;

  // "city_id" field.
  List<int>? _cityId;
  List<int> get cityId => _cityId ?? const [];
  set cityId(List<int>? val) => _cityId = val;

  void updateCityId(Function(List<int>) updateFn) {
    updateFn(_cityId ??= []);
  }

  bool hasCityId() => _cityId != null;

  // "likes" field.
  int? _likes;
  int get likes => _likes ?? 0;
  set likes(int? val) => _likes = val;

  void incrementLikes(int amount) => likes = likes + amount;

  bool hasLikes() => _likes != null;

  // "searchTerm" field.
  String? _searchTerm;
  String get searchTerm => _searchTerm ?? '';
  set searchTerm(String? val) => _searchTerm = val;

  bool hasSearchTerm() => _searchTerm != null;

  // "sortBy" field.
  String? _sortBy;
  String get sortBy => _sortBy ?? 'created_at.desc.nullslast';
  set sortBy(String? val) => _sortBy = val;

  bool hasSortBy() => _sortBy != null;

  // "sortByText" field.
  String? _sortByText;
  String get sortByText => _sortByText ?? 'Recent';
  set sortByText(String? val) => _sortByText = val;

  bool hasSortByText() => _sortByText != null;

  static FilterModel2Struct fromMap(Map<String, dynamic> data) =>
      FilterModel2Struct(
        mainCatId: getDataList(data['main_cat_id']),
        city: getDataList(data['city']),
        catId: getDataList(data['cat_id']),
        catName: getDataList(data['cat_name']),
        subCatId: getDataList(data['sub_cat_id']),
        subCatName: getDataList(data['sub_cat_name']),
        hasImages: data['has_images'] as bool?,
        exchangeWishlistId: getDataList(data['exchange_wishlist_id']),
        yekjaVerified: data['YekjaVerified'] as bool?,
        highRatedUsers: data['HighRatedUsers'] as bool?,
        cityId: getDataList(data['city_id']),
        likes: castToType<int>(data['likes']),
        searchTerm: data['searchTerm'] as String?,
        sortBy: data['sortBy'] as String?,
        sortByText: data['sortByText'] as String?,
      );

  static FilterModel2Struct? maybeFromMap(dynamic data) => data is Map
      ? FilterModel2Struct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'main_cat_id': _mainCatId,
        'city': _city,
        'cat_id': _catId,
        'cat_name': _catName,
        'sub_cat_id': _subCatId,
        'sub_cat_name': _subCatName,
        'has_images': _hasImages,
        'exchange_wishlist_id': _exchangeWishlistId,
        'YekjaVerified': _yekjaVerified,
        'HighRatedUsers': _highRatedUsers,
        'city_id': _cityId,
        'likes': _likes,
        'searchTerm': _searchTerm,
        'sortBy': _sortBy,
        'sortByText': _sortByText,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'main_cat_id': serializeParam(
          _mainCatId,
          ParamType.int,
          isList: true,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
          isList: true,
        ),
        'cat_id': serializeParam(
          _catId,
          ParamType.int,
          isList: true,
        ),
        'cat_name': serializeParam(
          _catName,
          ParamType.String,
          isList: true,
        ),
        'sub_cat_id': serializeParam(
          _subCatId,
          ParamType.int,
          isList: true,
        ),
        'sub_cat_name': serializeParam(
          _subCatName,
          ParamType.String,
          isList: true,
        ),
        'has_images': serializeParam(
          _hasImages,
          ParamType.bool,
        ),
        'exchange_wishlist_id': serializeParam(
          _exchangeWishlistId,
          ParamType.int,
          isList: true,
        ),
        'YekjaVerified': serializeParam(
          _yekjaVerified,
          ParamType.bool,
        ),
        'HighRatedUsers': serializeParam(
          _highRatedUsers,
          ParamType.bool,
        ),
        'city_id': serializeParam(
          _cityId,
          ParamType.int,
          isList: true,
        ),
        'likes': serializeParam(
          _likes,
          ParamType.int,
        ),
        'searchTerm': serializeParam(
          _searchTerm,
          ParamType.String,
        ),
        'sortBy': serializeParam(
          _sortBy,
          ParamType.String,
        ),
        'sortByText': serializeParam(
          _sortByText,
          ParamType.String,
        ),
      }.withoutNulls;

  static FilterModel2Struct fromSerializableMap(Map<String, dynamic> data) =>
      FilterModel2Struct(
        mainCatId: deserializeParam<int>(
          data['main_cat_id'],
          ParamType.int,
          true,
        ),
        city: deserializeParam<String>(
          data['city'],
          ParamType.String,
          true,
        ),
        catId: deserializeParam<int>(
          data['cat_id'],
          ParamType.int,
          true,
        ),
        catName: deserializeParam<String>(
          data['cat_name'],
          ParamType.String,
          true,
        ),
        subCatId: deserializeParam<int>(
          data['sub_cat_id'],
          ParamType.int,
          true,
        ),
        subCatName: deserializeParam<String>(
          data['sub_cat_name'],
          ParamType.String,
          true,
        ),
        hasImages: deserializeParam(
          data['has_images'],
          ParamType.bool,
          false,
        ),
        exchangeWishlistId: deserializeParam<int>(
          data['exchange_wishlist_id'],
          ParamType.int,
          true,
        ),
        yekjaVerified: deserializeParam(
          data['YekjaVerified'],
          ParamType.bool,
          false,
        ),
        highRatedUsers: deserializeParam(
          data['HighRatedUsers'],
          ParamType.bool,
          false,
        ),
        cityId: deserializeParam<int>(
          data['city_id'],
          ParamType.int,
          true,
        ),
        likes: deserializeParam(
          data['likes'],
          ParamType.int,
          false,
        ),
        searchTerm: deserializeParam(
          data['searchTerm'],
          ParamType.String,
          false,
        ),
        sortBy: deserializeParam(
          data['sortBy'],
          ParamType.String,
          false,
        ),
        sortByText: deserializeParam(
          data['sortByText'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FilterModel2Struct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is FilterModel2Struct &&
        listEquality.equals(mainCatId, other.mainCatId) &&
        listEquality.equals(city, other.city) &&
        listEquality.equals(catId, other.catId) &&
        listEquality.equals(catName, other.catName) &&
        listEquality.equals(subCatId, other.subCatId) &&
        listEquality.equals(subCatName, other.subCatName) &&
        hasImages == other.hasImages &&
        listEquality.equals(exchangeWishlistId, other.exchangeWishlistId) &&
        yekjaVerified == other.yekjaVerified &&
        highRatedUsers == other.highRatedUsers &&
        listEquality.equals(cityId, other.cityId) &&
        likes == other.likes &&
        searchTerm == other.searchTerm &&
        sortBy == other.sortBy &&
        sortByText == other.sortByText;
  }

  @override
  int get hashCode => const ListEquality().hash([
        mainCatId,
        city,
        catId,
        catName,
        subCatId,
        subCatName,
        hasImages,
        exchangeWishlistId,
        yekjaVerified,
        highRatedUsers,
        cityId,
        likes,
        searchTerm,
        sortBy,
        sortByText
      ]);
}

FilterModel2Struct createFilterModel2Struct({
  bool? hasImages,
  bool? yekjaVerified,
  bool? highRatedUsers,
  int? likes,
  String? searchTerm,
  String? sortBy,
  String? sortByText,
}) =>
    FilterModel2Struct(
      hasImages: hasImages,
      yekjaVerified: yekjaVerified,
      highRatedUsers: highRatedUsers,
      likes: likes,
      searchTerm: searchTerm,
      sortBy: sortBy,
      sortByText: sortByText,
    );
