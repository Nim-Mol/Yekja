import '/all_comoponet/product_component/product_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'swipable_m_a_widget.dart' show SwipableMAWidget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class SwipableMAModel extends FlutterFlowModel<SwipableMAWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;
  // Model for ProductComponent component.
  late ProductComponentModel productComponentModel1;
  // Model for ProductComponent component.
  late ProductComponentModel productComponentModel2;

  @override
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
    productComponentModel1 =
        createModel(context, () => ProductComponentModel());
    productComponentModel2 =
        createModel(context, () => ProductComponentModel());
  }

  @override
  void dispose() {
    productComponentModel1.dispose();
    productComponentModel2.dispose();
  }
}
