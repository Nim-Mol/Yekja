import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'pop_up_price_widget.dart' show PopUpPriceWidget;
import 'package:flutter/material.dart';

class PopUpPriceModel extends FlutterFlowModel<PopUpPriceWidget> {
  ///  Local state fields for this component.

  bool timeUnitBool = false;

  String selectedPriceOption = 'To agree';

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
