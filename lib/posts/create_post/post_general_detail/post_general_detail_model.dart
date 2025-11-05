import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'post_general_detail_widget.dart' show PostGeneralDetailWidget;
import 'package:flutter/material.dart';

class PostGeneralDetailModel extends FlutterFlowModel<PostGeneralDetailWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for dropdownCity widget.
  String? dropdownCityValue;
  FormFieldController<String>? dropdownCityValueController;
  // State field(s) for ConditionChoice widget.
  FormFieldController<List<String>>? conditionChoiceValueController;
  String? get conditionChoiceValue =>
      conditionChoiceValueController?.value?.firstOrNull;
  set conditionChoiceValue(String? val) =>
      conditionChoiceValueController?.value = val != null ? [val] : [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for NegotiableSwitch widget.
  bool? negotiableSwitchValue;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for OpenSwapSwitch widget.
  bool? openSwapSwitchValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
