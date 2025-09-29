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
      _selectHomeIndex = prefs.getInt('ff_selectHomeIndex') ?? _selectHomeIndex;
    });
    _safeInit(() {
      _isOnboarding = prefs.getBool('ff_isOnboarding') ?? _isOnboarding;
    });
    _safeInit(() {
      _isAccountCreated =
          prefs.getBool('ff_isAccountCreated') ?? _isAccountCreated;
    });
    _safeInit(() {
      _UserIsReported = prefs.getBool('ff_UserIsReported') ?? _UserIsReported;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_userInfo')) {
        try {
          final serializedData = prefs.getString('ff_userInfo') ?? '{}';
          _userInfo =
              UserInfoStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_marketPlaceMeta')) {
        try {
          final serializedData = prefs.getString('ff_marketPlaceMeta') ?? '{}';
          _marketPlaceMeta =
              MarketModelStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _postLike = prefs.getBool('ff_postLike') ?? _postLike;
    });
    _safeInit(() {
      _ReportedPosts = prefs
              .getStringList('ff_ReportedPosts')
              ?.map((x) {
                try {
                  return ReportedPostsStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _ReportedPosts;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_filterAppState')) {
        try {
          final serializedData = prefs.getString('ff_filterAppState') ?? '{}';
          _filterAppState = FilterModel2Struct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _alICsv = prefs.getString('ff_alICsv') ?? _alICsv;
    });
    _safeInit(() {
      _IsGust = prefs.getBool('ff_IsGust') ?? _IsGust;
    });
    _safeInit(() {
      _TopCatState = prefs
              .getStringList('ff_TopCatState')
              ?.map((x) {
                try {
                  return TopCatModelStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _TopCatState;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

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

  bool _isAccountCreated = false;
  bool get isAccountCreated => _isAccountCreated;
  set isAccountCreated(bool value) {
    _isAccountCreated = value;
    prefs.setBool('ff_isAccountCreated', value);
  }

  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  set errorMessage(String value) {
    _errorMessage = value;
  }

  bool _UserIsReported = false;
  bool get UserIsReported => _UserIsReported;
  set UserIsReported(bool value) {
    _UserIsReported = value;
    prefs.setBool('ff_UserIsReported', value);
  }

  UserInfoStruct _userInfo =
      UserInfoStruct.fromSerializableMap(jsonDecode('{\"Fav_List\":\"[]\"}'));
  UserInfoStruct get userInfo => _userInfo;
  set userInfo(UserInfoStruct value) {
    _userInfo = value;
    prefs.setString('ff_userInfo', value.serialize());
  }

  void updateUserInfoStruct(Function(UserInfoStruct) updateFn) {
    updateFn(_userInfo);
    prefs.setString('ff_userInfo', _userInfo.serialize());
  }

  MarketModelStruct _marketPlaceMeta = MarketModelStruct.fromSerializableMap(
      jsonDecode(
          '{\"Id\":\"1\",\"price_text\":\"\",\"likes\":\"0\",\"Images\":\"[]\",\"reported\":\"false\",\"is_open_to_exchange\":\"false\",\"exchange_description\":\"\",\"exchange_wish_list\":\"[]\",\"exchange_sub_cat_ids\":\"[]\"}'));
  MarketModelStruct get marketPlaceMeta => _marketPlaceMeta;
  set marketPlaceMeta(MarketModelStruct value) {
    _marketPlaceMeta = value;
    prefs.setString('ff_marketPlaceMeta', value.serialize());
  }

  void updateMarketPlaceMetaStruct(Function(MarketModelStruct) updateFn) {
    updateFn(_marketPlaceMeta);
    prefs.setString('ff_marketPlaceMeta', _marketPlaceMeta.serialize());
  }

  List<CategoriesDicStruct> _catList = [];
  List<CategoriesDicStruct> get catList => _catList;
  set catList(List<CategoriesDicStruct> value) {
    _catList = value;
  }

  void addToCatList(CategoriesDicStruct value) {
    catList.add(value);
  }

  void removeFromCatList(CategoriesDicStruct value) {
    catList.remove(value);
  }

  void removeAtIndexFromCatList(int index) {
    catList.removeAt(index);
  }

  void updateCatListAtIndex(
    int index,
    CategoriesDicStruct Function(CategoriesDicStruct) updateFn,
  ) {
    catList[index] = updateFn(_catList[index]);
  }

  void insertAtIndexInCatList(int index, CategoriesDicStruct value) {
    catList.insert(index, value);
  }

  bool _postLike = false;
  bool get postLike => _postLike;
  set postLike(bool value) {
    _postLike = value;
    prefs.setBool('ff_postLike', value);
  }

  List<ReportedPostsStruct> _ReportedPosts = [];
  List<ReportedPostsStruct> get ReportedPosts => _ReportedPosts;
  set ReportedPosts(List<ReportedPostsStruct> value) {
    _ReportedPosts = value;
    prefs.setStringList(
        'ff_ReportedPosts', value.map((x) => x.serialize()).toList());
  }

  void addToReportedPosts(ReportedPostsStruct value) {
    ReportedPosts.add(value);
    prefs.setStringList(
        'ff_ReportedPosts', _ReportedPosts.map((x) => x.serialize()).toList());
  }

  void removeFromReportedPosts(ReportedPostsStruct value) {
    ReportedPosts.remove(value);
    prefs.setStringList(
        'ff_ReportedPosts', _ReportedPosts.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromReportedPosts(int index) {
    ReportedPosts.removeAt(index);
    prefs.setStringList(
        'ff_ReportedPosts', _ReportedPosts.map((x) => x.serialize()).toList());
  }

  void updateReportedPostsAtIndex(
    int index,
    ReportedPostsStruct Function(ReportedPostsStruct) updateFn,
  ) {
    ReportedPosts[index] = updateFn(_ReportedPosts[index]);
    prefs.setStringList(
        'ff_ReportedPosts', _ReportedPosts.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInReportedPosts(int index, ReportedPostsStruct value) {
    ReportedPosts.insert(index, value);
    prefs.setStringList(
        'ff_ReportedPosts', _ReportedPosts.map((x) => x.serialize()).toList());
  }

  String _searchError = '\"\"';
  String get searchError => _searchError;
  set searchError(String value) {
    _searchError = value;
  }

  List<dynamic> _searchResults = [];
  List<dynamic> get searchResults => _searchResults;
  set searchResults(List<dynamic> value) {
    _searchResults = value;
  }

  void addToSearchResults(dynamic value) {
    searchResults.add(value);
  }

  void removeFromSearchResults(dynamic value) {
    searchResults.remove(value);
  }

  void removeAtIndexFromSearchResults(int index) {
    searchResults.removeAt(index);
  }

  void updateSearchResultsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    searchResults[index] = updateFn(_searchResults[index]);
  }

  void insertAtIndexInSearchResults(int index, dynamic value) {
    searchResults.insert(index, value);
  }

  bool _appendResults = false;
  bool get appendResults => _appendResults;
  set appendResults(bool value) {
    _appendResults = value;
  }

  FilterModel2Struct _filterAppState = FilterModel2Struct.fromSerializableMap(
      jsonDecode(
          '{\"main_cat_id\":\"[]\",\"user_city\":\"[]\",\"cat_id\":\"[]\",\"cat_name\":\"[]\",\"sub_cat_id\":\"[]\",\"sub_cat_name\":\"[]\",\"exchange_wishlist_id\":\"[]\",\"YekjaVerified\":\"[]\",\"city_id\":\"[]\"}'));
  FilterModel2Struct get filterAppState => _filterAppState;
  set filterAppState(FilterModel2Struct value) {
    _filterAppState = value;
    prefs.setString('ff_filterAppState', value.serialize());
  }

  void updateFilterAppStateStruct(Function(FilterModel2Struct) updateFn) {
    updateFn(_filterAppState);
    prefs.setString('ff_filterAppState', _filterAppState.serialize());
  }

  String _alICsv =
      '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,32,33,34,35,36,37,38,39,40';
  String get alICsv => _alICsv;
  set alICsv(String value) {
    _alICsv = value;
    prefs.setString('ff_alICsv', value);
  }

  bool _IsGust = false;
  bool get IsGust => _IsGust;
  set IsGust(bool value) {
    _IsGust = value;
    prefs.setBool('ff_IsGust', value);
  }

  List<TopCatModelStruct> _TopCatState = [];
  List<TopCatModelStruct> get TopCatState => _TopCatState;
  set TopCatState(List<TopCatModelStruct> value) {
    _TopCatState = value;
    prefs.setStringList(
        'ff_TopCatState', value.map((x) => x.serialize()).toList());
  }

  void addToTopCatState(TopCatModelStruct value) {
    TopCatState.add(value);
    prefs.setStringList(
        'ff_TopCatState', _TopCatState.map((x) => x.serialize()).toList());
  }

  void removeFromTopCatState(TopCatModelStruct value) {
    TopCatState.remove(value);
    prefs.setStringList(
        'ff_TopCatState', _TopCatState.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromTopCatState(int index) {
    TopCatState.removeAt(index);
    prefs.setStringList(
        'ff_TopCatState', _TopCatState.map((x) => x.serialize()).toList());
  }

  void updateTopCatStateAtIndex(
    int index,
    TopCatModelStruct Function(TopCatModelStruct) updateFn,
  ) {
    TopCatState[index] = updateFn(_TopCatState[index]);
    prefs.setStringList(
        'ff_TopCatState', _TopCatState.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInTopCatState(int index, TopCatModelStruct value) {
    TopCatState.insert(index, value);
    prefs.setStringList(
        'ff_TopCatState', _TopCatState.map((x) => x.serialize()).toList());
  }

  List<CitiesModelStruct> _citiesList = [];
  List<CitiesModelStruct> get citiesList => _citiesList;
  set citiesList(List<CitiesModelStruct> value) {
    _citiesList = value;
  }

  void addToCitiesList(CitiesModelStruct value) {
    citiesList.add(value);
  }

  void removeFromCitiesList(CitiesModelStruct value) {
    citiesList.remove(value);
  }

  void removeAtIndexFromCitiesList(int index) {
    citiesList.removeAt(index);
  }

  void updateCitiesListAtIndex(
    int index,
    CitiesModelStruct Function(CitiesModelStruct) updateFn,
  ) {
    citiesList[index] = updateFn(_citiesList[index]);
  }

  void insertAtIndexInCitiesList(int index, CitiesModelStruct value) {
    citiesList.insert(index, value);
  }

  CitiesModelStruct _citiesRow = CitiesModelStruct();
  CitiesModelStruct get citiesRow => _citiesRow;
  set citiesRow(CitiesModelStruct value) {
    _citiesRow = value;
  }

  void updateCitiesRowStruct(Function(CitiesModelStruct) updateFn) {
    updateFn(_citiesRow);
  }

  int _sortByInt = 1;
  int get sortByInt => _sortByInt;
  set sortByInt(int value) {
    _sortByInt = value;
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
