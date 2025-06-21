import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _isIntro = prefs.getBool('ff_isIntro') ?? _isIntro;
    });
    _safeInit(() {
      _isLogin = prefs.getBool('ff_isLogin') ?? _isLogin;
    });
    _safeInit(() {
      _profile = prefs.getBool('ff_profile') ?? _profile;
    });
    _safeInit(() {
      _CheckOutIndex = prefs.getInt('ff_CheckOutIndex') ?? _CheckOutIndex;
    });
    _safeInit(() {
      _selectHomeIndex = prefs.getInt('ff_selectHomeIndex') ?? _selectHomeIndex;
    });
    _safeInit(() {
      _isOnboarding = prefs.getBool('ff_isOnboarding') ?? _isOnboarding;
    });
    _safeInit(() {
      _Interests = prefs.getStringList('ff_Interests') ?? _Interests;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<CategoriesModelStruct> _categoriesList = [
    CategoriesModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/r2yry49ybkpo/beautiful-shot-stylish-grey-chair-isolated-white-background_1.png\",\"name\":\"Adirondack chair\",\"price\":\"\$120.00\"}')),
    CategoriesModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/pivp3uwgotc0/beautiful-shot-stylish-grey-chair-isolated-white-background_1_(1).png\",\"name\":\"Barcelona Chair\",\"price\":\"\$110.00\"}'))
  ];
  List<CategoriesModelStruct> get categoriesList => _categoriesList;
  set categoriesList(List<CategoriesModelStruct> value) {
    _categoriesList = value;
  }

  void addToCategoriesList(CategoriesModelStruct value) {
    categoriesList.add(value);
  }

  void removeFromCategoriesList(CategoriesModelStruct value) {
    categoriesList.remove(value);
  }

  void removeAtIndexFromCategoriesList(int index) {
    categoriesList.removeAt(index);
  }

  void updateCategoriesListAtIndex(
    int index,
    CategoriesModelStruct Function(CategoriesModelStruct) updateFn,
  ) {
    categoriesList[index] = updateFn(_categoriesList[index]);
  }

  void insertAtIndexInCategoriesList(int index, CategoriesModelStruct value) {
    categoriesList.insert(index, value);
  }

  List<ExploreModelStruct> _exploreList = [
    ExploreModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Bentwood Chair\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/ihw0kblp626u/photo-modern-luxury-arm-chair-furniture-design_1.png\",\"price\":\"\$80.00\"}')),
    ExploreModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Bentwood Chair\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/1tyqs484moax/photo-modern-luxury-arm-chair-furniture-design_1_(1).png\",\"price\":\"\$80.00\"}'))
  ];
  List<ExploreModelStruct> get exploreList => _exploreList;
  set exploreList(List<ExploreModelStruct> value) {
    _exploreList = value;
  }

  void addToExploreList(ExploreModelStruct value) {
    exploreList.add(value);
  }

  void removeFromExploreList(ExploreModelStruct value) {
    exploreList.remove(value);
  }

  void removeAtIndexFromExploreList(int index) {
    exploreList.removeAt(index);
  }

  void updateExploreListAtIndex(
    int index,
    ExploreModelStruct Function(ExploreModelStruct) updateFn,
  ) {
    exploreList[index] = updateFn(_exploreList[index]);
  }

  void insertAtIndexInExploreList(int index, ExploreModelStruct value) {
    exploreList.insert(index, value);
  }

  List<SearchResultModelStruct> _searchResultList = [
    SearchResultModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/je2qow40k6bq/Group_1171275474.png\",\"name\":\"Statistical table\",\"price\":\"\$80.00\"}')),
    SearchResultModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/8400pkatk3fc/beautiful-shot-stylish-grey-chair-isolated-white-background_1_(2).png\",\"name\":\"Classified table\",\"price\":\"\$50.00\"}')),
    SearchResultModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/uyknp4mosnri/beautiful-shot-stylish-grey-chair-isolated-white-background_1_(3).png\",\"name\":\"Simple table\",\"price\":\"\$20.00\"}')),
    SearchResultModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/r9gc1lqxfpx9/beautiful-shot-stylish-grey-chair-isolated-white-background_1_(4).png\",\"name\":\"Characteristic table\",\"price\":\"\$30.00\"}')),
    SearchResultModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/4kmqkrwcua3x/beautiful-shot-stylish-grey-chair-isolated-white-background_1_(5).png\",\"name\":\"Possibly table\",\"price\":\"\$14.00\"}')),
    SearchResultModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/i1u6w40e9wuo/Group_1171275474_(1).png\",\"name\":\"Coffee table\",\"price\":\"\$70.00\"}')),
    SearchResultModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/fcex3vpate5b/Group_1171275474_(2).png\",\"name\":\"Rectangular table\",\"price\":\"\$95.00\"}')),
    SearchResultModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/iprhholmzx19/beautiful-shot-stylish-grey-chair-isolated-white-background_1_(6).png\",\"name\":\"Lift-top table\",\"price\":\"\$20.00\"}'))
  ];
  List<SearchResultModelStruct> get searchResultList => _searchResultList;
  set searchResultList(List<SearchResultModelStruct> value) {
    _searchResultList = value;
  }

  void addToSearchResultList(SearchResultModelStruct value) {
    searchResultList.add(value);
  }

  void removeFromSearchResultList(SearchResultModelStruct value) {
    searchResultList.remove(value);
  }

  void removeAtIndexFromSearchResultList(int index) {
    searchResultList.removeAt(index);
  }

  void updateSearchResultListAtIndex(
    int index,
    SearchResultModelStruct Function(SearchResultModelStruct) updateFn,
  ) {
    searchResultList[index] = updateFn(_searchResultList[index]);
  }

  void insertAtIndexInSearchResultList(
      int index, SearchResultModelStruct value) {
    searchResultList.insert(index, value);
  }

  List<FilterModelStruct> _filter = [
    FilterModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Table\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/pngoo5d0rkw3/Group_1171275473_(3).png\"}')),
    FilterModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Chair\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/zt8ra3x80s9g/Group_1171275473.png\"}')),
    FilterModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Bed\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/sj4l7634hxkv/Group_1171275473_(1).png\"}')),
    FilterModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Lamp\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/rcwzigackus8/Group_1171275473_(2).png\"}'))
  ];
  List<FilterModelStruct> get filter => _filter;
  set filter(List<FilterModelStruct> value) {
    _filter = value;
  }

  void addToFilter(FilterModelStruct value) {
    filter.add(value);
  }

  void removeFromFilter(FilterModelStruct value) {
    filter.remove(value);
  }

  void removeAtIndexFromFilter(int index) {
    filter.removeAt(index);
  }

  void updateFilterAtIndex(
    int index,
    FilterModelStruct Function(FilterModelStruct) updateFn,
  ) {
    filter[index] = updateFn(_filter[index]);
  }

  void insertAtIndexInFilter(int index, FilterModelStruct value) {
    filter.insert(index, value);
  }

  List<FilterModelStruct> _categoryList = [
    FilterModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Table\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/pngoo5d0rkw3/Group_1171275473_(3).png\"}')),
    FilterModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Chair\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/zt8ra3x80s9g/Group_1171275473.png\"}')),
    FilterModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Bed\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/sj4l7634hxkv/Group_1171275473_(1).png\"}')),
    FilterModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Lamp\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/rcwzigackus8/Group_1171275473_(2).png\"}')),
    FilterModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Bench\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/3xj7pnzl3wlx/Group_1171275507.png\"}')),
    FilterModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Desks\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/n18x2s3wfszm/Group_1171275507_(1).png\"}')),
    FilterModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Door\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/lqhm4u08bd1y/Group_1171275507_(2).png\"}')),
    FilterModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Swing\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/n3nt5zuygx6t/Group_1171275507_(3).png\"}')),
    FilterModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Cabinets\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/hv7ivhriwaw5/Group_1171275507_(4).png\"}')),
    FilterModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Chest\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/gg16ht4mx0nb/Group_1171275507_(5).png\"}')),
    FilterModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Living\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/8sldyvgc38cu/Group_1171275507_(7).png\"}')),
    FilterModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Storage\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/qol8qj1tnw7j/Group_1171275507_(6).png\"}'))
  ];
  List<FilterModelStruct> get categoryList => _categoryList;
  set categoryList(List<FilterModelStruct> value) {
    _categoryList = value;
  }

  void addToCategoryList(FilterModelStruct value) {
    categoryList.add(value);
  }

  void removeFromCategoryList(FilterModelStruct value) {
    categoryList.remove(value);
  }

  void removeAtIndexFromCategoryList(int index) {
    categoryList.removeAt(index);
  }

  void updateCategoryListAtIndex(
    int index,
    FilterModelStruct Function(FilterModelStruct) updateFn,
  ) {
    categoryList[index] = updateFn(_categoryList[index]);
  }

  void insertAtIndexInCategoryList(int index, FilterModelStruct value) {
    categoryList.insert(index, value);
  }

  List<SearchModelStruct> _searchList = [
    SearchModelStruct.fromSerializableMap(jsonDecode('{\"name\":\"Tables\"}')),
    SearchModelStruct.fromSerializableMap(
        jsonDecode('{\"name\":\"Dining Table\"}')),
    SearchModelStruct.fromSerializableMap(
        jsonDecode('{\"name\":\"Bookcases\"}')),
    SearchModelStruct.fromSerializableMap(jsonDecode('{\"name\":\"Dresser\"}')),
    SearchModelStruct.fromSerializableMap(
        jsonDecode('{\"name\":\"Living room\"}')),
    SearchModelStruct.fromSerializableMap(
        jsonDecode('{\"name\":\"Office furniture\"}')),
    SearchModelStruct.fromSerializableMap(jsonDecode('{\"name\":\"Seating\"}'))
  ];
  List<SearchModelStruct> get searchList => _searchList;
  set searchList(List<SearchModelStruct> value) {
    _searchList = value;
  }

  void addToSearchList(SearchModelStruct value) {
    searchList.add(value);
  }

  void removeFromSearchList(SearchModelStruct value) {
    searchList.remove(value);
  }

  void removeAtIndexFromSearchList(int index) {
    searchList.removeAt(index);
  }

  void updateSearchListAtIndex(
    int index,
    SearchModelStruct Function(SearchModelStruct) updateFn,
  ) {
    searchList[index] = updateFn(_searchList[index]);
  }

  void insertAtIndexInSearchList(int index, SearchModelStruct value) {
    searchList.insert(index, value);
  }

  List<NotificationModelStruct> _notificationList = [
    NotificationModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Notifications show when you swipe.\",\"time\":\"Just now\"}')),
    NotificationModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Swipe down from the top of hugd.\",\"time\":\"1 Min\"}')),
    NotificationModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Some notifications can also show.\",\"time\":\"2 Min\"}')),
    NotificationModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"The notifications provides overview\",\"time\":\"5 Min\"}')),
    NotificationModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Monitor system during periods ma.\",\"time\":\"10 Min\"}')),
    NotificationModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Contains data when the system hu.\",\"time\":\"20 Min\"}')),
    NotificationModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Contains data when the system hu.\",\"time\":\"30 Min\"}')),
    NotificationModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Notifications show when you swipe.\",\"time\":\"40 Min\"}'))
  ];
  List<NotificationModelStruct> get notificationList => _notificationList;
  set notificationList(List<NotificationModelStruct> value) {
    _notificationList = value;
  }

  void addToNotificationList(NotificationModelStruct value) {
    notificationList.add(value);
  }

  void removeFromNotificationList(NotificationModelStruct value) {
    notificationList.remove(value);
  }

  void removeAtIndexFromNotificationList(int index) {
    notificationList.removeAt(index);
  }

  void updateNotificationListAtIndex(
    int index,
    NotificationModelStruct Function(NotificationModelStruct) updateFn,
  ) {
    notificationList[index] = updateFn(_notificationList[index]);
  }

  void insertAtIndexInNotificationList(
      int index, NotificationModelStruct value) {
    notificationList.insert(index, value);
  }

  List<SearchResultModelStruct> _trandingProducts = [
    SearchResultModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/r2yry49ybkpo/beautiful-shot-stylish-grey-chair-isolated-white-background_1.png\",\"name\":\"Adirondack chair\",\"price\":\"\$120.00\"}')),
    SearchResultModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/pivp3uwgotc0/beautiful-shot-stylish-grey-chair-isolated-white-background_1_(1).png\",\"name\":\"Barcelona Chair\",\"price\":\"\$110.00\"}')),
    SearchResultModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/b5qihe0a7ls2/beautiful-shot-stylish-grey-chair-isolated-white-background_1_(7).png\",\"name\":\"Avro furniture\",\"price\":\"\$50.00\"}')),
    SearchResultModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/xu26bxit2rjl/beautiful-shot-stylish-grey-chair-isolated-white-background_1_(8).png\",\"name\":\"Comfort creation\",\"price\":\"\$35.00\"}')),
    SearchResultModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/tvilop1yhk0x/beautiful-shot-stylish-grey-chair-isolated-white-background_1_(9).png\",\"name\":\"Plastic moulded\",\"price\":\"\$14.00\"}')),
    SearchResultModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/eilutey35h85/beautiful-shot-stylish-grey-chair-isolated-white-background_1_(10).png\",\"name\":\"Nilkamal set\",\"price\":\"\$70.00\"}')),
    SearchResultModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/2g4qngqmuive/Group_1171275474_(3).png\",\"name\":\"High Back Chair\",\"price\":\"\$95.00\"}')),
    SearchResultModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/bmlxjqgn2lgo/beautiful-shot-stylish-grey-chair-isolated-white-background_1_(11).png\",\"name\":\"Relaxed armchair\",\"price\":\"\$20.00\"}'))
  ];
  List<SearchResultModelStruct> get trandingProducts => _trandingProducts;
  set trandingProducts(List<SearchResultModelStruct> value) {
    _trandingProducts = value;
  }

  void addToTrandingProducts(SearchResultModelStruct value) {
    trandingProducts.add(value);
  }

  void removeFromTrandingProducts(SearchResultModelStruct value) {
    trandingProducts.remove(value);
  }

  void removeAtIndexFromTrandingProducts(int index) {
    trandingProducts.removeAt(index);
  }

  void updateTrandingProductsAtIndex(
    int index,
    SearchResultModelStruct Function(SearchResultModelStruct) updateFn,
  ) {
    trandingProducts[index] = updateFn(_trandingProducts[index]);
  }

  void insertAtIndexInTrandingProducts(
      int index, SearchResultModelStruct value) {
    trandingProducts.insert(index, value);
  }

  List<ExploreModelStruct> _exploreDetail = [
    ExploreModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Bentwood Chair\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/ihw0kblp626u/photo-modern-luxury-arm-chair-furniture-design_1.png\",\"price\":\"\$80.00\"}')),
    ExploreModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Statistical table\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/je2qow40k6bq/Group_1171275474.png\",\"price\":\"\$80.00\"}')),
    ExploreModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Characteristic table\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/r9gc1lqxfpx9/beautiful-shot-stylish-grey-chair-isolated-white-background_1_(4).png\",\"price\":\"\$30.00\"}')),
    ExploreModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Possibly table\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/4kmqkrwcua3x/beautiful-shot-stylish-grey-chair-isolated-white-background_1_(5).png\",\"price\":\"\$14.00\"}')),
    ExploreModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Lift-top table\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/iprhholmzx19/beautiful-shot-stylish-grey-chair-isolated-white-background_1_(6).png\",\"price\":\"\$20.00\"}')),
    ExploreModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Avro furniture\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/b5qihe0a7ls2/beautiful-shot-stylish-grey-chair-isolated-white-background_1_(7).png\",\"price\":\"\$50.00\"}')),
    ExploreModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Barcelona Chair\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/pivp3uwgotc0/beautiful-shot-stylish-grey-chair-isolated-white-background_1_(1).png\",\"price\":\"\$110.00\"}')),
    ExploreModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Nilkamal set\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/eilutey35h85/beautiful-shot-stylish-grey-chair-isolated-white-background_1_(10).png\",\"price\":\"\$70.00\"}'))
  ];
  List<ExploreModelStruct> get exploreDetail => _exploreDetail;
  set exploreDetail(List<ExploreModelStruct> value) {
    _exploreDetail = value;
  }

  void addToExploreDetail(ExploreModelStruct value) {
    exploreDetail.add(value);
  }

  void removeFromExploreDetail(ExploreModelStruct value) {
    exploreDetail.remove(value);
  }

  void removeAtIndexFromExploreDetail(int index) {
    exploreDetail.removeAt(index);
  }

  void updateExploreDetailAtIndex(
    int index,
    ExploreModelStruct Function(ExploreModelStruct) updateFn,
  ) {
    exploreDetail[index] = updateFn(_exploreDetail[index]);
  }

  void insertAtIndexInExploreDetail(int index, ExploreModelStruct value) {
    exploreDetail.insert(index, value);
  }

  List<SearchResultModelStruct> _favouritelist = [];
  List<SearchResultModelStruct> get favouritelist => _favouritelist;
  set favouritelist(List<SearchResultModelStruct> value) {
    _favouritelist = value;
  }

  void addToFavouritelist(SearchResultModelStruct value) {
    favouritelist.add(value);
  }

  void removeFromFavouritelist(SearchResultModelStruct value) {
    favouritelist.remove(value);
  }

  void removeAtIndexFromFavouritelist(int index) {
    favouritelist.removeAt(index);
  }

  void updateFavouritelistAtIndex(
    int index,
    SearchResultModelStruct Function(SearchResultModelStruct) updateFn,
  ) {
    favouritelist[index] = updateFn(_favouritelist[index]);
  }

  void insertAtIndexInFavouritelist(int index, SearchResultModelStruct value) {
    favouritelist.insert(index, value);
  }

  List<ExploreModelStruct> _checkout = [
    ExploreModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Office\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/3am7vdi1cpdg/Radio_button_(3).png\",\"price\":\"4517 washington ave. manchester, kentucky 39495\"}')),
    ExploreModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Home \",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/h8euxowwb10c/Radio_button_(2).png\",\"price\":\"2118 thornridge cir. syracuse, connecticut 35624\"}'))
  ];
  List<ExploreModelStruct> get checkout => _checkout;
  set checkout(List<ExploreModelStruct> value) {
    _checkout = value;
  }

  void addToCheckout(ExploreModelStruct value) {
    checkout.add(value);
  }

  void removeFromCheckout(ExploreModelStruct value) {
    checkout.remove(value);
  }

  void removeAtIndexFromCheckout(int index) {
    checkout.removeAt(index);
  }

  void updateCheckoutAtIndex(
    int index,
    ExploreModelStruct Function(ExploreModelStruct) updateFn,
  ) {
    checkout[index] = updateFn(_checkout[index]);
  }

  void insertAtIndexInCheckout(int index, ExploreModelStruct value) {
    checkout.insert(index, value);
  }

  List<FilterModelStruct> _guestList = [
    FilterModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Security\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/bqk9sm79rb9n/Group_1171275234.png\"}')),
    FilterModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Settings\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/htlb3n1i1qiz/Group_1171275234_(1).png\"}')),
    FilterModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Privacy policy\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/iwc9j9jcjldv/Group_1171275234_(2).png\"}')),
    FilterModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Terms & conditions\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/3hczsh3lrkvp/Group_1171275234_(3).png\"}'))
  ];
  List<FilterModelStruct> get guestList => _guestList;
  set guestList(List<FilterModelStruct> value) {
    _guestList = value;
  }

  void addToGuestList(FilterModelStruct value) {
    guestList.add(value);
  }

  void removeFromGuestList(FilterModelStruct value) {
    guestList.remove(value);
  }

  void removeAtIndexFromGuestList(int index) {
    guestList.removeAt(index);
  }

  void updateGuestListAtIndex(
    int index,
    FilterModelStruct Function(FilterModelStruct) updateFn,
  ) {
    guestList[index] = updateFn(_guestList[index]);
  }

  void insertAtIndexInGuestList(int index, FilterModelStruct value) {
    guestList.insert(index, value);
  }

  List<FilterModelStruct> _settingList = [
    FilterModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"About us\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/ui6jvc6ppgnz/Group_1171275234_(6).png\"}')),
    FilterModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Help\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/0ntg42f0mf2b/Group_1171275234_(7).png\"}')),
    FilterModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Feedback\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/nqgx1nz23dg5/Group_1171275234_(8).png\"}'))
  ];
  List<FilterModelStruct> get settingList => _settingList;
  set settingList(List<FilterModelStruct> value) {
    _settingList = value;
  }

  void addToSettingList(FilterModelStruct value) {
    settingList.add(value);
  }

  void removeFromSettingList(FilterModelStruct value) {
    settingList.remove(value);
  }

  void removeAtIndexFromSettingList(int index) {
    settingList.removeAt(index);
  }

  void updateSettingListAtIndex(
    int index,
    FilterModelStruct Function(FilterModelStruct) updateFn,
  ) {
    settingList[index] = updateFn(_settingList[index]);
  }

  void insertAtIndexInSettingList(int index, FilterModelStruct value) {
    settingList.insert(index, value);
  }

  int _introIndex = 0;
  int get introIndex => _introIndex;
  set introIndex(int value) {
    _introIndex = value;
  }

  bool _isIntro = false;
  bool get isIntro => _isIntro;
  set isIntro(bool value) {
    _isIntro = value;
    prefs.setBool('ff_isIntro', value);
  }

  bool _isLogin = false;
  bool get isLogin => _isLogin;
  set isLogin(bool value) {
    _isLogin = value;
    prefs.setBool('ff_isLogin', value);
  }

  List<FilterModelStruct> _guestPofile1 = [
    FilterModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"My profile\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/ioe0lhit7qte/Group_1171275234_(9).png\"}')),
    FilterModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Security\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/imyjcoume5l1/Group_1171275234_(4).png\"}')),
    FilterModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Settings\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/htlb3n1i1qiz/Group_1171275234_(1).png\"}')),
    FilterModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"My orders\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/rbi0unrpmm3w/Group_1171275234_(10).png\"}')),
    FilterModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Privacy policy\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/iwc9j9jcjldv/Group_1171275234_(2).png\"}')),
    FilterModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Terms & conditions\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/3hczsh3lrkvp/Group_1171275234_(3).png\"}')),
    FilterModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Log out\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/olm2cqz3llmu/Group_1171275234_(11).png\"}'))
  ];
  List<FilterModelStruct> get guestPofile1 => _guestPofile1;
  set guestPofile1(List<FilterModelStruct> value) {
    _guestPofile1 = value;
  }

  void addToGuestPofile1(FilterModelStruct value) {
    guestPofile1.add(value);
  }

  void removeFromGuestPofile1(FilterModelStruct value) {
    guestPofile1.remove(value);
  }

  void removeAtIndexFromGuestPofile1(int index) {
    guestPofile1.removeAt(index);
  }

  void updateGuestPofile1AtIndex(
    int index,
    FilterModelStruct Function(FilterModelStruct) updateFn,
  ) {
    guestPofile1[index] = updateFn(_guestPofile1[index]);
  }

  void insertAtIndexInGuestPofile1(int index, FilterModelStruct value) {
    guestPofile1.insert(index, value);
  }

  int _select = 0;
  int get select => _select;
  set select(int value) {
    _select = value;
  }

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  set selectedIndex(int value) {
    _selectedIndex = value;
  }

  bool _profile = false;
  bool get profile => _profile;
  set profile(bool value) {
    _profile = value;
    prefs.setBool('ff_profile', value);
  }

  List<SearchResultModelStruct> _favouriteList = [
    SearchResultModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/8400pkatk3fc/beautiful-shot-stylish-grey-chair-isolated-white-background_1_(2).png\",\"name\":\"Classified table\",\"price\":\"\$50.00\"}')),
    SearchResultModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/uyknp4mosnri/beautiful-shot-stylish-grey-chair-isolated-white-background_1_(3).png\",\"name\":\"Simple table\",\"price\":\"\$20.00\"}')),
    SearchResultModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/i1u6w40e9wuo/Group_1171275474_(1).png\",\"name\":\"Coffee table\",\"price\":\"\$70.00\"}')),
    SearchResultModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/fcex3vpate5b/Group_1171275474_(2).png\",\"name\":\"Rectangular table\",\"price\":\"\$95.00\"}')),
    SearchResultModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/jf4lf53fnjyc/beautiful-shot-stylish-grey-chair-isolated-white-background_1.png\",\"name\":\"Adirondack chair\",\"price\":\"\$120.00\"}')),
    SearchResultModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/xu26bxit2rjl/beautiful-shot-stylish-grey-chair-isolated-white-background_1_(8).png\",\"name\":\"Comfort creation\",\"price\":\"\$35.00\"}'))
  ];
  List<SearchResultModelStruct> get favouriteList => _favouriteList;
  set favouriteList(List<SearchResultModelStruct> value) {
    _favouriteList = value;
  }

  void addToFavouriteList(SearchResultModelStruct value) {
    favouriteList.add(value);
  }

  void removeFromFavouriteList(SearchResultModelStruct value) {
    favouriteList.remove(value);
  }

  void removeAtIndexFromFavouriteList(int index) {
    favouriteList.removeAt(index);
  }

  void updateFavouriteListAtIndex(
    int index,
    SearchResultModelStruct Function(SearchResultModelStruct) updateFn,
  ) {
    favouriteList[index] = updateFn(_favouriteList[index]);
  }

  void insertAtIndexInFavouriteList(int index, SearchResultModelStruct value) {
    favouriteList.insert(index, value);
  }

  List<ChatmodelStruct> _chatList = [
    ChatmodelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/furniture-app-project-7xakkg/assets/j6sxf3xrdjrc/chat-1.svg\",\"title\":\"Basinah Quraishi\",\"description\":\"Hello sir\",\"time\":\"27 Min\"}')),
    ChatmodelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/furniture-app-project-7xakkg/assets/ckaams54anto/chat-5.svg\",\"title\":\"Iftikar Buthayna\",\"description\":\"Good morning sir\",\"time\":\"27 Min\"}')),
    ChatmodelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/furniture-app-project-7xakkg/assets/34pfdvtve4o8/chat-3.svg\",\"title\":\"Iftikar Buthayna\",\"description\":\"Good morning sir\",\"time\":\"27 Min\"}')),
    ChatmodelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/furniture-app-project-7xakkg/assets/wyzats16ii9q/chat-4.svg\",\"title\":\"Radeyah Hawra\",\"description\":\"Potilies sir\",\"time\":\"17 Min\"}')),
    ChatmodelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/furniture-app-project-7xakkg/assets/ckaams54anto/chat-5.svg\",\"title\":\"May Dunya\",\"description\":\"36154212\",\"time\":\"18 Min\"}')),
    ChatmodelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/furniture-app-project-7xakkg/assets/f3b62nwuvdes/chat-6.svg\",\"title\":\"Fayruz Awad\",\"description\":\"Loadig\",\"time\":\"11 Min\"}')),
    ChatmodelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/furniture-app-project-7xakkg/assets/wyzats16ii9q/chat-4.svg\",\"title\":\"Jala Rumaylah\",\"description\":\"Hello sir\",\"time\":\"12 Min\"}'))
  ];
  List<ChatmodelStruct> get chatList => _chatList;
  set chatList(List<ChatmodelStruct> value) {
    _chatList = value;
  }

  void addToChatList(ChatmodelStruct value) {
    chatList.add(value);
  }

  void removeFromChatList(ChatmodelStruct value) {
    chatList.remove(value);
  }

  void removeAtIndexFromChatList(int index) {
    chatList.removeAt(index);
  }

  void updateChatListAtIndex(
    int index,
    ChatmodelStruct Function(ChatmodelStruct) updateFn,
  ) {
    chatList[index] = updateFn(_chatList[index]);
  }

  void insertAtIndexInChatList(int index, ChatmodelStruct value) {
    chatList.insert(index, value);
  }

  List<PaymentmodelStruct> _paymentList = [
    PaymentmodelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/t9zlcd4on141/Group_1171275512.png\",\"title\":\"Google pay\",\"description\":\"XXXX XXXX 125\",\"image1\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/hggxe08nf8y2/Radio_button_(2).png\"}')),
    PaymentmodelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/gsp64qf63jgw/Group_1171275515.png\",\"title\":\"Paypal\",\"description\":\"XXXX XXXX 3698\",\"image1\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/3am7vdi1cpdg/Radio_button_(3).png\"}')),
    PaymentmodelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/yjl8ui7h5tgg/Group_1171275518.png\",\"title\":\"Visa\",\"description\":\"XXXX XXXX 3698\",\"image1\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/3am7vdi1cpdg/Radio_button_(3).png\"}'))
  ];
  List<PaymentmodelStruct> get paymentList => _paymentList;
  set paymentList(List<PaymentmodelStruct> value) {
    _paymentList = value;
  }

  void addToPaymentList(PaymentmodelStruct value) {
    paymentList.add(value);
  }

  void removeFromPaymentList(PaymentmodelStruct value) {
    paymentList.remove(value);
  }

  void removeAtIndexFromPaymentList(int index) {
    paymentList.removeAt(index);
  }

  void updatePaymentListAtIndex(
    int index,
    PaymentmodelStruct Function(PaymentmodelStruct) updateFn,
  ) {
    paymentList[index] = updateFn(_paymentList[index]);
  }

  void insertAtIndexInPaymentList(int index, PaymentmodelStruct value) {
    paymentList.insert(index, value);
  }

  List<FilterModelStruct> _homeCategory = [
    FilterModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Table\",\"image\":\"file:///Users/dreamworld/Desktop/dhruvika/Furniture%20image/Group%201171275473.svg\"}')),
    FilterModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Chair\",\"image\":\"file:///Users/dreamworld/Desktop/dhruvika/Furniture%20image/Group%201171275473%20(1).svg\"}')),
    FilterModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Bed\",\"image\":\"file:///Users/dreamworld/Desktop/dhruvika/Furniture%20image/Group%201171275473%20(2).svg\"}')),
    FilterModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Lamp\",\"image\":\"file:///Users/dreamworld/Desktop/dhruvika/Furniture%20image/Group%201171275473%20(3).svg\"}'))
  ];
  List<FilterModelStruct> get homeCategory => _homeCategory;
  set homeCategory(List<FilterModelStruct> value) {
    _homeCategory = value;
  }

  void addToHomeCategory(FilterModelStruct value) {
    homeCategory.add(value);
  }

  void removeFromHomeCategory(FilterModelStruct value) {
    homeCategory.remove(value);
  }

  void removeAtIndexFromHomeCategory(int index) {
    homeCategory.removeAt(index);
  }

  void updateHomeCategoryAtIndex(
    int index,
    FilterModelStruct Function(FilterModelStruct) updateFn,
  ) {
    homeCategory[index] = updateFn(_homeCategory[index]);
  }

  void insertAtIndexInHomeCategory(int index, FilterModelStruct value) {
    homeCategory.insert(index, value);
  }

  List<MyOrderModelStruct> _myOrderList = [
    MyOrderModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/qq1z7dgpsomk/beautiful-shot-stylish-grey-chair-isolated-white-background_1_(5).png\",\"title\":\"Possibly table\",\"price\":\"\$30.00\",\"Cname\":\"Pending\",\"color\":\"#0000\"}')),
    MyOrderModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/ihw0kblp626u/photo-modern-luxury-arm-chair-furniture-design_1.png\",\"title\":\"Bentwood Chair\",\"price\":\"\$80.00\",\"Cname\":\"Delivered\",\"color\":\"#0000\"}')),
    MyOrderModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/uyknp4mosnri/beautiful-shot-stylish-grey-chair-isolated-white-background_1_(3).png\",\"title\":\"Simple table\",\"price\":\"\$20.00\",\"Cname\":\"Cancelled\",\"color\":\"#0000\"}'))
  ];
  List<MyOrderModelStruct> get myOrderList => _myOrderList;
  set myOrderList(List<MyOrderModelStruct> value) {
    _myOrderList = value;
  }

  void addToMyOrderList(MyOrderModelStruct value) {
    myOrderList.add(value);
  }

  void removeFromMyOrderList(MyOrderModelStruct value) {
    myOrderList.remove(value);
  }

  void removeAtIndexFromMyOrderList(int index) {
    myOrderList.removeAt(index);
  }

  void updateMyOrderListAtIndex(
    int index,
    MyOrderModelStruct Function(MyOrderModelStruct) updateFn,
  ) {
    myOrderList[index] = updateFn(_myOrderList[index]);
  }

  void insertAtIndexInMyOrderList(int index, MyOrderModelStruct value) {
    myOrderList.insert(index, value);
  }

  List<ExploreModelStruct> _itemList = [
    ExploreModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Bentwood Chair\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/d7hf6s4wkc3a/photo-modern-luxury-arm-chair-furniture-design_1.png\",\"price\":\"\$80.00\"}')),
    ExploreModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Possibly table\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/lmckllg15uqz/beautiful-shot-stylish-grey-chair-isolated-white-background_1_(5).png\",\"price\":\"\$14.00\"}')),
    ExploreModelStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Simple table\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/newflutter-lb6jmq/assets/cu9nevaoepuf/beautiful-shot-stylish-grey-chair-isolated-white-background_1_(3).png\",\"price\":\"\$20.00\"}'))
  ];
  List<ExploreModelStruct> get itemList => _itemList;
  set itemList(List<ExploreModelStruct> value) {
    _itemList = value;
  }

  void addToItemList(ExploreModelStruct value) {
    itemList.add(value);
  }

  void removeFromItemList(ExploreModelStruct value) {
    itemList.remove(value);
  }

  void removeAtIndexFromItemList(int index) {
    itemList.removeAt(index);
  }

  void updateItemListAtIndex(
    int index,
    ExploreModelStruct Function(ExploreModelStruct) updateFn,
  ) {
    itemList[index] = updateFn(_itemList[index]);
  }

  void insertAtIndexInItemList(int index, ExploreModelStruct value) {
    itemList.insert(index, value);
  }

  int _CheckOutIndex = 0;
  int get CheckOutIndex => _CheckOutIndex;
  set CheckOutIndex(int value) {
    _CheckOutIndex = value;
    prefs.setInt('ff_CheckOutIndex', value);
  }

  int _selectHomeIndex = 0;
  int get selectHomeIndex => _selectHomeIndex;
  set selectHomeIndex(int value) {
    _selectHomeIndex = value;
    prefs.setInt('ff_selectHomeIndex', value);
  }

  String _selectedCategory = '';
  String get selectedCategory => _selectedCategory;
  set selectedCategory(String value) {
    _selectedCategory = value;
  }

  bool _isOnboarding = false;
  bool get isOnboarding => _isOnboarding;
  set isOnboarding(bool value) {
    _isOnboarding = value;
    prefs.setBool('ff_isOnboarding', value);
  }

  List<String> _Interests = [];
  List<String> get Interests => _Interests;
  set Interests(List<String> value) {
    _Interests = value;
    prefs.setStringList('ff_Interests', value);
  }

  void addToInterests(String value) {
    Interests.add(value);
    prefs.setStringList('ff_Interests', _Interests);
  }

  void removeFromInterests(String value) {
    Interests.remove(value);
    prefs.setStringList('ff_Interests', _Interests);
  }

  void removeAtIndexFromInterests(int index) {
    Interests.removeAt(index);
    prefs.setStringList('ff_Interests', _Interests);
  }

  void updateInterestsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    Interests[index] = updateFn(_Interests[index]);
    prefs.setStringList('ff_Interests', _Interests);
  }

  void insertAtIndexInInterests(int index, String value) {
    Interests.insert(index, value);
    prefs.setStringList('ff_Interests', _Interests);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
