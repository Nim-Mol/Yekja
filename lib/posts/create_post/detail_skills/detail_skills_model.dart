import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'detail_skills_widget.dart' show DetailSkillsWidget;
import 'package:flutter/material.dart';

class DetailSkillsModel extends FlutterFlowModel<DetailSkillsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for dropdownCity widget.
  String? dropdownCityValue;
  FormFieldController<String>? dropdownCityValueController;
  // State field(s) for PriceBoolSwitch widget.
  bool? priceBoolSwitchValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for PricePeriod widget.
  String? pricePeriodValue;
  FormFieldController<String>? pricePeriodValueController;
  // State field(s) for NegotiableSwitch widget.
  bool? negotiableSwitchValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
