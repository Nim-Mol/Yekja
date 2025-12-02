import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'detail_swap_items_widget.dart' show DetailSwapItemsWidget;
import 'package:flutter/material.dart';

class DetailSwapItemsModel extends FlutterFlowModel<DetailSwapItemsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for dropdownCity widget.
  String? dropdownCityValue1;
  FormFieldController<String>? dropdownCityValueController1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for SwapSwitch widget.
  bool? swapSwitchValue;
  // State field(s) for dropdownCity widget.
  String? dropdownCityValue2;
  FormFieldController<String>? dropdownCityValueController2;
  DateTime? datePicked;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for PriceBoolSwitch widget.
  bool? priceBoolSwitchValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for NegotiableSwitch widget.
  bool? negotiableSwitchValue;

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
  }
}
