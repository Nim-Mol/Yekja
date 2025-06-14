import '/all_comoponet/categories/categories_widget.dart';
import '/all_comoponet/product_component/product_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_componet_widget.dart' show HomeComponetWidget;
import 'package:flutter/material.dart';

class HomeComponetModel extends FlutterFlowModel<HomeComponetWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for Categories dynamic component.
  late FlutterFlowDynamicModels<CategoriesModel> categoriesModels;
  // Models for ProductComponent dynamic component.
  late FlutterFlowDynamicModels<ProductComponentModel> productComponentModels;

  @override
  void initState(BuildContext context) {
    categoriesModels = FlutterFlowDynamicModels(() => CategoriesModel());
    productComponentModels =
        FlutterFlowDynamicModels(() => ProductComponentModel());
  }

  @override
  void dispose() {
    categoriesModels.dispose();
    productComponentModels.dispose();
  }
}
