import '/components/yekja_score_pop_up_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'scoring_system_widget.dart' show ScoringSystemWidget;
import 'package:flutter/material.dart';

class ScoringSystemModel extends FlutterFlowModel<ScoringSystemWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for YekjaScorePopUp component.
  late YekjaScorePopUpModel yekjaScorePopUpModel;

  @override
  void initState(BuildContext context) {
    yekjaScorePopUpModel = createModel(context, () => YekjaScorePopUpModel());
  }

  @override
  void dispose() {
    yekjaScorePopUpModel.dispose();
  }
}
