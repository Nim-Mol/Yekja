import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/shared_components/item_card_horizental/item_card_horizental_widget.dart';
import '/shared_components/nav_bar/nav_bar_widget.dart';
import '/index.dart';
import 'profile_page_copy_widget.dart' show ProfilePageCopyWidget;
import 'package:flutter/material.dart';

class ProfilePageCopyModel extends FlutterFlowModel<ProfilePageCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in ProfilePageCopy widget.
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
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    itemCardHorizentalModels1 =
        FlutterFlowDynamicModels(() => ItemCardHorizentalModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    itemCardHorizentalModels1.dispose();
    navBarModel.dispose();
  }
}
