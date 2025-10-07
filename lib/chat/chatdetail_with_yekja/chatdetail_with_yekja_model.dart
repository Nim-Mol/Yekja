import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profile/review_and_rating/review_and_rating_widget.dart';
import '/index.dart';
import 'chatdetail_with_yekja_widget.dart' show ChatdetailWithYekjaWidget;
import 'package:flutter/material.dart';

class ChatdetailWithYekjaModel
    extends FlutterFlowModel<ChatdetailWithYekjaWidget> {
  ///  Local state fields for this page.

  bool isImage = false;

  bool? messageSeen = false;

  bool? reviewIsSent;

  bool online = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Chats-ListView widget.
  ScrollController? chatsListViewScrollController;
  Stream<List<MessagesRow>>? chatsListViewSupabaseStream;
  // Models for ReviewAndRating dynamic component.
  late FlutterFlowDynamicModels<ReviewAndRatingModel> reviewAndRatingModels;

  @override
  void initState(BuildContext context) {
    chatsListViewScrollController = ScrollController();
    reviewAndRatingModels =
        FlutterFlowDynamicModels(() => ReviewAndRatingModel());
  }

  @override
  void dispose() {
    chatsListViewScrollController?.dispose();
    reviewAndRatingModels.dispose();
  }
}
