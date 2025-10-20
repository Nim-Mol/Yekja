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

Future<bool> userSoftDeleteAsync() async {
  final supabase = Supabase.instance.client;
  final User? currentUser = supabase.auth.currentUser;

  if (currentUser == null) return false;

  final String userId = currentUser.id;
  final String originalEmail = currentUser.email ?? '';

  // Generate the sabotaged email and a random lock password
  final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  final String sabotagedEmail = 'soft_deleted_${originalEmail}';
  final String tempPassword = 'LOCK_${timestamp}_${userId}';

  try {
    // 1. QUEUE ARCHIVING JOB
    await supabase.from('deletion_queue').insert({'user_id': userId});
    print("1. User ID queued for asynchronous archiving.");

    // 2. SABOTAGE & LOCK (Call Edge Function securely)
    final response = await supabase.functions.invoke(
      'soft-delete-user',
      body: {
        'userId': userId,
        'sabotagedEmail': sabotagedEmail,
        'tempPassword': tempPassword,
      },
    );

    // --- CORRECTED ERROR CHECK (Using status code) ---
    if (response.status != 200 && response.status != 201) {
      final errorMessage =
          response.data?.toString() ?? 'Unknown Edge Function Error';
      throw Exception(
          'Edge Function Invocation Failed: Status ${response.status}. Details: $errorMessage');
    }
    // -------------------------------------------------

    print("2. Edge Function sabotage and lock successful.");

    // 3. (FF Workflow sends the single confirmation email here)

    // 4. SIGN OUT: Clear the local session (must be the final step)
    await supabase.auth.signOut();
    print("4. User signed out. Account is deactivated.");

    return true;
  } catch (error) {
    print("Error during user soft delete process: $error");
    return false;
  }
}
