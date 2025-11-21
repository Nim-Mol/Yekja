import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'profile_edit_widget.dart' show ProfileEditWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ProfileEditModel extends FlutterFlowModel<ProfileEditWidget> {
  ///  Local state fields for this page.

  FFUploadedFile? newAvatar;

  bool allowProfilePhoto = true;

  bool allowSocialMedia = true;

  bool allowFavList = true;

  bool allowCall = true;

  bool allowMessage = true;

  bool isPersonalOpen = false;

  bool isContactOpen = false;

  bool isSocialOpen = false;

  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey6 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey5 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Stores action output result for [Backend Call - Update Row(s)] action in Remove widget.
  List<UserExtRow>? removeAvatar;
  bool isDataUploading_newAvatar = false;
  FFUploadedFile uploadedLocalFile_newAvatar =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_newAvatar = '';

  // Stores action output result for [Backend Call - Update Row(s)] action in Edit widget.
  List<UserExtRow>? updatedAvatar;
  bool isDataUploading_newBackground = false;
  FFUploadedFile uploadedLocalFile_newBackground =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_newBackground = '';

  // Stores action output result for [Backend Call - Update Row(s)] action in IconButton widget.
  List<UserExtRow>? newwalpaper;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for UserName widget.
  FocusNode? userNameFocusNode;
  TextEditingController? userNameTextController;
  String? Function(BuildContext, String?)? userNameTextControllerValidator;
  String? _userNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'k8yaifxp' /* This field is required. */,
      );
    }

    if (val.length < 3) {
      return FFLocalizations.of(context).getText(
        'zi1ckidc' /* Minimum 3 letters are required... */,
      );
    }
    if (val.length > 10) {
      return 'Maximum 10 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('^[\\u0600-\\u06FF\\s_\\u0660-\\u06690-9a-zA-Z]+\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'bjz0w81s' /* Please use only letters (Engli... */,
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
      return 'Field is required';
    }

    if (!RegExp('^\$|^[\\u0600-\\u06FF\\u0660-\\u06690-9a-zA-Z]+\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'k1cds13e' /* Please use only letters (Engli... */,
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
      return 'Field is required';
    }

    if (!RegExp('^\$|^[\\u0600-\\u06FF\\u0660-\\u06690-9a-zA-Z]+\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '6jovzf1s' /* Please use only letters (Engli... */,
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

    if (!RegExp('^[\\u0600-\\u06FF\\s_\\u0660-\\u06690-9a-zA-Z\\.\\!\\?]+\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'sd7ryerl' /* Please use only letters (Engli... */,
      );
    }
    return null;
  }

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for PhoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  String? _phoneNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ysvww2jk' /* phonenumber is required */,
      );
    }

    if (!RegExp('^06\\d{8}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        's3m0a7lo' /* Use a valid phone number. e.g ... */,
      );
    }
    return null;
  }

  // State field(s) for dropdownCity widget.
  String? dropdownCityValue;
  FormFieldController<String>? dropdownCityValueController;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  // State field(s) for InstagramLink widget.
  FocusNode? instagramLinkFocusNode;
  TextEditingController? instagramLinkTextController;
  String? Function(BuildContext, String?)? instagramLinkTextControllerValidator;
  String? _instagramLinkTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(
            '^(https?:\\/\\/)?(www\\.)?(instagram\\.com|instagr\\.am)\\/([A-Za-z0-9_\\.]*)\\??.*')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'iwnn0krk' /* This is not a valid link. */,
      );
    }
    return null;
  }

  // Stores action output result for [Backend Call - Update Row(s)] action in Save widget.
  List<UserExtRow>? updatedUser;
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
  bool? allowMessageValue1;
  // State field(s) for AllowMessage widget.
  bool? allowMessageValue2;
  // State field(s) for AllowMessage widget.
  bool? allowMessageValue3;
  // Stores action output result for [Backend Call - Update Row(s)] action in Save widget.
  List<ConsentsRow>? savedInfo;

  @override
  void initState(BuildContext context) {
    userNameTextControllerValidator = _userNameTextControllerValidator;
    firstNameTextControllerValidator = _firstNameTextControllerValidator;
    lastNameTextControllerValidator = _lastNameTextControllerValidator;
    biographyTextControllerValidator = _biographyTextControllerValidator;
    phoneNumberTextControllerValidator = _phoneNumberTextControllerValidator;
    instagramLinkTextControllerValidator =
        _instagramLinkTextControllerValidator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    expandableExpandableController1.dispose();
    userNameFocusNode?.dispose();
    userNameTextController?.dispose();

    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    biographyFocusNode?.dispose();
    biographyTextController?.dispose();

    expandableExpandableController2.dispose();
    emailFocusNode?.dispose();
    emailTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    expandableExpandableController3.dispose();
    instagramLinkFocusNode?.dispose();
    instagramLinkTextController?.dispose();
  }
}
