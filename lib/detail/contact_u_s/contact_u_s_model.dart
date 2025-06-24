import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'contact_u_s_widget.dart' show ContactUSWidget;
import 'package:flutter/material.dart';

class ContactUSModel extends FlutterFlowModel<ContactUSWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for YourNote widget.
  FocusNode? yourNoteFocusNode;
  TextEditingController? yourNoteTextController;
  String? Function(BuildContext, String?)? yourNoteTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();

    yourNoteFocusNode?.dispose();
    yourNoteTextController?.dispose();
  }
}
