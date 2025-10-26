import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SearchfilerapiCall {
  static Future<ApiCallResponse> call({
    int? offset,
    int? limit,
    String? term = '',
    String? sortby = 'created_at.desc.nullslast',
    String? subCatIdsCsv =
        '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,480,481,482,483,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,500',
    String? catIdsCsv =
        '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36',
    String? cityIdsCsv =
        '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,32,5000',
    String? verifiedCsv = 'true,false',
    int? likes = 0,
    String? hasimg = 'true,false',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'searchfilerapi ',
      apiUrl:
          'https://bkygphvuuqmpmcfrncpm.supabase.co/rest/v1/view_post_filter?select=*&or=(title.ilike.*${term}*,description.ilike.*${term}*,city.ilike.*${term}*,sub_cat_name.ilike.*${term}*,cat_name.ilike.*${term}*)&order=${sortby}&cat_id=in.(${catIdsCsv})&unique_subcat_id=in.(${subCatIdsCsv})&city_id=in.(${cityIdsCsv})&yekja_verified=in.(${verifiedCsv})&post_likes=gte.${likes}&has_images=in.(${hasimg})',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJreWdwaHZ1dXFtcG1jZnJuY3BtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTA1MjI3NjIsImV4cCI6MjA2NjA5ODc2Mn0.XHXZMXvuTQBe6vjI0xs-m8ztvxhmIImd8JJpV-LYAds',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJreWdwaHZ1dXFtcG1jZnJuY3BtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTA1MjI3NjIsImV4cCI6MjA2NjA5ODc2Mn0.XHXZMXvuTQBe6vjI0xs-m8ztvxhmIImd8JJpV-LYAds',
        'Content-Type': 'application/json',
      },
      params: {
        'offset': offset,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<int>? maincatid(dynamic response) => (getJsonField(
        response,
        r'''$[:].main_cat_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? subcatid(dynamic response) => (getJsonField(
        response,
        r'''$[:].sub_cat_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? maincatname(dynamic response) => (getJsonField(
        response,
        r'''$[:].main_cat_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? catid(dynamic response) => (getJsonField(
        response,
        r'''$[:].cat_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? catname(dynamic response) => (getJsonField(
        response,
        r'''$[:].cat_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<bool>? hasimage(dynamic response) => (getJsonField(
        response,
        r'''$[:].has_images''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  static List<String>? images(dynamic response) => (getJsonField(
        response,
        r'''$[:].images''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class FilterApiCopyCall {
  static Future<ApiCallResponse> call({
    int? offset,
    int? limit,
    String? sortby = 'created_at.desc.nullslast',
    String? subCatIdsCsv =
        '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,480,481,482,483,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,500',
    String? cityIdsCsv =
        '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,32,5000',
    String? mainCatIds = '1,2,3,4,5,6',
    String? catIds =
        '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'filterApi Copy',
      apiUrl:
          'https://bkygphvuuqmpmcfrncpm.supabase.co/rest/v1/view_post_search?select=*&main_cat_id=in.(${mainCatIds})&cat_id=in.(${catIds})&unique_subcat_id=in.(${subCatIdsCsv})&city_id=in.(${cityIdsCsv})&order=${sortby}',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJreWdwaHZ1dXFtcG1jZnJuY3BtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTA1MjI3NjIsImV4cCI6MjA2NjA5ODc2Mn0.XHXZMXvuTQBe6vjI0xs-m8ztvxhmIImd8JJpV-LYAds',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJreWdwaHZ1dXFtcG1jZnJuY3BtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTA1MjI3NjIsImV4cCI6MjA2NjA5ODc2Mn0.XHXZMXvuTQBe6vjI0xs-m8ztvxhmIImd8JJpV-LYAds',
        'Content-Type': 'application/json',
      },
      params: {
        'offset': offset,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<int>? maincatid(dynamic response) => (getJsonField(
        response,
        r'''$[:].main_cat_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? subcatid(dynamic response) => (getJsonField(
        response,
        r'''$[:].sub_cat_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? maincatname(dynamic response) => (getJsonField(
        response,
        r'''$[:].main_cat_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? catid(dynamic response) => (getJsonField(
        response,
        r'''$[:].cat_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? catname(dynamic response) => (getJsonField(
        response,
        r'''$[:].cat_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? images(dynamic response) => (getJsonField(
        response,
        r'''$[:].images''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class WhoamICall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'whoamI',
      apiUrl:
          'https://bkygphvuuqmpmcfrncpm.supabase.co/rest/v1/view_whoami?select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJreWdwaHZ1dXFtcG1jZnJuY3BtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTA1MjI3NjIsImV4cCI6MjA2NjA5ODc2Mn0.XHXZMXvuTQBe6vjI0xs-m8ztvxhmIImd8JJpV-LYAds',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsImtpZCI6ImNkcmIvL3JhTFBrNXpOUXYiLCJ0eXAiOiJKV1QifQ.eyJhYWwiOiJhYWwxIiwiYW1yIjpbeyJtZXRob2QiOiJwYXNzd29yZCIsInRpbWVzdGFtcCI6MTc2MDg2MDYwMH1dLCJhcHBfbWV0YWRhdGEiOnsicHJvdmlkZXIiOiJlbWFpbCIsInByb3ZpZGVycyI6WyJlbWFpbCJdfSwiYXVkIjoiYXV0aGVudGljYXRlZCIsImVtYWlsIjoibS5hZmxha3BhcmFzdEBnbWFpbC5jb20iLCJleHAiOjE3NjA4NjQyMDAsImlhdCI6MTc2MDg2MDYwMCwiaXNfYW5vbnltb3VzIjpmYWxzZSwiaXNzIjoiaHR0cHM6Ly9ia3lncGh2dXVxbXBtY2ZybmNwbS5zdXBhYmFzZS5jby9hdXRoL3YxIiwicGhvbmUiOiIiLCJyb2xlIjoiYXV0aGVudGljYXRlZCIsInNlc3Npb25faWQiOiIzNmJhMGNlNi00ZWQ1LTQ5NTEtYjExNy04ZjE4YTE4N2QyMjciLCJzdWIiOiIxMmU0M2MwMC0xMzAxLTQyMWQtOGFlZi1hZTE4ZDQ4NTNlYjEiLCJ1c2VyX21ldGFkYXRhIjp7ImVtYWlsIjoibS5hZmxha3BhcmFzdEBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwicGhvbmVfdmVyaWZpZWQiOmZhbHNlLCJzdWIiOiIxMmU0M2MwMC0xMzAxLTQyMWQtOGFlZi1hZTE4ZDQ4NTNlYjEifSwidXNlcl9yb2xlIjoidXNlciJ9.NYZKd3yfYxtMHQCJH5DEukilhQZVuuIG9J0fplPcLTY',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<int>? maincatid(dynamic response) => (getJsonField(
        response,
        r'''$[:].main_cat_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? subcatid(dynamic response) => (getJsonField(
        response,
        r'''$[:].sub_cat_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? maincatname(dynamic response) => (getJsonField(
        response,
        r'''$[:].main_cat_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? catid(dynamic response) => (getJsonField(
        response,
        r'''$[:].cat_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? catname(dynamic response) => (getJsonField(
        response,
        r'''$[:].cat_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? images(dynamic response) => (getJsonField(
        response,
        r'''$[:].images''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class FilterApiCall {
  static Future<ApiCallResponse> call({
    int? offset,
    int? limit,
    int? mainCatId = 2,
    int? catId = 4,
    String? sortby = 'created_at.desc.nullslast',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'filterApi',
      apiUrl:
          'https://bkygphvuuqmpmcfrncpm.supabase.co/rest/v1/view_post_search?select=*&main_cat_id=eq.${mainCatId}&cat_id=eq.${catId}&order=${sortby}',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJreWdwaHZ1dXFtcG1jZnJuY3BtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTA1MjI3NjIsImV4cCI6MjA2NjA5ODc2Mn0.XHXZMXvuTQBe6vjI0xs-m8ztvxhmIImd8JJpV-LYAds',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJreWdwaHZ1dXFtcG1jZnJuY3BtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTA1MjI3NjIsImV4cCI6MjA2NjA5ODc2Mn0.XHXZMXvuTQBe6vjI0xs-m8ztvxhmIImd8JJpV-LYAds',
        'Content-Type': 'application/json',
      },
      params: {
        'offset': offset,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<int>? maincatid(dynamic response) => (getJsonField(
        response,
        r'''$[:].main_cat_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? subcatid(dynamic response) => (getJsonField(
        response,
        r'''$[:].sub_cat_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? maincatname(dynamic response) => (getJsonField(
        response,
        r'''$[:].main_cat_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? catid(dynamic response) => (getJsonField(
        response,
        r'''$[:].cat_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? catname(dynamic response) => (getJsonField(
        response,
        r'''$[:].cat_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? images(dynamic response) => (getJsonField(
        response,
        r'''$[:].images''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? details(dynamic response) => getJsonField(
        response,
        r'''$[:].details''',
        true,
      ) as List?;
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
