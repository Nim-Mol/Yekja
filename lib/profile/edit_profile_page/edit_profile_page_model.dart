import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'edit_profile_page_widget.dart' show EditProfilePageWidget;
import 'package:flutter/material.dart';

class EditProfilePageModel extends FlutterFlowModel<EditProfilePageWidget> {
  ///  Local state fields for this page.

  FFUploadedFile? newAvatar;

  bool allowProfilePhoto = true;

  bool allowSocialMedia = true;

  bool allowFavList = true;

  bool allowCall = true;

  bool allowMessage = true;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Stores action output result for [Backend Call - Update Row(s)] action in Remove widget.
  List<UserExtRow>? defultAvatar;
  bool isDataUploading_newAvatarImg = false;
  FFUploadedFile uploadedLocalFile_newAvatarImg =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_newAvatarImg = '';

  // Stores action output result for [Backend Call - Update Row(s)] action in Edit widget.
  List<UserExtRow>? updatedAvatar;
  bool isDataUploading_backgroundImg = false;
  FFUploadedFile uploadedLocalFile_backgroundImg =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_backgroundImg = '';

  // Stores action output result for [Backend Call - Update Row(s)] action in IconButton widget.
  List<UserExtRow>? newwalpaper;
  // Stores action output result for [Backend Call - Update Row(s)] action in RemoveWallpaper widget.
  List<UserExtRow>? removedWallpaper;
  // State field(s) for UserName widget.
  FocusNode? userNameFocusNode;
  TextEditingController? userNameTextController;
  String? Function(BuildContext, String?)? userNameTextControllerValidator;
  String? _userNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'kzqn68ob' /* This field is required. */,
      );
    }

    if (val.length < 3) {
      return FFLocalizations.of(context).getText(
        'x0qbl9nx' /* Minimum 3 letters are required... */,
      );
    }
    if (val.length > 15) {
      return FFLocalizations.of(context).getText(
        '5w04aalv' /* user name is too lang. */,
      );
    }
    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '3jdly5te' /* Only letter(A-Z) are valid. */,
      );
    }
    return null;
  }

  // State field(s) for FirstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  String? _textController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ysa8o678' /* This field is required */,
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
        '9mmnqcod' /* Please only user letter. */,
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
        'xm54x3n1' /* Please enter valid Email addre... */,
      );
    }

    if (val.length < 7) {
      return FFLocalizations.of(context).getText(
        'cjui5wmm' /* This field is required */,
      );
    }

    if (!RegExp('^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'bzz1mpym' /* Please enter valid Email addre... */,
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
        'n8h9b885' /* This field is required. */,
      );
    }

    if (!RegExp('^06\\d{8}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '45tsdecd' /* Use a valid phone number. e.g ... */,
      );
    }
    return null;
  }

  // State field(s) for City widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityTextController;
  String? Function(BuildContext, String?)? cityTextControllerValidator;
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
        '4z0aqe0c' /* Too many characters. */,
      );
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in ChangePassword widget.
  bool? valid;
  // State field(s) for AllowProfilePhoto widget.
  bool? allowProfilePhotoValue;
  // State field(s) for AllowSocialMedia widget.
  bool? allowSocialMediaValue;
  // State field(s) for AllowFavList widget.
  bool? allowFavListValue;
  // State field(s) for AllowCall widget.
  bool? allowCallValue;
  // State field(s) for AllowMessage widget.
  bool? allowMessageValue;
  // Stores action output result for [Backend Call - Update Row(s)] action in Save widget.
  List<ConsentsRow>? savedInfo;

  @override
  void initState(BuildContext context) {
    userNameTextControllerValidator = _userNameTextControllerValidator;
    textController3Validator = _textController3Validator;
    emailTextControllerValidator = _emailTextControllerValidator;
    phoneNumberTextControllerValidator = _phoneNumberTextControllerValidator;
    biographyTextControllerValidator = _biographyTextControllerValidator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    userNameFocusNode?.dispose();
    userNameTextController?.dispose();

    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController3?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    cityFocusNode?.dispose();
    cityTextController?.dispose();

    biographyFocusNode?.dispose();
    biographyTextController?.dispose();
  }
}
