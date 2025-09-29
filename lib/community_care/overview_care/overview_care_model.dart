import '/flutter_flow/flutter_flow_util.dart';
import '/shared_components/item_card_horizental/item_card_horizental_widget.dart';
import '/shared_components/item_card_vertical/item_card_vertical_widget.dart';
import '/shared_components/nav_bar/nav_bar_widget.dart';
import '/index.dart';
import 'overview_care_widget.dart' show OverviewCareWidget;
import 'package:flutter/material.dart';

class OverviewCareModel extends FlutterFlowModel<OverviewCareWidget> {
  ///  Local state fields for this page.

  int selectedSubCat = 1;

  int? catID;

  ///  State fields for stateful widgets in this page.

  // Models for ItemCard_Vertical dynamic component.
  late FlutterFlowDynamicModels<ItemCardVerticalModel> itemCardVerticalModels;
  // Models for ItemCard_Horizental dynamic component.
  late FlutterFlowDynamicModels<ItemCardHorizentalModel>
      itemCardHorizentalModels1;
  // Models for ItemCard_Horizental dynamic component.
  late FlutterFlowDynamicModels<ItemCardHorizentalModel>
      itemCardHorizentalModels2;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    itemCardVerticalModels =
        FlutterFlowDynamicModels(() => ItemCardVerticalModel());
    itemCardHorizentalModels1 =
        FlutterFlowDynamicModels(() => ItemCardHorizentalModel());
    itemCardHorizentalModels2 =
        FlutterFlowDynamicModels(() => ItemCardHorizentalModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    itemCardVerticalModels.dispose();
    itemCardHorizentalModels1.dispose();
    itemCardHorizentalModels2.dispose();
    navBarModel.dispose();
  }
}
