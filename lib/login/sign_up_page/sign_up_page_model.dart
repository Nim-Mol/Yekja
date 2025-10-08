import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/shared_components/botton_standard/botton_standard_widget.dart';
import '/index.dart';
import 'sign_up_page_widget.dart' show SignUpPageWidget;
import 'package:flutter/material.dart';

class SignUpPageModel extends FlutterFlowModel<SignUpPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for userName widget.
  FocusNode? userNameFocusNode;
  TextEditingController? userNameTextController;
  String? Function(BuildContext, String?)? userNameTextControllerValidator;
  String? _userNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '206yhyd6' /* User name is invalid! */,
      );
    }

    if (val.length < 3) {
      return FFLocalizations.of(context).getText(
        'p0w37jdu' /* 3 */,
      );
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'ae4rvotw' /* User name is invalid! */,
      );
    }
    return null;
  }

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  String? _emailAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    if (!RegExp('^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '5gfprwht' /* Please enter a valid email add... */,
      );
    }
    return null;
  }

  // State field(s) for PassWord widget.
  FocusNode? passWordFocusNode;
  TextEditingController? passWordTextController;
  late bool passWordVisibility;
  String? Function(BuildContext, String?)? passWordTextControllerValidator;
  String? _passWordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        'ckanrmbh' /* Minimum 6 characters are requi... */,
      );
    }

    if (!RegExp('^(?=.*[A-Z])(?=.*\\d).{8,}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'h40f5p5q' /* - At least one uppercase lette... */,
      );
    }
    return null;
  }

  // State field(s) for confPassword widget.
  FocusNode? confPasswordFocusNode;
  TextEditingController? confPasswordTextController;
  late bool confPasswordVisibility;
  String? Function(BuildContext, String?)? confPasswordTextControllerValidator;
  String? _confPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        '1nu2760r' /* Minimum 6 characters are requi... */,
      );
    }

    return null;
  }

  // Model for BottonStandard component.
  late BottonStandardModel bottonStandardModel;
  // Stores action output result for [Validate Form] action in BottonStandard widget.
  bool? validationOut;
  // Stores action output result for [Custom Action - customSignUpWithEmail] action in BottonStandard widget.
  String? authonticationError;
  // Stores action output result for [Backend Call - Insert Row] action in BottonStandard widget.
  MonitoringLogsRow? newRegister;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  MonitoringLogsRow? gustUser;

  @override
  void initState(BuildContext context) {
    userNameTextControllerValidator = _userNameTextControllerValidator;
    emailAddressTextControllerValidator = _emailAddressTextControllerValidator;
    passWordVisibility = false;
    passWordTextControllerValidator = _passWordTextControllerValidator;
    confPasswordVisibility = false;
    confPasswordTextControllerValidator = _confPasswordTextControllerValidator;
    bottonStandardModel = createModel(context, () => BottonStandardModel());
  }

  @override
  void dispose() {
    userNameFocusNode?.dispose();
    userNameTextController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passWordFocusNode?.dispose();
    passWordTextController?.dispose();

    confPasswordFocusNode?.dispose();
    confPasswordTextController?.dispose();

    bottonStandardModel.dispose();
  }
}
