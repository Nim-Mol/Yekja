import '/flutter_flow/flutter_flow_util.dart';
import 'pop_up_title_widget.dart' show PopUpTitleWidget;
import 'package:flutter/material.dart';

class PopUpTitleModel extends FlutterFlowModel<PopUpTitleWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
