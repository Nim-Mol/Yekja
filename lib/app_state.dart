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
      _catList = prefs
              .getStringList('ff_catList')
              ?.map((x) {
                try {
                  return SubcatModelStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _catList;
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
      _SubcatApp = prefs
              .getStringList('ff_SubcatApp')
              ?.map((x) {
                try {
                  return SubcatModelStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _SubcatApp;
    });
    _safeInit(() {
      _citiesApp = prefs
              .getStringList('ff_citiesApp')
              ?.map((x) {
                try {
                  return CitiesModelStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _citiesApp;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_GuestInfo')) {
        try {
          final serializedData = prefs.getString('ff_GuestInfo') ?? '{}';
          _GuestInfo =
              GuestUserStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
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

  List<SubcatModelStruct> _catList = [];
  List<SubcatModelStruct> get catList => _catList;
  set catList(List<SubcatModelStruct> value) {
    _catList = value;
    prefs.setStringList('ff_catList', value.map((x) => x.serialize()).toList());
  }

  void addToCatList(SubcatModelStruct value) {
    catList.add(value);
    prefs.setStringList(
        'ff_catList', _catList.map((x) => x.serialize()).toList());
  }

  void removeFromCatList(SubcatModelStruct value) {
    catList.remove(value);
    prefs.setStringList(
        'ff_catList', _catList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCatList(int index) {
    catList.removeAt(index);
    prefs.setStringList(
        'ff_catList', _catList.map((x) => x.serialize()).toList());
  }

  void updateCatListAtIndex(
    int index,
    SubcatModelStruct Function(SubcatModelStruct) updateFn,
  ) {
    catList[index] = updateFn(_catList[index]);
    prefs.setStringList(
        'ff_catList', _catList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCatList(int index, SubcatModelStruct value) {
    catList.insert(index, value);
    prefs.setStringList(
        'ff_catList', _catList.map((x) => x.serialize()).toList());
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
      '0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,480,481,482,483,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,500, 5000';
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

  int _sortByInt = 1;
  int get sortByInt => _sortByInt;
  set sortByInt(int value) {
    _sortByInt = value;
  }

  PostModelStruct _postState = PostModelStruct();
  PostModelStruct get postState => _postState;
  set postState(PostModelStruct value) {
    _postState = value;
  }

  void updatePostStateStruct(Function(PostModelStruct) updateFn) {
    updateFn(_postState);
  }

  dynamic _postDetailJSON;
  dynamic get postDetailJSON => _postDetailJSON;
  set postDetailJSON(dynamic value) {
    _postDetailJSON = value;
  }

  String _postDetailTable = '';
  String get postDetailTable => _postDetailTable;
  set postDetailTable(String value) {
    _postDetailTable = value;
  }

  List<String> _postLanguagesState = [];
  List<String> get postLanguagesState => _postLanguagesState;
  set postLanguagesState(List<String> value) {
    _postLanguagesState = value;
  }

  void addToPostLanguagesState(String value) {
    postLanguagesState.add(value);
  }

  void removeFromPostLanguagesState(String value) {
    postLanguagesState.remove(value);
  }

  void removeAtIndexFromPostLanguagesState(int index) {
    postLanguagesState.removeAt(index);
  }

  void updatePostLanguagesStateAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    postLanguagesState[index] = updateFn(_postLanguagesState[index]);
  }

  void insertAtIndexInPostLanguagesState(int index, String value) {
    postLanguagesState.insert(index, value);
  }

  String _posteExchangeWishlistIds = '';
  String get posteExchangeWishlistIds => _posteExchangeWishlistIds;
  set posteExchangeWishlistIds(String value) {
    _posteExchangeWishlistIds = value;
  }

  List<SubcatModelStruct> _SubcatApp = [];
  List<SubcatModelStruct> get SubcatApp => _SubcatApp;
  set SubcatApp(List<SubcatModelStruct> value) {
    _SubcatApp = value;
    prefs.setStringList(
        'ff_SubcatApp', value.map((x) => x.serialize()).toList());
  }

  void addToSubcatApp(SubcatModelStruct value) {
    SubcatApp.add(value);
    prefs.setStringList(
        'ff_SubcatApp', _SubcatApp.map((x) => x.serialize()).toList());
  }

  void removeFromSubcatApp(SubcatModelStruct value) {
    SubcatApp.remove(value);
    prefs.setStringList(
        'ff_SubcatApp', _SubcatApp.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromSubcatApp(int index) {
    SubcatApp.removeAt(index);
    prefs.setStringList(
        'ff_SubcatApp', _SubcatApp.map((x) => x.serialize()).toList());
  }

  void updateSubcatAppAtIndex(
    int index,
    SubcatModelStruct Function(SubcatModelStruct) updateFn,
  ) {
    SubcatApp[index] = updateFn(_SubcatApp[index]);
    prefs.setStringList(
        'ff_SubcatApp', _SubcatApp.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInSubcatApp(int index, SubcatModelStruct value) {
    SubcatApp.insert(index, value);
    prefs.setStringList(
        'ff_SubcatApp', _SubcatApp.map((x) => x.serialize()).toList());
  }

  List<CitiesModelStruct> _citiesApp = [];
  List<CitiesModelStruct> get citiesApp => _citiesApp;
  set citiesApp(List<CitiesModelStruct> value) {
    _citiesApp = value;
    prefs.setStringList(
        'ff_citiesApp', value.map((x) => x.serialize()).toList());
  }

  void addToCitiesApp(CitiesModelStruct value) {
    citiesApp.add(value);
    prefs.setStringList(
        'ff_citiesApp', _citiesApp.map((x) => x.serialize()).toList());
  }

  void removeFromCitiesApp(CitiesModelStruct value) {
    citiesApp.remove(value);
    prefs.setStringList(
        'ff_citiesApp', _citiesApp.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCitiesApp(int index) {
    citiesApp.removeAt(index);
    prefs.setStringList(
        'ff_citiesApp', _citiesApp.map((x) => x.serialize()).toList());
  }

  void updateCitiesAppAtIndex(
    int index,
    CitiesModelStruct Function(CitiesModelStruct) updateFn,
  ) {
    citiesApp[index] = updateFn(_citiesApp[index]);
    prefs.setStringList(
        'ff_citiesApp', _citiesApp.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCitiesApp(int index, CitiesModelStruct value) {
    citiesApp.insert(index, value);
    prefs.setStringList(
        'ff_citiesApp', _citiesApp.map((x) => x.serialize()).toList());
  }

  FilterSmallModelStruct _filterSmall =
      FilterSmallModelStruct.fromSerializableMap(
          jsonDecode('{\"main_cat_id\":\"2\",\"cat_id\":\"4\"}'));
  FilterSmallModelStruct get filterSmall => _filterSmall;
  set filterSmall(FilterSmallModelStruct value) {
    _filterSmall = value;
  }

  void updateFilterSmallStruct(Function(FilterSmallModelStruct) updateFn) {
    updateFn(_filterSmall);
  }

  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;
  set selectedDate(DateTime? value) {
    _selectedDate = value;
  }

  GuestUserStruct _GuestInfo = GuestUserStruct();
  GuestUserStruct get GuestInfo => _GuestInfo;
  set GuestInfo(GuestUserStruct value) {
    _GuestInfo = value;
    prefs.setString('ff_GuestInfo', value.serialize());
  }

  void updateGuestInfoStruct(Function(GuestUserStruct) updateFn) {
    updateFn(_GuestInfo);
    prefs.setString('ff_GuestInfo', _GuestInfo.serialize());
  }

  String _appLang = 'nl';
  String get appLang => _appLang;
  set appLang(String value) {
    _appLang = value;
  }

  bool _isGoingEvent = false;
  bool get isGoingEvent => _isGoingEvent;
  set isGoingEvent(bool value) {
    _isGoingEvent = value;
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
