import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sign_in_confirm_widget.dart' show SignInConfirmWidget;
import 'package:flutter/material.dart';

class SignInConfirmModel extends FlutterFlowModel<SignInConfirmWidget> {
  ///  Local state fields for this page.

  bool vrified = true;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for userName widget.
  FocusNode? userNameFocusNode;
  TextEditingController? userNameTextController;
  String? Function(BuildContext, String?)? userNameTextControllerValidator;
  String? _userNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'xhzqr4bk' /* Username is required */,
      );
    }

    if (val.length < 4) {
      return FFLocalizations.of(context).getText(
        'mm8x2xit' /* At least 4 characters are requ... */,
      );
    }
    if (val.length > 12) {
      return FFLocalizations.of(context).getText(
        'c1vrjuyc' /* Max 12 characters are required */,
      );
    }
    if (!RegExp('^[\\u0600-\\u06FF\\s_\\u0660-\\u06690-9]+\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'xcdq956e' /* Please use only letters (Engli... */,
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
      return FFLocalizations.of(context).getText(
        '77e8urzk' /* Email is required */,
      );
    }

    if (!RegExp('^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'ed0qiknp' /* Please enter a valid email add... */,
      );
    }
    return null;
  }

  // State field(s) for PassWord widget.
  FocusNode? passWordFocusNode;
  TextEditingController? passWordTextController;
  late bool passWordVisibility;
  String? Function(BuildContext, String?)? passWordTextControllerValidator;
  // Stores action output result for [Custom Action - customSignUpWithEmail] action in Button widget.
  String? authonticationError;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  MonitoringLogsRow? confirmEmail;

  @override
  void initState(BuildContext context) {
    userNameTextControllerValidator = _userNameTextControllerValidator;
    emailAddressTextControllerValidator = _emailAddressTextControllerValidator;
    passWordVisibility = false;
  }

  @override
  void dispose() {
    userNameFocusNode?.dispose();
    userNameTextController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passWordFocusNode?.dispose();
    passWordTextController?.dispose();
  }
}
