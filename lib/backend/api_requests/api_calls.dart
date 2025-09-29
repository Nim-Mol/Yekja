import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SearchapiCall {
  static Future<ApiCallResponse> call({
    int? offset,
    int? limit,
    String? term = '',
    String? sortby = 'created_at.desc.nullslast',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'searchapi',
      apiUrl:
          'https://bkygphvuuqmpmcfrncpm.supabase.co/rest/v1/view_post_search?select=*&or=(title.ilike.*${term}*,description.ilike.*${term}*,wishlist_text.ilike.*${term}*,sub_cat_name.ilike.*${term}*,cat_name.ilike.*${term}*)',
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
  static List<String>? city(dynamic response) => (getJsonField(
        response,
        r'''$[:].user_city''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<bool>? certified(dynamic response) => (getJsonField(
        response,
        r'''$[:].YekjaVerified''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
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
  static List? exchangeids(dynamic response) => getJsonField(
        response,
        r'''$[:].exchange_wishlist_id''',
        true,
      ) as List?;
  static List<bool>? hasimage(dynamic response) => (getJsonField(
        response,
        r'''$[:].has_images''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  static List<String>? searchvc(dynamic response) => (getJsonField(
        response,
        r'''$[:].search_vec''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? images(dynamic response) => getJsonField(
        response,
        r'''$[:].images''',
        true,
      ) as List?;
}

class SearchfilerapiCall {
  static Future<ApiCallResponse> call({
    int? offset,
    int? limit,
    String? term = '',
    String? sortby = 'created_at.desc.nullslast',
    String? subCatIdsCsv =
        '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33',
    String? catIdsCsv = '1,2,3,4,5',
    String? cityIdsCsv =
        '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,32',
    String? verifiedCsv = 'true,false',
    int? likes = 0,
    String? hasimg = 'true,false',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'searchfilerapi ',
      apiUrl:
          'https://bkygphvuuqmpmcfrncpm.supabase.co/rest/v1/view_post_search?select=*&or=(title.ilike.*${term}*,description.ilike.*${term}*,wishlist_text.ilike.*${term}*,sub_cat_name.ilike.*${term}*,cat_name.ilike.*${term}*)&order=${sortby}&cat_id=in.(${catIdsCsv})&unique_subcat_id=in.(${subCatIdsCsv})&city_id=in.(${cityIdsCsv})&YekjaVerified=in.(${verifiedCsv})&post_likes=gte.${likes}&has_images=in.(${hasimg})',
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
  static List<String>? city(dynamic response) => (getJsonField(
        response,
        r'''$[:].user_city''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<bool>? certified(dynamic response) => (getJsonField(
        response,
        r'''$[:].YekjaVerified''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
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
  static List<int>? exchangeids(dynamic response) => (getJsonField(
        response,
        r'''$[:].exchange_wishlist_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
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
  static List<String>? searchvc(dynamic response) => (getJsonField(
        response,
        r'''$[:].search_vec''',
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
