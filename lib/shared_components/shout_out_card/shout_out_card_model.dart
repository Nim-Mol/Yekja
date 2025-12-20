import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'shout_out_card_widget.dart' show ShoutOutCardWidget;
import 'package:flutter/material.dart';

class ShoutOutCardModel extends FlutterFlowModel<ShoutOutCardWidget> {
  ///  Local state fields for this component.

  bool? isLiked;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in shoutOutCard widget.
  List<PostLikeRelationRow>? liked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
