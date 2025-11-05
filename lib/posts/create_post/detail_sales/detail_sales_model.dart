import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'detail_sales_widget.dart' show DetailSalesWidget;
import 'package:flutter/material.dart';

class DetailSalesModel extends FlutterFlowModel<DetailSalesWidget> {
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
  // State field(s) for PriceBoolSwitch widget.
  bool? priceBoolSwitchValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for NegotiableSwitch widget.
  bool? negotiableSwitchValue;
  // State field(s) for PriceChoice widget.
  FormFieldController<List<String>>? priceChoiceValueController;
  String? get priceChoiceValue =>
      priceChoiceValueController?.value?.firstOrNull;
  set priceChoiceValue(String? val) =>
      priceChoiceValueController?.value = val != null ? [val] : [];
  // State field(s) for SwapSwitch widget.
  bool? swapSwitchValue;
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
