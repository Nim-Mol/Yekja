import '/all_comoponet/app_bar/app_bar_widget.dart';
import '/components_yekja/botton_standard/botton_standard_widget.dart';
import '/components_yekja/drop_down_standard/drop_down_standard_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'addnewaddress_page_widget.dart' show AddnewaddressPageWidget;
import 'package:flutter/material.dart';

class AddnewaddressPageModel extends FlutterFlowModel<AddnewaddressPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for AppBar component.
  late AppBarModel appBarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter valid new address.';
    }

    return null;
  }

  // Model for DropDownStandard component.
  late DropDownStandardModel dropDownStandardModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter valid street.';
    }

    return null;
  }

  // Model for BottonStandard component.
  late BottonStandardModel bottonStandardModel;

  @override
  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
    textController1Validator = _textController1Validator;
    dropDownStandardModel = createModel(context, () => DropDownStandardModel());
    textController2Validator = _textController2Validator;
    bottonStandardModel = createModel(context, () => BottonStandardModel());
  }

  @override
  void dispose() {
    appBarModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    dropDownStandardModel.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    bottonStandardModel.dispose();
  }
}
