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

Future<int> likeCountsAction(
  String table1,
  String table2,
  String table3,
  String userId,
) async {
  final supabase = Supabase.instance.client;

  int totalLikes = 0;

  // List of your table names
  final tables = [table1, table2, table3];

  for (final table in tables) {
    final response = await supabase
        .from(table)
        .select('likes')
        .eq('user_id', '71ba1936-b7cc-4ae3-9aa1-44a28e52066c');

    if (response != null && response is List) {
      for (final row in response) {
        if (row['likes'] != null) {
          totalLikes += (row['likes'] as int);
        }
      }
    }
  }

  return totalLikes;
}
