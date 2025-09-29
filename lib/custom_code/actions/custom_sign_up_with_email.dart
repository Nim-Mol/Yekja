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

Future<String?> customSignUpWithEmail(
  String email,
  String password,
  String confirmPassword,
) async {
  if (password != confirmPassword) {
    return "Passwords do not match.";
  }

  try {
    final supabase = SupaFlow.client;

    // Normalize email a bit (optional but helpful)
    final normalizedEmail = email.trim().toLowerCase();

    final AuthResponse res = await supabase.auth.signUp(
      email: normalizedEmail,
      password: password,
    );

    final user = res.user;

    // When the email is already registered, Supabase returns a user object
    // but `identities` is empty.
    final alreadyRegistered =
        user != null && (user.identities?.isEmpty ?? false);

    if (alreadyRegistered) {
      return "This email is already registered. Try signing in or resetting your password.";
    }

    // If email confirmations are enabled, session will be null until they confirm.
    if (res.session == null) {
      // Successful sign-up started; confirmation email sent.
      return null; // or return a message if you prefer to surface it to the UI
    }

    // Fully signed in (e.g., if confirmations are disabled)
    return null;
  } on AuthException catch (e) {
    // Real errors (weak password, invalid email, etc.)
    return e.message;
  } catch (_) {
    return "Something went wrong. Please try again.";
  }
}
