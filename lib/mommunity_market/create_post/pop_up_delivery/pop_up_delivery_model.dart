import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'pop_up_delivery_widget.dart' show PopUpDeliveryWidget;
import 'package:flutter/material.dart';

class PopUpDeliveryModel extends FlutterFlowModel<PopUpDeliveryWidget> {
  ///  Local state fields for this component.

  bool deliveryBool = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for SwitchDeliveryApplies widget.
  bool? switchDeliveryAppliesValue;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
