import '/components_yekja/our_main_header/our_main_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'events_widget.dart' show EventsWidget;
import 'package:flutter/material.dart';

class EventsModel extends FlutterFlowModel<EventsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Location widget.
  String? locationValue;
  FormFieldController<String>? locationValueController;
  // Model for OurMainHeader component.
  late OurMainHeaderModel ourMainHeaderModel;

  @override
  void initState(BuildContext context) {
    ourMainHeaderModel = createModel(context, () => OurMainHeaderModel());
  }

  @override
  void dispose() {
    ourMainHeaderModel.dispose();
  }
}
