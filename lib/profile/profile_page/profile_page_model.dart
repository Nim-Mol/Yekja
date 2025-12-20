import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profile/review_card/review_card_widget.dart';
import '/shared_components/item_card_horizental/item_card_horizental_widget.dart';
import '/shared_components/nav_bar/nav_bar_widget.dart';
import '/index.dart';
import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:flutter/material.dart';

class ProfilePageModel extends FlutterFlowModel<ProfilePageWidget> {
  ///  Local state fields for this page.

  bool isClose = true;

  bool loading = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in ProfilePage widget.
  List<ViewUserChatsRow>? chatView;
  // Stores action output result for [Backend Call - Query Rows] action in ProfilePage widget.
  List<ConsentsRow>? userConsent;
  // Stores action output result for [Backend Call - Query Rows] action in Icon widget.
  List<ChatsRow>? yekjaChat2Customer;
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

  @override
  void initState(BuildContext context) {
    itemCardHorizentalModels1 =
        FlutterFlowDynamicModels(() => ItemCardHorizentalModel());
    itemCardHorizentalModels2 =
        FlutterFlowDynamicModels(() => ItemCardHorizentalModel());
    reviewCardModels = FlutterFlowDynamicModels(() => ReviewCardModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    itemCardHorizentalModels1.dispose();
    itemCardHorizentalModels2.dispose();
    reviewCardModels.dispose();
    navBarModel.dispose();
  }
}
