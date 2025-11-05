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

// FlutterFlow Custom Action: createGuestSession
// FlutterFlow Custom Action: createAnonymousSession
// FlutterFlow Custom Action: createGuestSession
// FlutterFlow Custom Action: createAnonymousSession
import 'package:supabase_flutter/supabase_flutter.dart';

Future<String?> createGuestSession() async {
  final supabase = Supabase.instance.client;

  // ⭐️ Strict Guardrail Check: Abort if a REGISTERED user session already exists ⭐️
  final currentSession = supabase.auth.currentSession;
  if (currentSession != null) {
    final isAnonymous =
        currentSession.user?.appMetadata?['is_anonymous'] == true;

    // If a session exists and it's NOT anonymous, we assume a registered user is logged in.
    if (!isAnonymous) {
      print('Registered session detected. Aborting anonymous sign-in.');
      return currentSession.user!.id;
    }

    // If a session exists and it *IS* anonymous, the function proceeds to the next step,
    // which will simply refresh the existing anonymous session.
  }

  // Primary Directive: Attempt anonymous sign-in immediately.
  try {
    final AuthResponse authResponse = await supabase.auth.signInAnonymously();

    if (authResponse.user != null) {
      // Return the new user's ID upon successful creation/login.
      return authResponse.user!.id;
    } else {
      print('Anonymous sign-in failed: User is null');
      return null;
    }
  } on AuthException catch (e) {
    print('Supabase Auth Error creating anonymous session: ${e.message}');
    return null;
  } catch (e) {
    print('General Error creating anonymous session: $e');
    return null;
  }
}
