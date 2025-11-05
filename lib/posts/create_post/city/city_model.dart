import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'city_widget.dart' show CityWidget;
import 'package:flutter/material.dart';

class CityModel extends FlutterFlowModel<CityWidget> {
  ///  Local state fields for this component.

  bool timeUnitBool = false;

  String selectedPriceOption = 'To agree';

  ///  State fields for stateful widgets in this component.

  // State field(s) for dropdownCity widget.
  String? dropdownCityValue;
  FormFieldController<String>? dropdownCityValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
