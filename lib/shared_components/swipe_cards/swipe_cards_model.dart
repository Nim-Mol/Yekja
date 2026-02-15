import '/flutter_flow/flutter_flow_util.dart';
import 'swipe_cards_widget.dart' show SwipeCardsWidget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class SwipeCardsModel extends FlutterFlowModel<SwipeCardsWidget> {
  ///  Local state fields for this component.

  bool hint = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;

  @override
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
  }

  @override
  void dispose() {}
}
