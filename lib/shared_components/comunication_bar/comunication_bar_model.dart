import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'comunication_bar_widget.dart' show ComunicationBarWidget;
import 'package:flutter/material.dart';

class ComunicationBarModel extends FlutterFlowModel<ComunicationBarWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ViewUserChatsRow>? chatExist;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ChatsRow? chat;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ViewUserChatsRow>? chatCreated;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
