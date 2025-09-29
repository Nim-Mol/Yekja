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

Future<int> countActionDate(
  String tableName,
  String columnName,
  DateTime columnValue,
) async {
  try {
    final response = await Supabase.instance.client
        .from(tableName)
        .select('*')
        .eq(columnName, columnValue);

    if (response != null) {
      return response.length;
    }

    return 0;
  } catch (e) {
    print('Error counting actions: $e');
    return 0;
  }
}
