import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components_yekja/intro_tooltip/intro_tooltip_widget.dart';

// Focus widget keys for this walkthrough
final container6d02zfhy = GlobalKey();
final column70x7mb19 = GlobalKey();
final cardMoann8d5 = GlobalKey();

/// HomePage-Intro
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: container6d02zfhy,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => IntroTooltipWidget(
              introTooltipText:
                  'This is your Trust score which you get when you do community activity',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: column70x7mb19,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => IntroTooltipWidget(
              introTooltipText:
                  'Here are our main categories where you can click and explor',
            ),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: cardMoann8d5,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => IntroTooltipWidget(
              introTooltipText: 'This area is where we appreciate you action',
            ),
          ),
        ],
      ),
    ];
