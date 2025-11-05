import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'contact_y_e_k_j_a_widget.dart' show ContactYEKJAWidget;
import 'package:flutter/material.dart';

class ContactYEKJAModel extends FlutterFlowModel<ContactYEKJAWidget> {
  ///  Local state fields for this page.

  List<String> listOfimages = [];
  void addToListOfimages(String item) => listOfimages.add(item);
  void removeFromListOfimages(String item) => listOfimages.remove(item);
  void removeAtIndexFromListOfimages(int index) => listOfimages.removeAt(index);
  void insertAtIndexInListOfimages(int index, String item) =>
      listOfimages.insert(index, item);
  void updateListOfimagesAtIndex(int index, Function(String) updateFn) =>
      listOfimages[index] = updateFn(listOfimages[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Insert Row] action in Container widget.
  MonitoringLogsRow? fAQClicked;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for Message widget.
  FocusNode? messageFocusNode;
  TextEditingController? messageTextController;
  String? Function(BuildContext, String?)? messageTextControllerValidator;
  String? _messageTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('^[\\u0600-\\u06FF\\s_\\u0660-\\u06690-9a-zA-Z]+\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'n246spdb' /* Please use only letters (Engli... */,
      );
    }
    return null;
  }

  bool isDataUploading_uploadImages = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadImages = [];

  bool isDataUploading_uploadedimage = false;
  FFUploadedFile uploadedLocalFile_uploadedimage =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadedimage = '';

  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ContactYekjaRow? submitedContactWithImg;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ContactYekjaRow? submitedContact;

  @override
  void initState(BuildContext context) {
    messageTextControllerValidator = _messageTextControllerValidator;
  }

  @override
  void dispose() {
    messageFocusNode?.dispose();
    messageTextController?.dispose();
  }
}
