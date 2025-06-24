import '/components_yekja/botton_standard/botton_standard_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'sign_up_page_widget.dart' show SignUpPageWidget;
import 'package:flutter/material.dart';

class SignUpPageModel extends FlutterFlowModel<SignUpPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for fisrtName widget.
  FocusNode? fisrtNameFocusNode;
  TextEditingController? fisrtNameTextController;
  String? Function(BuildContext, String?)? fisrtNameTextControllerValidator;
  String? _fisrtNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'nwrf2xzf' /* First Name is required */,
      );
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Must start with a letter and can only contain letters, digits and - or _.';
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
      return FFLocalizations.of(context).getText(
        'yomt8b8f' /* Email is required */,
      );
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    if (!RegExp('^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '5gfprwht' /* Please enter valid Email addre... */,
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
      return FFLocalizations.of(context).getText(
        '0ndzc1mz' /* Password is required */,
      );
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
      return FFLocalizations.of(context).getText(
        '8me73vdb' /* Confirm Password is required */,
      );
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
  // Stores action output result for [Custom Action - customSignUpWithEmail] action in BottonStandard widget.
  String? authonticationError;

  @override
  void initState(BuildContext context) {
    fisrtNameTextControllerValidator = _fisrtNameTextControllerValidator;
    emailAddressTextControllerValidator = _emailAddressTextControllerValidator;
    passWordVisibility = false;
    passWordTextControllerValidator = _passWordTextControllerValidator;
    confPasswordVisibility = false;
    confPasswordTextControllerValidator = _confPasswordTextControllerValidator;
    bottonStandardModel = createModel(context, () => BottonStandardModel());
  }

  @override
  void dispose() {
    fisrtNameFocusNode?.dispose();
    fisrtNameTextController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passWordFocusNode?.dispose();
    passWordTextController?.dispose();

    confPasswordFocusNode?.dispose();
    confPasswordTextController?.dispose();

    bottonStandardModel.dispose();
  }
}
