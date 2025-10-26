import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_edit_copy_widget.dart' show ProfileEditCopyWidget;
import 'package:flutter/material.dart';

class ProfileEditCopyModel extends FlutterFlowModel<ProfileEditCopyWidget> {
  ///  Local state fields for this page.

  FFUploadedFile? newAvatar;

  bool allowProfilePhoto = true;

  bool allowSocialMedia = true;

  bool allowFavList = true;

  bool allowCall = true;

  bool allowMessage = true;

  bool phoneNumberChanged = false;

  bool isPersonalOpen = false;

  bool isContactOpen = false;

  bool isSocialOpen = false;

  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Stores action output result for [Backend Call - Update Row(s)] action in Remove widget.
  List<UserExtRow>? defultAvatar;
  bool isDataUploading_newAvatar = false;
  FFUploadedFile uploadedLocalFile_newAvatar =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_newAvatar = '';

  // Stores action output result for [Backend Call - Update Row(s)] action in Edit widget.
  List<UserExtRow>? updatedAvatar;
  bool isDataUploading_newBackground = false;
  FFUploadedFile uploadedLocalFile_newBackground =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_newBackground = '';

  // Stores action output result for [Backend Call - Update Row(s)] action in IconButton widget.
  List<UserExtRow>? newwalpaper;
  // Stores action output result for [Backend Call - Update Row(s)] action in RemoveWallpaper widget.
  List<UserExtRow>? removedWallpaperCopy;
  // State field(s) for UserName widget.
  FocusNode? userNameFocusNode;
  TextEditingController? userNameTextController;
  String? Function(BuildContext, String?)? userNameTextControllerValidator;
  String? _userNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '4f5fv6ht' /* This field is required. */,
      );
    }

    if (val.length < 3) {
      return FFLocalizations.of(context).getText(
        '0a376pzj' /* Minimum 3 letters are required... */,
      );
    }
    if (val.length > 15) {
      return FFLocalizations.of(context).getText(
        'ca30mi4r' /* user name is too lang. */,
      );
    }
    if (!RegExp('^[\\u0600-\\u06FF\\s_\\u0660-\\u06690-9a-zA-Z]+\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'uwnfnwxd' /* Please use only letters (Engli... */,
      );
    }
    return null;
  }

  // State field(s) for FirstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;
  String? _firstNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'hly9yj28' /* firstName is required */,
      );
    }

    if (!RegExp('^[\\u0600-\\u06FF\\u0660-\\u06690-9a-zA-Z]+\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'veo7h5we' /* Please use only letters (Engli... */,
      );
    }
    return null;
  }

  // State field(s) for lastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameTextController;
  String? Function(BuildContext, String?)? lastNameTextControllerValidator;
  String? _lastNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'c89tv1b8' /* This field is required */,
      );
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }
    if (val.length > 20) {
      return 'Maximum 20 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('^[\\u0600-\\u06FF\\u0660-\\u06690-9a-zA-Z]+\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'mlp0lwnh' /* Please use only letters (Engli... */,
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
        'alzr2t5y' /* Too many characters. */,
      );
    }
    if (!RegExp('^[\\u0600-\\u06FF\\s_\\u0660-\\u06690-9a-zA-Z\\.]+\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'fkcs1o4e' /* Please use only letters (Engli... */,
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
        '2mnrvw91' /* Please enter valid Email addre... */,
      );
    }

    if (val.length < 7) {
      return FFLocalizations.of(context).getText(
        'hbbj80ns' /* This field is required */,
      );
    }

    if (!RegExp('^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'nveeeqqf' /* Please use a valid email addre... */,
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
        'iwm4ef5q' /* This field is required. */,
      );
    }

    if (!RegExp('^06\\d{8}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'w3quzm39' /* Use a valid phone number. e.g ... */,
      );
    }
    return null;
  }

  // State field(s) for City widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityTextController;
  String? Function(BuildContext, String?)? cityTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  // Stores action output result for [Validate Form] action in Save widget.
  bool? valid;
  // Stores action output result for [Custom Action - userSoftDeleteAsync] action in RichTextSpan widget.
  bool? succes;
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
    firstNameTextControllerValidator = _firstNameTextControllerValidator;
    lastNameTextControllerValidator = _lastNameTextControllerValidator;
    biographyTextControllerValidator = _biographyTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
    phoneNumberTextControllerValidator = _phoneNumberTextControllerValidator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    userNameFocusNode?.dispose();
    userNameTextController?.dispose();

    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    biographyFocusNode?.dispose();
    biographyTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    cityFocusNode?.dispose();
    cityTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController7?.dispose();
  }
}
