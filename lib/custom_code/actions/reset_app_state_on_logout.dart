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

import 'package:shared_preferences/shared_preferences.dart';

Future<void> resetAppStateOnLogout() async {
  // 1) Invalidate Supabase session (server + local)
  //    This is the only reliable way to prevent auto-restoring the user.
  await Supabase.instance.client.auth.signOut();

  // 2) Reset in-memory FlutterFlow state to defaults
  FFAppState.reset();

  // 3) Remove ONLY FlutterFlow-persisted keys, not everything
  //    (avoids nuking flags your app depends on during boot)
  final prefs = await SharedPreferences.getInstance();
  for (final k in prefs.getKeys()) {
    if (k.startsWith('ff_')) {
      await prefs.remove(k);
    }
  }

  // 4) Re-init persisted state so FFAppState.prefs is ready for writes
  await FFAppState().initializePersistedState();

  // (Optional) Set a “guest” flag in app state if you use one:
  // FFAppState().isGuest = true;
}
