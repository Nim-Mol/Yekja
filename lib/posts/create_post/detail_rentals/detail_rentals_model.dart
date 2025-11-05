import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'detail_rentals_widget.dart' show DetailRentalsWidget;
import 'package:flutter/material.dart';

class DetailRentalsModel extends FlutterFlowModel<DetailRentalsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for dropdownCity widget.
  String? dropdownCityValue;
  FormFieldController<String>? dropdownCityValueController;
  // State field(s) for RentalTypeChoice widget.
  FormFieldController<List<String>>? rentalTypeChoiceValueController;
  String? get rentalTypeChoiceValue =>
      rentalTypeChoiceValueController?.value?.firstOrNull;
  set rentalTypeChoiceValue(String? val) =>
      rentalTypeChoiceValueController?.value = val != null ? [val] : [];
  // State field(s) for TotalArea widget.
  FocusNode? totalAreaFocusNode;
  TextEditingController? totalAreaTextController;
  String? Function(BuildContext, String?)? totalAreaTextControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for PricePeriod widget.
  String? pricePeriodValue;
  FormFieldController<String>? pricePeriodValueController;
  // State field(s) for Deposit widget.
  FocusNode? depositFocusNode;
  TextEditingController? depositTextController;
  String? Function(BuildContext, String?)? depositTextControllerValidator;
  // State field(s) for NegotiableSwitch widget.
  bool? negotiableSwitchValue;
  // State field(s) for PriceChoice widget.
  FormFieldController<List<String>>? priceChoiceValueController;
  String? get priceChoiceValue =>
      priceChoiceValueController?.value?.firstOrNull;
  set priceChoiceValue(String? val) =>
      priceChoiceValueController?.value = val != null ? [val] : [];
  // State field(s) for RegistrationSwitch widget.
  bool? registrationSwitchValue1;
  // State field(s) for RegistrationSwitch widget.
  bool? registrationSwitchValue2;
  // State field(s) for RegistrationSwitch widget.
  bool? registrationSwitchValue3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    totalAreaFocusNode?.dispose();
    totalAreaTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();

    depositFocusNode?.dispose();
    depositTextController?.dispose();
  }
}
