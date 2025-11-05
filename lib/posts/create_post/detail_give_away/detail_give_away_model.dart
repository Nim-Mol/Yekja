import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'detail_give_away_widget.dart' show DetailGiveAwayWidget;
import 'package:flutter/material.dart';

class DetailGiveAwayModel extends FlutterFlowModel<DetailGiveAwayWidget> {
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
  // State field(s) for DeliveryChoice widget.
  FormFieldController<List<String>>? deliveryChoiceValueController;
  String? get deliveryChoiceValue =>
      deliveryChoiceValueController?.value?.firstOrNull;
  set deliveryChoiceValue(String? val) =>
      deliveryChoiceValueController?.value = val != null ? [val] : [];
  // State field(s) for PriceChoice widget.
  FormFieldController<List<String>>? priceChoiceValueController;
  String? get priceChoiceValue =>
      priceChoiceValueController?.value?.firstOrNull;
  set priceChoiceValue(String? val) =>
      priceChoiceValueController?.value = val != null ? [val] : [];
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
