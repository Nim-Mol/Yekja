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
  if (widgetState == null || widgetState.isEmpty || widgetState == 'null') {
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

Color hexToColor(
  String? hex,
  Color? fallback,
) {
  if (hex == null) return fallback ?? const Color(0xFF12B886);
  var s = hex.trim();
  if (s.startsWith('#')) s = s.substring(1);
  // Accept 6 or 8 hex digits. If 6, assume opaque.
  if (s.length == 6) s = 'FF$s';
  if (s.length != 8) return fallback ?? const Color(0xFF12B886);
  final val = int.tryParse(s, radix: 16);
  if (val == null) return fallback ?? const Color(0xFF12B886);
  return Color(int.parse(s, radix: 16));
}

bool isInSetInt(
  int? value,
  List<int>? set,
) {
  if (value == null || set == null) {
    return false;
  }
  return set.contains(value);
}

DateTime? parseIsoToLocal(String isoString) {
  if (isoString.isEmpty) return null;

  // Try ISO-8601 / RFC3339 first (your format: 2025-10-17T15:35:02.381067+00:00)
  try {
    final dt = DateTime.parse(isoString);
    // DateTime.parse respects the offset; convert to device local time if you prefer:
    return dt.toLocal();
  } catch (_) {
    // Fallbacks: try epoch millis or seconds if your API ever changes
    try {
      // Try epoch milliseconds in string form
      final millis = int.parse(isoString);
      return DateTime.fromMillisecondsSinceEpoch(millis).toLocal();
    } catch (_) {
      // Try epoch seconds
      try {
        final secs = int.parse(isoString);
        return DateTime.fromMillisecondsSinceEpoch(secs * 1000).toLocal();
      } catch (_) {
        return null;
      }
    }
  }
}

String intToCsvString(
  int? x,
  String allcsv,
) {
  if (x == null) {
    return allcsv;
  }
  return x.toString();
}

String eqIntOrEmpty(int? x) {
  if (x == null) return '';
  return 'eq.$x';
}

String intToCsvsingle(int? value) {
  return value.toString();
}

dynamic jsonDecodeDynamic(dynamic raw) {
  if (raw == null) return {};
  if (raw is Map<String, dynamic>) return raw;
  if (raw is String && raw.isNotEmpty) {
    try {
      return json.decode(raw);
    } catch (_) {}
  }
  return {};
}

String stringifyAny(dynamic v) {
  try {
    return jsonEncode(v);
  } catch (_) {
    return v?.toString() ?? '';
  }
}

dynamic decodeDetails(String raw) {
  if (raw.isEmpty) return {};
  try {
    return json.decode(raw);
  } catch (_) {
    return {};
  }
}

String toLowerCase(String? originalText) {
  if (originalText == null) {
    return ''; // Return an empty string if the input is null
  }

  return originalText.toLowerCase();
}

String? dateTimeToString(DateTime? dateTimeValue) {
  if (dateTimeValue == null) {
    return null; // Or return null if your database expects null for empty dates
  }

  // Use the built-in Dart method to convert the DateTime object
  // into the standard ISO 8601 string format.
  return dateTimeValue.toIso8601String();
}

bool isNullJSON(dynamic widgetState) {
  // 1. Check for literal Dart null first.
  if (widgetState == null) {
    return true;
  }

  // 2. Handle specific types that can be "empty" but not null.
  if (widgetState is String) {
    // Check if the string is empty after trimming whitespace,
    // or if the string itself is the literal text "null" (case-insensitive)
    final String str = widgetState.trim();
    return str.isEmpty || str.toLowerCase() == 'null';
  }

  // 3. Check for empty Lists (e.g., [])
  if (widgetState is List) {
    return widgetState.isEmpty;
  }

  // 4. Check for empty Maps (e.g., {})
  if (widgetState is Map) {
    return widgetState.isEmpty;
  }

  // 5. If it passed the null check and is a non-empty primitive (like a number or boolean)
  // or a non-empty complex object, then it is considered NOT null/empty.
  return false;
}

String formatIsoDatetime(String? iso) {
  if (iso == null) return '';
  final s = iso.trim();
  if (s.isEmpty) return '';
  DateTime dt;
  try {
    dt = DateTime.parse(s).toLocal();
  } catch (_) {
    return s; // fallback to raw if not parseable
  }

  // Month short names (English)
  const months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  String two(int n) => n < 10 ? '0$n' : '$n';

  final mon = months[dt.month - 1];
  final day = dt.day; // no leading zero for day (looks nicer)
  final year = dt.year;
  final hh = two(dt.hour);
  final mm = two(dt.minute);

  return '$mon $day, $year • $hh:$mm';
}

String stringListToCommaString(List<String>? stringList) {
  return stringList?.join(', ') ?? '';
}

String formatIsoDate(String? iso) {
  if (iso == null) return '';
  final s = iso.trim();
  if (s.isEmpty) return '';
  DateTime dt;
  try {
    // Parse the ISO date string and convert to local time
    dt = DateTime.parse(s).toLocal();
  } catch (_) {
    return s; // fallback to raw string if not parseable
  }

  // Month short names (English)
  const months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  // Extract date components
  final mon = months[dt.month - 1];
  final day = dt.day;
  final year = dt.year;

  // Return only the formatted date: "Mon Day, Year"
  return '$mon $day, $year';
}

bool isGTx(
  String? input,
  int x,
) {
// 1. Check for invalid or unparseable string states first.
  if (input == null || input.isEmpty || input.toLowerCase() == 'null') {
    return false;
  }

  // 2. Attempt to parse the non-null string into a double.
  final value = double.tryParse(input);

  // 3. If parsing failed, it's not a number, so return false.
  if (value == null) {
    return false;
  }

  // 4. Check the condition: is the parsed number strictly greater than 1?
  return value > x;
}

DateTime? jsonToDateTimeUtc(dynamic v) {
// name: jsonToDateTimeUtc
// input: dynamic v
// output: DateTime?

  if (v == null) return null;
  try {
    if (v is int) {
      // guess ms vs sec by digits
      final ms = v.toString().length >= 13 ? v : v * 1000;
      return DateTime.fromMillisecondsSinceEpoch(ms, isUtc: true).toLocal();
    }
    if (v is String) {
      // ISO8601 like "2025-12-01T19:00:00Z" or "+01:00"
      final parsed = DateTime.parse(v);
      final utc = parsed.isUtc
          ? parsed
          : DateTime.utc(
              parsed.year,
              parsed.month,
              parsed.day,
              parsed.hour,
              parsed.minute,
              parsed.second,
              parsed.millisecond,
              parsed.microsecond);
      return utc.toLocal();
    }
  } catch (_) {
    return null;
  }
  return null;
}
