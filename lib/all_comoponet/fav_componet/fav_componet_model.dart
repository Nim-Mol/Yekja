import '/all_comoponet/favourite_empty/favourite_empty_widget.dart';
import '/all_comoponet/product_component/product_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'fav_componet_widget.dart' show FavComponetWidget;
import 'package:flutter/material.dart';

class FavComponetModel extends FlutterFlowModel<FavComponetWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for ProductComponent dynamic component.
  late FlutterFlowDynamicModels<ProductComponentModel> productComponentModels;
  // Model for FavouriteEmpty component.
  late FavouriteEmptyModel favouriteEmptyModel;

  @override
  void initState(BuildContext context) {
    productComponentModels =
        FlutterFlowDynamicModels(() => ProductComponentModel());
    favouriteEmptyModel = createModel(context, () => FavouriteEmptyModel());
  }

  @override
  void dispose() {
    productComponentModels.dispose();
    favouriteEmptyModel.dispose();
  }
}
