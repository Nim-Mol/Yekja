import '/components_yekja/botton_standard/botton_standard_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'edit_profile_page_widget.dart' show EditProfilePageWidget;
import 'package:flutter/material.dart';

class EditProfilePageModel extends FlutterFlowModel<EditProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  bool isDataUploading_uploadData4up = false;
  FFUploadedFile uploadedLocalFile_uploadData4up =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadDataX8t = false;
  FFUploadedFile uploadedLocalFile_uploadDataX8t =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for FirsName widget.
  FocusNode? firsNameFocusNode;
  TextEditingController? firsNameTextController;
  String? Function(BuildContext, String?)? firsNameTextControllerValidator;
  String? _firsNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'a3u6xako' /* Please enter valid first name. */,
      );
    }

    if (val.length < 2) {
      return FFLocalizations.of(context).getText(
        'qv5r7ztk' /* Minimum 4 letters are required... */,
      );
    }
    if (val.length > 20) {
      return FFLocalizations.of(context).getText(
        'dl7s6888' /* Too lang. */,
      );
    }
    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'ktttbjpc' /* Only letter(A-Z) are valid. */,
      );
    }
    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'evx6tw37' /* LastName is required */,
      );
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }
    if (val.length > 20) {
      return 'Maximum 20 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('^[A-Za-z ]+\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'su2elewf' /* Only letter's and space are al... */,
      );
    }
    return null;
  }

  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'dn67pzsa' /* Please enter valid Email addre... */,
      );
    }

    if (!RegExp('^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '6tsrcuds' /* Please enter valid Email addre... */,
      );
    }
    return null;
  }

  // State field(s) for PhoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  String? _phoneNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'dk5fo1dm' /* email@email.com is required */,
      );
    }

    if (!RegExp('^0\\d{9}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '74oi7dkd' /* Use a valid phone number.  fol... */,
      );
    }
    return null;
  }

  // State field(s) for Biography widget.
  FocusNode? biographyFocusNode;
  TextEditingController? biographyTextController;
  String? Function(BuildContext, String?)? biographyTextControllerValidator;
  String? _biographyTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length > 250) {
      return FFLocalizations.of(context).getText(
        '31v134g5' /* Too many characters. */,
      );
    }

    return null;
  }

  // Model for BottonStandard component.
  late BottonStandardModel bottonStandardModel;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for Switch widget.
  bool? switchValue3;
  // State field(s) for Switch widget.
  bool? switchValue4;
  // State field(s) for Switch widget.
  bool? switchValue5;

  @override
  void initState(BuildContext context) {
    firsNameTextControllerValidator = _firsNameTextControllerValidator;
    textController2Validator = _textController2Validator;
    emailTextControllerValidator = _emailTextControllerValidator;
    phoneNumberTextControllerValidator = _phoneNumberTextControllerValidator;
    biographyTextControllerValidator = _biographyTextControllerValidator;
    bottonStandardModel = createModel(context, () => BottonStandardModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    firsNameFocusNode?.dispose();
    firsNameTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    biographyFocusNode?.dispose();
    biographyTextController?.dispose();

    bottonStandardModel.dispose();
  }
}
