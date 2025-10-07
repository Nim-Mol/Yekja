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

Future<void> initializeSharedPreferencesForTesting() async {
  // This mocks SharedPreferences, preventing the LateInitializationError
  // The map can be empty, but if you use i18n, setting the locale key helps.
  SharedPreferences.setMockInitialValues({'flutter._locale_key': 'en'});

  // If you use Internationalization (i18n) or custom persistent state
  // you may also need the initialization for localizations:
  // await FFLocalizations.initialize();
}
