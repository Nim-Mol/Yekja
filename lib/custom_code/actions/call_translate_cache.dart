// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import '/auth/supabase_auth/auth_util.dart';

Future<String> callTranslateCache(
  String table,
  String idField,
  String idValue,
  String field,
  String text,
  String targetLang,
) async {
  // Add your function code here!
// BEGIN CUSTOM ACTION CODE

// Get the current user session (JWT)
  final session = Supabase.instance.client.auth.currentSession;
  final accessToken = session?.accessToken ?? '';
  if (accessToken.isEmpty) {
    throw Exception('Not authenticated. Please sign in first.');
  }

// Build payload
  final payload = {
    'table': table.trim().toLowerCase(),
    'id_field': idField,
    'id_value': idValue,
    'field': field.trim().toLowerCase(),
    'text': text,
    'target_lang': targetLang.trim().toLowerCase(),
  };

// Call Edge Function with explicit Authorization header
  final resp = await Supabase.instance.client.functions.invoke(
    'translate_cache',
    body: payload,
    headers: {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json',
    },
  );

// Supabase v2: check HTTP status, no `error` property on response
  if ((resp.status ?? 200) >= 400) {
    final raw = resp.data;
    final msg = raw is String ? raw : jsonEncode(raw);
    throw Exception('Translate failed (${resp.status}): $msg');
  }

// Normalize response to Map
  final raw = resp.data;
  final Map<String, dynamic> data = raw is String
      ? (jsonDecode(raw) as Map<String, dynamic>)
      : (raw as Map<String, dynamic>);

// Validate & return
  final translated = (data['translated'] ?? '') as String;
  return translated;
// END CUSTOM ACTION CODE
}
