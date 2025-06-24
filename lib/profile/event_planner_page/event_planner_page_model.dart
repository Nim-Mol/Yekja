import '/flutter_flow/flutter_flow_util.dart';
import 'event_planner_page_widget.dart' show EventPlannerPageWidget;
import 'package:flutter/material.dart';

class EventPlannerPageModel extends FlutterFlowModel<EventPlannerPageWidget> {
  ///  Local state fields for this page.

  bool isFaceId = false;

  bool isNotification = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  // State field(s) for Description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  DateTime? datePicked;
  bool isDataUploading_uploadDataGlg = false;
  FFUploadedFile uploadedLocalFile_uploadDataGlg =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for City widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityTextController;
  String? Function(BuildContext, String?)? cityTextControllerValidator;
  // State field(s) for Postcode widget.
  FocusNode? postcodeFocusNode;
  TextEditingController? postcodeTextController;
  String? Function(BuildContext, String?)? postcodeTextControllerValidator;
  String? _postcodeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'z0lkglcm' /* abc is required */,
      );
    }

    if (!RegExp('^[1-9][0-9]{3}\\s?(?![FIJOUQ])[A-Z]{2}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'm0y8j0ob' /* Please use a valide Dutch post... */,
      );
    }
    return null;
  }

  // State field(s) for Street widget.
  FocusNode? streetFocusNode;
  TextEditingController? streetTextController;
  String? Function(BuildContext, String?)? streetTextControllerValidator;

  @override
  void initState(BuildContext context) {
    postcodeTextControllerValidator = _postcodeTextControllerValidator;
  }

  @override
  void dispose() {
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    cityFocusNode?.dispose();
    cityTextController?.dispose();

    postcodeFocusNode?.dispose();
    postcodeTextController?.dispose();

    streetFocusNode?.dispose();
    streetTextController?.dispose();
  }
}
