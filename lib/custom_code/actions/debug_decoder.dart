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

Map<String, dynamic>? _decodeJwtPayload(String jwt) {
  final parts = jwt.split('.');
  if (parts.length != 3) return null;
  final norm =
      base64.normalize(parts[1]).replaceAll('-', '+').replaceAll('_', '/');
  return json.decode(utf8.decode(base64.decode(norm))) as Map<String, dynamic>;
}

Future<void> debugDecoder() async {
  final c = Supabase.instance.client;

  // Get a fresh token
  final res = await c.auth.refreshSession();
  final token = res.session?.accessToken ?? c.auth.currentSession?.accessToken;

  final payload = token == null ? null : _decodeJwtPayload(token);
  print('JWT payload: ${json.encode(payload)}');
}
