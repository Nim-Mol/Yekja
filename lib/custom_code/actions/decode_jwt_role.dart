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
import 'package:supabase_flutter/supabase_flutter.dart';

// Utility to decode the JWT payload
// Utility to decode the JWT payload (unchanged)
Map<String, dynamic>? _decodeJwtPayload(String jwt) {
  final parts = jwt.split('.');
  if (parts.length != 3) return null;
  try {
    final norm =
        base64.normalize(parts[1]).replaceAll('-', '+').replaceAll('_', '/');
    final decodedBytes = base64.decode(norm);
    final decodedString = utf8.decode(decodedBytes);
    return json.decode(decodedString) as Map<String, dynamic>;
  } catch (_) {
    return null;
  }
}

Future<String> decodeJwtRole() async {
  final client = Supabase.instance.client;
  String? token;

  try {
    final res = await client.auth.refreshSession(); // ok to keep; optional
    token = res.session?.accessToken ?? client.auth.currentSession?.accessToken;
  } catch (_) {
    token = client.auth.currentSession?.accessToken;
  }
  if (token == null) return "DEBUG_ERROR: No Token Found";

  final payload = _decodeJwtPayload(token);
  if (payload == null) return "DEBUG_ERROR: Payload Decode Failed";

  // Preferred: app_role (new claim)
  final appRole = payload['app_role'] as String?;
  if (appRole != null && appRole.isNotEmpty) return appRole;

  // Fallback 1: app_metadata.role (we mirror it there server-side)
  final appMeta = payload['app_metadata'];
  if (appMeta is Map &&
      appMeta['role'] is String &&
      (appMeta['role'] as String).isNotEmpty) {
    return appMeta['role'] as String;
  }

  // Fallback 2: legacy user_role (old claim, if still present)
  final legacy = payload['user_role'] as String?;
  if (legacy != null && legacy.isNotEmpty) return legacy;

  return "DEBUG_ERROR: app_role missing";
}
