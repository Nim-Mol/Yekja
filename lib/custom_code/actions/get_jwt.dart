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

import 'package:supabase_flutter/supabase_flutter.dart';

Future<String?> getJwt() async {
  final token = Supabase.instance.client.auth.currentSession?.accessToken;

  // Log a masked version to the console
  if (token == null) {
    debugPrint('JWT: <null>');
  } else {
    final start = token.substring(0, 12);
    final end = token.substring(token.length - 12);
    debugPrint('JWT (masked): $start...$end');
  }

  return token;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
