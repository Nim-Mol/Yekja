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
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart'; // Ensure you have the UUID package dependency

Future<String?> createGuestSession() async {
  final supabase = Supabase.instance.client;
  const uuid = Uuid();

  // 1. Generate a unique, temporary email address
  final temporaryEmail = 'guest_${uuid.v4()}@temporary.com';
  const fixedPassword = 'Temp#Pass320!@#'; // A known fixed password

  try {
    // 2. Sign up the user (this creates the Auth record)
    final AuthResponse signUpResponse = await supabase.auth.signUp(
      email: temporaryEmail,
      password: fixedPassword,
    );

    // 3. Optional: Sign out immediately to prevent auto-login (if necessary),
    //    then sign in with the same credentials to confirm the session.
    //    Usually, signUp is enough if you handle the session in your app.

    if (signUpResponse.user != null) {
      // 4. Return the new User ID (UUID)
      return signUpResponse.user!.id;
    } else {
      // Handle the case where the user object is null (e.g., email already exists)
      print('Guest sign up failed: User is null');
      return null;
    }
  } on AuthException catch (e) {
    print('Supabase Auth Error creating guest: ${e.message}');
    return null;
  } catch (e) {
    print('General Error creating guest session: $e');
    return null;
  }
}
