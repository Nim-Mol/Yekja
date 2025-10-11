// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:ui' as ui; // for ui.TextDirection

class LtrWrapper extends StatefulWidget {
  const LtrWrapper({
    super.key,
    this.width,
    this.height,
    required this.builder, // <-- Widget Builder in FF (zero-arg)
  });

  final double? width;
  final double? height;

  /// In FlutterFlow, set this param's type to **Widget Builder**.
  /// FF will generate `builder: () => <your subtree>`.
  final Widget Function() builder;

  @override
  State<LtrWrapper> createState() => _LtrWrapperState();
}

class _LtrWrapperState extends State<LtrWrapper> {
  @override
  Widget build(BuildContext context) {
    final child = Directionality(
      textDirection: ui.TextDirection.ltr, // force LTR inside
      child: widget.builder(), // <-- zero-arg call
    );

    final hasWidth = widget.width != null && widget.width! > 0;
    final hasHeight = widget.height != null && widget.height! > 0;

    if (hasWidth || hasHeight) {
      return SizedBox(
        width: hasWidth ? widget.width : null,
        height: hasHeight ? widget.height : null,
        child: child,
      );
    }

    // Let content size itself if no explicit size is provided.
    return child;
  }
}
