import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profile/review_card/review_card_widget.dart';
import '/shared_components/item_card_horizental/item_card_horizental_widget.dart';
import '/shared_components/nav_bar/nav_bar_widget.dart';
import '/shared_components/report_bug/report_bug_widget.dart';
import '/index.dart';
import 'profile_extended_widget.dart' show ProfileExtendedWidget;
import 'package:flutter/material.dart';

class ProfileExtendedModel extends FlutterFlowModel<ProfileExtendedWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in ProfileExtended widget.
  List<ViewUserChatsRow>? chatView;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Models for ItemCard_Horizental dynamic component.
  late FlutterFlowDynamicModels<ItemCardHorizentalModel>
      itemCardHorizentalModels1;
  // Models for ItemCard_Horizental dynamic component.
  late FlutterFlowDynamicModels<ItemCardHorizentalModel>
      itemCardHorizentalModels2;
  // Models for ReviewCard dynamic component.
  late FlutterFlowDynamicModels<ReviewCardModel> reviewCardModels;
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // Model for reportBug component.
  late ReportBugModel reportBugModel;

  @override
  void initState(BuildContext context) {
    itemCardHorizentalModels1 =
        FlutterFlowDynamicModels(() => ItemCardHorizentalModel());
    itemCardHorizentalModels2 =
        FlutterFlowDynamicModels(() => ItemCardHorizentalModel());
    reviewCardModels = FlutterFlowDynamicModels(() => ReviewCardModel());
    navBarModel = createModel(context, () => NavBarModel());
    reportBugModel = createModel(context, () => ReportBugModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    itemCardHorizentalModels1.dispose();
    itemCardHorizentalModels2.dispose();
    reviewCardModels.dispose();
    navBarModel.dispose();
    reportBugModel.dispose();
  }
}
