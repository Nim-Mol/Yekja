import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'chatdetail_widget.dart' show ChatdetailWidget;
import 'package:flutter/material.dart';

class ChatdetailModel extends FlutterFlowModel<ChatdetailWidget> {
  ///  Local state fields for this page.

  bool isImage = false;

  bool? messageSeen = false;

  bool? reviewIsSent;

  bool online = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Update Row(s)] action in chatdetail widget.
  List<MessagesRow>? messagesInChat;
  // Stores action output result for [Backend Call - Query Rows] action in chatdetail widget.
  List<UserExtRow>? recipient;
  // Stores action output result for [Backend Call - Query Rows] action in chatdetail widget.
  List<ViewUserChatsVisibleRow>? viewChatWithOwner;
  // Stores action output result for [Backend Call - Update Row(s)] action in chatdetail widget.
  List<MessagesRow>? userOffline;
  // State field(s) for ChatsListView widget.
  ScrollController? chatsListViewScrollController;
  Stream<List<MessagesRow>>? chatsListViewSupabaseStream;
  // Stores action output result for [Backend Call - Delete Row(s)] action in Row widget.
  List<PostsRow>? deletedPost;
  // Stores action output result for [Backend Call - Insert Row] action in Row widget.
  ChatsRow? yekjaChat2Customer;
  // Stores action output result for [Backend Call - Insert Row] action in Row widget.
  ChatsRow? yekjaChat2Owner;
  bool isDataUploading_inMemImg1En = false;
  FFUploadedFile uploadedLocalFile_inMemImg1En =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading_uploadToDB1En = false;
  FFUploadedFile uploadedLocalFile_uploadToDB1En =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadToDB1En = '';

  // Stores action output result for [Backend Call - Insert Row] action in IconButton widget.
  MessagesRow? imgMessageEn;
  // Stores action output result for [Backend Call - Insert Row] action in IconButton widget.
  MessagesRow? messageEn;

  @override
  void initState(BuildContext context) {
    chatsListViewScrollController = ScrollController();
  }

  @override
  void dispose() {
    chatsListViewScrollController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
