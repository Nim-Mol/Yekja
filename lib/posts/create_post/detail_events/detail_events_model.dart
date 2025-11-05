import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'detail_events_widget.dart' show DetailEventsWidget;
import 'package:flutter/material.dart';

class DetailEventsModel extends FlutterFlowModel<DetailEventsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for dropdownCity widget.
  String? dropdownCityValue;
  FormFieldController<String>? dropdownCityValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for RepeatsSwitch widget.
  bool? repeatsSwitchValue;
  // State field(s) for RepeatsChoice widget.
  FormFieldController<List<String>>? repeatsChoiceValueController;
  String? get repeatsChoiceValue =>
      repeatsChoiceValueController?.value?.firstOrNull;
  set repeatsChoiceValue(String? val) =>
      repeatsChoiceValueController?.value = val != null ? [val] : [];
  // State field(s) for PriceBoolSwitch widget.
  bool? priceBoolSwitchValue1;
  // State field(s) for PriceBoolSwitch widget.
  bool? priceBoolSwitchValue2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldFocusNode5?.dispose();
    textController5?.dispose();
  }
}
