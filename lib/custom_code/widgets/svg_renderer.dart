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

// lib/custom_code/widgets/svg_renderer.dart

import 'package:flutter_svg/flutter_svg.dart';

class SvgRenderer extends StatelessWidget {
  const SvgRenderer({
    Key? key,
    this.svgCode,
    this.width,
    this.height,
    this.iconColor, // NEW: Added iconColor parameter
  }) : super(key: key);

  final String? svgCode;
  final double? width;
  final double? height;
  final Color? iconColor; // NEW: Defined as a nullable Color

  @override
  Widget build(BuildContext context) {
    // Safely check if svgCode is null or empty before rendering
    if (svgCode == null || svgCode!.isEmpty || !svgCode!.contains('<svg')) {
      return const SizedBox(width: 0, height: 0);
    }

    return SvgPicture.string(
      svgCode!,
      width: width,
      height: height,
      // NEW: Apply color using 'colorFilter' if iconColor is provided
      colorFilter: iconColor != null
          ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
          : null,
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
