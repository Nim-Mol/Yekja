import '/flutter_flow/flutter_flow_util.dart';
import '/shared_components/nav_bar/nav_bar_widget.dart';
import '/shared_components/report_bug/report_bug_widget.dart';
import '/shared_components/swipe_cards/swipe_cards_widget.dart';
import 'swipable_widget.dart' show SwipableWidget;
import 'package:flutter/material.dart';

class SwipableModel extends FlutterFlowModel<SwipableWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for swipeCards component.
  late SwipeCardsModel swipeCardsModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // Model for reportBug component.
  late ReportBugModel reportBugModel;

  @override
  void initState(BuildContext context) {
    swipeCardsModel = createModel(context, () => SwipeCardsModel());
    navBarModel = createModel(context, () => NavBarModel());
    reportBugModel = createModel(context, () => ReportBugModel());
  }

  @override
  void dispose() {
    swipeCardsModel.dispose();
    navBarModel.dispose();
    reportBugModel.dispose();
  }
}
