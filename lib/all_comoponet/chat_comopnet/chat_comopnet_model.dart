import '/all_comoponet/chat_empty/chat_empty_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_comopnet_widget.dart' show ChatComopnetWidget;
import 'package:flutter/material.dart';

class ChatComopnetModel extends FlutterFlowModel<ChatComopnetWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ChatEmpty component.
  late ChatEmptyModel chatEmptyModel;

  @override
  void initState(BuildContext context) {
    chatEmptyModel = createModel(context, () => ChatEmptyModel());
  }

  @override
  void dispose() {
    chatEmptyModel.dispose();
  }
}
