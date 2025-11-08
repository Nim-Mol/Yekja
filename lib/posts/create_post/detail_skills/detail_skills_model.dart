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
  // State field(s) for ServiceChoice widget.
  FormFieldController<List<String>>? serviceChoiceValueController;
  String? get serviceChoiceValue =>
      serviceChoiceValueController?.value?.firstOrNull;
  set serviceChoiceValue(String? val) =>
      serviceChoiceValueController?.value = val != null ? [val] : [];
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
  // State field(s) for ExperienceChoice widget.
  FormFieldController<List<String>>? experienceChoiceValueController;
  String? get experienceChoiceValue =>
      experienceChoiceValueController?.value?.firstOrNull;
  set experienceChoiceValue(String? val) =>
      experienceChoiceValueController?.value = val != null ? [val] : [];
  // State field(s) for LanguageChoice widget.
  FormFieldController<List<String>>? languageChoiceValueController;
  List<String>? get languageChoiceValues =>
      languageChoiceValueController?.value;
  set languageChoiceValues(List<String>? val) =>
      languageChoiceValueController?.value = val;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
