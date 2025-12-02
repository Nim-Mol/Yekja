import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'detail_currency_exchange_widget.dart' show DetailCurrencyExchangeWidget;
import 'package:flutter/material.dart';

class DetailCurrencyExchangeModel
    extends FlutterFlowModel<DetailCurrencyExchangeWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for dropdownCity widget.
  String? dropdownCityValue;
  FormFieldController<String>? dropdownCityValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for PriceBoolSwitch widget.
  bool? priceBoolSwitchValue1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for NegotiableSwitch widget.
  bool? negotiableSwitchValue;
  // State field(s) for PriceBoolSwitch widget.
  bool? priceBoolSwitchValue2;

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
