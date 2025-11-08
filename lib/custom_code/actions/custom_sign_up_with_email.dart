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

class _SignupGate {
  static bool inFlight = false;
}

Future<String?> customSignUpWithEmail(
  String email,
  String password,
  String confirmPassword,
) async {
  if (_SignupGate.inFlight) {
    return "Please wait…"; // prevents double-fire
  }
  _SignupGate.inFlight = true;
  try {
    if (password != confirmPassword) {
      return "Passwords do not match.";
    }

    final supabase = SupaFlow.client;
    final normalizedEmail = email.trim().toLowerCase();

    final res = await supabase.auth.signUp(
      email: normalizedEmail,
      password: password,
      // emailRedirectTo: 'https://yourdomain/auth/callback' // optional
    );

    // Already registered shortcut
    final user = res.user;
    final alreadyRegistered =
        user != null && (user.identities?.isEmpty ?? false);
    if (alreadyRegistered) {
      return "This email is already registered. Try signing in or resetting your password.";
    }

    // If confirmations are enabled, session will be null and an email is sent.
    if (res.session == null) {
      return null; // success; show "check your email" UI
    }
    return null;
  } on AuthException catch (e) {
    return e.message;
  } catch (_) {
    return "Something went wrong. Please try again.";
  } finally {
    _SignupGate.inFlight = false;
  }
}
