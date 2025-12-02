import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'detail_care_and_assistance_widget.dart'
    show DetailCareAndAssistanceWidget;
import 'package:flutter/material.dart';

class DetailCareAndAssistanceModel
    extends FlutterFlowModel<DetailCareAndAssistanceWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for dropdownCity widget.
  String? dropdownCityValue;
  FormFieldController<String>? dropdownCityValueController;
  DateTime? datePicked;
  // State field(s) for SwapSwitch widget.
  bool? swapSwitchValue;
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
