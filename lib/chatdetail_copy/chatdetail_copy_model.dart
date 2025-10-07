import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profile/review_and_rating/review_and_rating_widget.dart';
import '/index.dart';
import 'chatdetail_copy_widget.dart' show ChatdetailCopyWidget;
import 'package:flutter/material.dart';

class ChatdetailCopyModel extends FlutterFlowModel<ChatdetailCopyWidget> {
  ///  Local state fields for this page.

  bool isImage = false;

  bool? messageSeen = false;

  bool? reviewIsSent;

  bool online = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in chatdetailCopy widget.
  List<UserExtRow>? recipient;
  // Stores action output result for [Backend Call - Update Row(s)] action in chatdetailCopy widget.
  List<MessagesRow>? userOffline;
  // State field(s) for Chats-ListView widget.
  ScrollController? chatsListViewScrollController;
  Stream<List<MessagesRow>>? chatsListViewSupabaseStream;
  // Models for ReviewAndRating dynamic component.
  late FlutterFlowDynamicModels<ReviewAndRatingModel> reviewAndRatingModels;
  bool isDataUploading_inMemImg = false;
  FFUploadedFile uploadedLocalFile_inMemImg =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading_uploadToDB = false;
  FFUploadedFile uploadedLocalFile_uploadToDB =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadToDB = '';

  // Stores action output result for [Backend Call - Insert Row] action in IconButton widget.
  MessagesRow? imgMessage;
  // Stores action output result for [Backend Call - Insert Row] action in IconButton widget.
  MessagesRow? message;

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
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
