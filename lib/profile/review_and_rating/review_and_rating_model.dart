import '/flutter_flow/flutter_flow_util.dart';
import 'review_and_rating_widget.dart' show ReviewAndRatingWidget;
import 'package:flutter/material.dart';

class ReviewAndRatingModel extends FlutterFlowModel<ReviewAndRatingWidget> {
  ///  Local state fields for this component.

  bool submited = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Communication-score widget.
  double? communicationScoreValue;
  // State field(s) for Reliability-score widget.
  double? reliabilityScoreValue;
  // State field(s) for Quality-score widget.
  double? qualityScoreValue;
  // State field(s) for Fairness-score widget.
  double? fairnessScoreValue;
  // State field(s) for note widget.
  FocusNode? noteFocusNode;
  TextEditingController? noteTextController;
  String? Function(BuildContext, String?)? noteTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    noteFocusNode?.dispose();
    noteTextController?.dispose();
  }
}
