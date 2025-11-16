import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'change_email_page_widget.dart' show ChangeEmailPageWidget;
import 'package:flutter/material.dart';

class ChangeEmailPageModel extends FlutterFlowModel<ChangeEmailPageWidget> {
  ///  Local state fields for this page.

  bool loading = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for NewEmial widget.
  FocusNode? newEmialFocusNode;
  TextEditingController? newEmialTextController;
  String? Function(BuildContext, String?)? newEmialTextControllerValidator;
  String? _newEmialTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '7fzxxs8j' /* Please enter valid new passwor... */,
      );
    }

    if (!RegExp('^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        's7ssap9i' /* please use a valid email addre... */,
      );
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    newEmialTextControllerValidator = _newEmialTextControllerValidator;
  }

  @override
  void dispose() {
    newEmialFocusNode?.dispose();
    newEmialTextController?.dispose();
  }
}
