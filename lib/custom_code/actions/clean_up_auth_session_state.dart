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

Future<void> cleanUpAuthSessionState() async {
  final auth = Supabase.instance.client.auth;

  // 1. Standard sign out: Clears tokens from persistence (Async).
  await auth.signOut();
  print("Standard sign out complete.");

  // 2. Force session refresh check:
  // Since no token exists, this will fail and force the GoTrue client
  // to internally recognize the truly unauthenticated state, often clearing
  // any lingering claims cache that signOut() missed.
  await auth.refreshSession();
  print("Forced session refresh check to flush claims cache.");

  // 3. EXTERNAL STEP: Reset application state (MANDATORY).
  // This step is still required in your FlutterFlow action sequence:
  // - Add an action to 'Update App State'
  // - Set all user-related App State variables (e.g., appState.userRole, appState.userId)
  //   to null or their default guest/unauthenticated value.
}
