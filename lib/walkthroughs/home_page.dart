import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/intro_tooltip_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';

// Focus widget keys for this walkthrough
final containerWngp5z5z = GlobalKey();
final carousel35lmbws4 = GlobalKey();
final column6gpdfbbt = GlobalKey();
final columnHmecm9qo = GlobalKey();
final columnSkq2d5ha = GlobalKey();

/// HomePage
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: containerWngp5z5z,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => IntroTooltipWidget(
              introTooltipText: FFLocalizations.of(context).getText(
                '6w0ugb2r' /* You can find your profile and ... */,
              ),
              introTooltipTitle: FFLocalizations.of(context).getText(
                'susr9n4n' /* Welcome */,
              ),
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: carousel35lmbws4,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => IntroTooltipWidget(
              introTooltipText: FFLocalizations.of(context).getText(
                'd3f2b03m' /* Please select any of our main ... */,
              ),
              introTooltipTitle: FFLocalizations.of(context).getText(
                '12fyqovo' /* Main Categories */,
              ),
            ),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: column6gpdfbbt,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => IntroTooltipWidget(
              introTooltipText: FFLocalizations.of(context).getText(
                'ntdruu4f' /* Make sure you check the trandi... */,
              ),
              introTooltipTitle: FFLocalizations.of(context).getText(
                'b07jqo59' /* Don't Miss it */,
              ),
            ),
          ),
        ],
      ),

      /// Step 4
      TargetFocus(
        keyTarget: columnHmecm9qo,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => IntroTooltipWidget(
              introTooltipText: FFLocalizations.of(context).getText(
                'irh58ss5' /* This is a swip game which give... */,
              ),
              introTooltipTitle: FFLocalizations.of(context).getText(
                'jf2p2iby' /* Fun and easy way to swip throu... */,
              ),
            ),
          ),
        ],
      ),

      /// Step 5
      TargetFocus(
        keyTarget: columnSkq2d5ha,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => IntroTooltipWidget(
              introTooltipText: FFLocalizations.of(context).getText(
                't26my4kz' /* Well we want everyone to know ... */,
              ),
              introTooltipTitle: FFLocalizations.of(context).getText(
                'weu704dt' /* Community Care */,
              ),
            ),
          ),
        ],
      ),
    ];
