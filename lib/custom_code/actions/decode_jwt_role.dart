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
Map<String, dynamic>? _decodeJwtPayload(String jwt) {
  final parts = jwt.split('.');
  if (parts.length != 3) return null;

  try {
    final norm =
        base64.normalize(parts[1]).replaceAll('-', '+').replaceAll('_', '/');
    final decodedBytes = base64.decode(norm);
    final decodedString = utf8.decode(decodedBytes);
    return json.decode(decodedString) as Map<String, dynamic>;
  } catch (e) {
    return null; // Return null on any decoding failure
  }
}

/// 🎯 THE FINAL WORKING CUSTOM ACTION
Future<String> decodeJwtRole() async {
  // Renamed for clarity on its purpose
  final client = Supabase.instance.client;
  String? token;
  Map<String, dynamic>? payload;

  // --- Step 1: Secure Token Retrieval ---
  try {
    final res = await client.auth.refreshSession();
    // Prioritize the new session's token
    token = res.session?.accessToken ?? client.auth.currentSession?.accessToken;
  } catch (e) {
    // Fallback to current token if refresh failed
    token = client.auth.currentSession?.accessToken;
  }

  if (token == null) {
    return "DEBUG_ERROR: No Token Found";
  }

  // --- Step 2: Decode the Payload ---
  payload = _decodeJwtPayload(token);

  if (payload == null) {
    return "DEBUG_ERROR: Payload Decode Failed";
  }

  // --- Step 3: Extract the Top-Level 'user_role' Claim ---

  // 1. Directly access the 'user_role' key (as seen in your debug output)
  final role = payload['user_role'];

  // 2. Explicitly check if the value is a non-empty string
  if (role is String && role.isNotEmpty) {
    // SUCCESS
    return role; // ⬅️ This returns "global_admin"
  } else {
    // FAILURE: Token and Payload are fine, but the claim is missing/wrong type.
    return "DEBUG_ERROR: Claim Not Valid or Missing 'user_role'";
  }
}
