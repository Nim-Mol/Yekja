import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'intend_widget.dart' show IntendWidget;
import 'package:flutter/material.dart';

class IntendModel extends FlutterFlowModel<IntendWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for RadioButtonIntend widget.
  FormFieldController<String>? radioButtonIntendValueController1;
  // State field(s) for RadioButtonIntend widget.
  FormFieldController<String>? radioButtonIntendValueController2;
  // State field(s) for RadioButtonIntend widget.
  FormFieldController<String>? radioButtonIntendValueController3;
  // State field(s) for RadioButtonIntend widget.
  FormFieldController<String>? radioButtonIntendValueController4;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get radioButtonIntendValue1 =>
      radioButtonIntendValueController1?.value;
  String? get radioButtonIntendValue2 =>
      radioButtonIntendValueController2?.value;
  String? get radioButtonIntendValue3 =>
      radioButtonIntendValueController3?.value;
  String? get radioButtonIntendValue4 =>
      radioButtonIntendValueController4?.value;
}
