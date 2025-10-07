import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

bool isNull(List<String>? widgetState) {
  if (widgetState == null || widgetState.isEmpty) {
    return true;
  } else {
    return false;
  }
}

bool isNullint(List<int>? iDs) {
  if (iDs == null || iDs.isEmpty) {
    return true;
  } else {
    return false;
  }
}

String? firstImageURL(dynamic images) {
// Custom Function in FlutterFlow
// Input: dynamic images
// Output: String? (nullable)
  if (images == null) return null;

  // If it's already a List<String>
  if (images is List<String>) {
    return images.isNotEmpty ? images.first : null;
  }

  // If it's a generic List<dynamic>
  if (images is List) {
    final list = images
        .map((e) => e?.toString() ?? '')
        .where((s) => s.isNotEmpty)
        .toList();
    return list.isNotEmpty ? list.first : null;
  }

  // Catch-all (e.g. FlutterFlow’s LoggableList)
  try {
    final list = images.toList().cast<String>();
    return list.isNotEmpty ? list.first : null;
  } catch (_) {
    return null;
  }
}

bool listContainsInt(
  List<int> list,
  int value,
) {
  if (list == null) return false;
  return list.contains(value);
}

bool listContainsString(
  List<String> list,
  String value,
) {
  if (list == null) return false;
  return list.contains(value);
}

String csvIntOrNull(
  List<int>? xs,
  String allcsv,
) {
  if (xs == null || xs.isEmpty) return allcsv;
  return xs.join(',');
}

String csvBoolorNull(bool? xs) {
  return (xs == true) ? 'true' : 'true,false';
}

String csvQuotedOrNullCopy(
  List<String>? xs,
  String allcsv,
) {
  if (xs == null || xs.isEmpty) return allcsv;
  return xs.map((s) => '"$s"').join(',');
}

bool isNullSingleString(String? widgetState) {
  if (widgetState == null || widgetState.isEmpty) {
    return true;
  } else {
    return false;
  }
}

bool isNullSingleInt(int? intVar) {
  if (intVar == null) {
    return true;
  } else {
    return false;
  }
}

bool routeStartsWithPrefix(
  String route,
  String prefix,
) {
  if (route.isEmpty || prefix.isEmpty) return false;

  String normalize(String s) {
    var v = s.trim();

    // If it's a full URL, keep only path + query
    final uri1 = Uri.tryParse(v);
    if (uri1 != null && uri1.hasScheme) {
      v = '${uri1.path}${uri1.hasQuery ? '?${uri1.query}' : ''}';
    }

    // If it's hash-based (…#/path?query), take part after '#'
    final hashIndex = v.indexOf('#');
    if (hashIndex != -1) {
      final afterHash = v.substring(hashIndex + 1);
      final u2 = Uri.tryParse(afterHash);
      v = (u2 != null)
          ? '${u2.path}${u2.hasQuery ? '?${u2.query}' : ''}'
          : afterHash;
    }

    return v;
  }

  final r = normalize(route);
  final p = normalize(prefix);

  return r.startsWith(p);
}

bool isPresentAndPositive(int? value) {
  return (value ?? 0) > 0;
}

bool isNullSingleImage(String? imageVar) {
  if (imageVar == null) {
    return true;
  } else {
    return false;
  }
}
