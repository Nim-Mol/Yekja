import '/flutter_flow/flutter_flow_util.dart';
import '/shared_components/report_bug/report_bug_widget.dart';
import '/index.dart';
import 'sign_up_page_widget.dart' show SignUpPageWidget;
import 'package:flutter/material.dart';

class SignUpPageModel extends FlutterFlowModel<SignUpPageWidget> {
  ///  Local state fields for this page.

  bool loading = false;

  bool terms = false;

  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  // State field(s) for userName widget.
  FocusNode? userNameFocusNode;
  TextEditingController? userNameTextController;
  String? Function(BuildContext, String?)? userNameTextControllerValidator;
  String? _userNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'g57bhyec' /* This field is required. */,
      );
    }

    if (val.length < 3) {
      return FFLocalizations.of(context).getText(
        'gyyzglsg' /* Minimum 3 characters are requi... */,
      );
    }
    if (val.length > 10) {
      return FFLocalizations.of(context).getText(
        'mj06dfc0' /* Max characters reached. */,
      );
    }
    if (!RegExp('^[\\u0600-\\u06FF\\s_\\u0660-\\u06690-9a-zA-Z]+\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'o7uj5dgy' /* Please use only letters (Engli... */,
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
        'v31k1qg9' /* This field is required. */,
      );
    }

    if (!RegExp('^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'fhkvtejh' /* Please enter a valid email add... */,
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
        '2pobt1h6' /* This field is required. */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        'ixw153fz' /* Minimum 6 characters are requi... */,
      );
    }

    if (!RegExp('^(?=.*[A-Z])(?=.*\\d).{8,}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '0ootosfw' /* - At least one uppercase lette... */,
      );
    }
    return null;
  }

  // State field(s) for confPassword widget.
  FocusNode? confPasswordFocusNode;
  TextEditingController? confPasswordTextController;
  late bool confPasswordVisibility;
  String? Function(BuildContext, String?)? confPasswordTextControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Custom Action - customSignUpWithEmail] action in Button widget.
  String? authonticationError;
  // Model for reportBug component.
  late ReportBugModel reportBugModel;

  @override
  void initState(BuildContext context) {
    userNameTextControllerValidator = _userNameTextControllerValidator;
    emailAddressTextControllerValidator = _emailAddressTextControllerValidator;
    passWordVisibility = false;
    passWordTextControllerValidator = _passWordTextControllerValidator;
    confPasswordVisibility = false;
    reportBugModel = createModel(context, () => ReportBugModel());
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

    reportBugModel.dispose();
  }
}
