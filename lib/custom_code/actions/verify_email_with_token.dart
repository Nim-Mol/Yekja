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

Future<bool> verifyEmailWithToken(
  String email,
  String? token,
) async {
  final supabase = Supabase.instance.client;
  const int maxRetries = 10;
  const int delayMs = 500; // Wait 0.5 seconds between checks

  if (token == null || token.isEmpty) {
    print("Error: Verification token is missing/empty.");
    return false;
  }

  try {
    // 1. Attempt the server-side verification (which runs the successful trigger)
    final AuthResponse res = await supabase.auth.verifyOTP(
      type: OtpType.signup,
      token: token,
      email: email,
    );

    // Initial check: Did the API call give us a session/user? If so, we're done.
    if (res.session != null || res.user != null) {
      print(
          "DEBUG: Session or User received directly from verifyOTP. Success.");
      return true;
    }

    // --- 2. Synchronization Loop: Guarantee the local client state is updated ---

    print("DEBUG: verifyOTP returned empty. Starting sync loop...");

    for (int i = 0; i < maxRetries; i++) {
      // Force the local client to refresh its state from the server.
      // This is the CRITICAL step to update the client's internal `currentUser` object.
      await supabase.auth.getUser();

      // Check the local cache of the current user object.
      final User? localUser = supabase.auth.currentUser;

      if (localUser != null) {
        print(
            "DEBUG: Synchronization successful on attempt ${i + 1}. User ID is available.");
        return true; // The user is now guaranteed to be in the local client state.
      }

      // If not yet synchronized, wait a moment and try again.
      await Future.delayed(const Duration(milliseconds: delayMs));
    }

    // If the loop finishes without finding the user, something is critically wrong.
    print("ERROR: User synchronization failed after $maxRetries attempts.");
    return false;
  } on AuthException catch (e) {
    print("Auth Error during verification: ${e.message}");
    return false;
  } catch (error) {
    print("General Error during custom action: $error");
    return false;
  }
}
