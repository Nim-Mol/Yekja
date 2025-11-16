import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/shared_components/confirm_cancel_pop_up/confirm_cancel_pop_up_widget.dart';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'chatdetail_model.dart';
export 'chatdetail_model.dart';

class ChatdetailWidget extends StatefulWidget {
  const ChatdetailWidget({
    super.key,
    required this.chatId,
    required this.ownerID,
    this.postID,
    required this.ownerUserName,
    this.ownerAvatar,
    required this.senderID,
    required this.senderUserName,
    this.senderAvatar,
  });

  final int? chatId;
  final String? ownerID;
  final String? postID;
  final String? ownerUserName;
  final String? ownerAvatar;
  final String? senderID;
  final String? senderUserName;
  final String? senderAvatar;

  static String routeName = 'chatdetail';
  static String routePath = '/chatdetail';

  @override
  State<ChatdetailWidget> createState() => _ChatdetailWidgetState();
}

class _ChatdetailWidgetState extends State<ChatdetailWidget> {
  late ChatdetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatdetailModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await MessagesTable().update(
        data: {
          'recipient_online': true,
          'seen': true,
        },
        matchingRows: (rows) => rows
            .eqOrNull(
              'chat_id',
              widget.chatId,
            )
            .eqOrNull(
              'recipient',
              currentUserUid,
            ),
      );
      _model.recipient = await UserExtTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'id',
          currentUserUid,
        ),
      );
      await _model.chatsListViewScrollController?.animateTo(
        _model.chatsListViewScrollController!.position.maxScrollExtent,
        duration: Duration(milliseconds: 100),
        curve: Curves.ease,
      );
      _model.viewChatWithOwner = await ViewUserChatsVisibleTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'chat_id',
          widget.chatId,
        ),
      );
      _model.online = true;
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    // On page dispose action.
    () async {
      await MessagesTable().update(
        data: {
          'recipient_online': false,
          'seen': true,
        },
        matchingRows: (rows) => rows
            .eqOrNull(
              'chat_id',
              widget.chatId,
            )
            .eqOrNull(
              'recipient',
              currentUserUid,
            ),
      );
      _model.online = false;
      safeSetState(() {});
    }();

    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        top: true,
        child: Align(
          alignment: AlignmentDirectional(0.0, -1.0),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 480.0,
            ),
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              ChatPageWidget.routeName,
                              queryParameters: {
                                'profileid': serializeParam(
                                  currentUserUid,
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                ProfilePageWidget.routeName,
                                queryParameters: {
                                  'profileId': serializeParam(
                                    widget.ownerID == currentUserUid
                                        ? widget.senderID
                                        : widget.ownerID,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24.0),
                              child: Image.network(
                                valueOrDefault<String>(
                                  (widget.ownerID == currentUserUid) &&
                                          (widget.senderAvatar != null &&
                                              widget.senderAvatar != '')
                                      ? widget.senderAvatar
                                      : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/n2imhdlvogb3/profile_avatar_circular.png',
                                  'https://bkygphvuuqmpmcfrncpm.supabase.co/storage/v1/object/public/yekja/Assets/anonymous.jpg',
                                ),
                                width: 50.0,
                                height: 50.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget.ownerID == currentUserUid
                                  ? widget.senderUserName
                                  : widget.ownerUserName,
                              'user name',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ].divide(SizedBox(width: 10.0)),
                      ),
                    ].divide(SizedBox(width: 10.0)),
                  ),
                ),
                Expanded(
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 480.0,
                      maxHeight: 700.0,
                    ),
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: StreamBuilder<List<MessagesRow>>(
                        stream: _model.chatsListViewSupabaseStream ??= SupaFlow
                            .client
                            .from("messages")
                            .stream(primaryKey: ['id'])
                            .eqOrNull(
                              'chat_id',
                              widget.chatId,
                            )
                            .order('created_at', ascending: true)
                            .map((list) =>
                                list.map((item) => MessagesRow(item)).toList()),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: SpinKitChasingDots(
                                  color: FlutterFlowTheme.of(context).greenInit,
                                  size: 50.0,
                                ),
                              ),
                            );
                          }
                          List<MessagesRow> chatsListViewMessagesRowList =
                              snapshot.data!;

                          return ListView.builder(
                            padding: EdgeInsets.fromLTRB(
                              0,
                              16.0,
                              0,
                              30.0,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount: chatsListViewMessagesRowList.length,
                            itemBuilder: (context, chatsListViewIndex) {
                              final chatsListViewMessagesRow =
                                  chatsListViewMessagesRowList[
                                      chatsListViewIndex];
                              return Align(
                                alignment: AlignmentDirectional(1.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    if (chatsListViewMessagesRow.sentBy !=
                                        currentUserUid) {
                                      return Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, -1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 2.0, 12.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if ((chatsListViewMessagesRow
                                                          .isImg ==
                                                      false) &&
                                                  (chatsListViewMessagesRow
                                                          .isReview ==
                                                      false))
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 4.0),
                                                    child: Container(
                                                      constraints:
                                                          BoxConstraints(
                                                        minWidth: 80.0,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF232426),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  16.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  16.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  16.0),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    8.0,
                                                                    12.0,
                                                                    8.0),
                                                        child: AutoSizeText(
                                                          valueOrDefault<
                                                              String>(
                                                            chatsListViewMessagesRow
                                                                .messageText,
                                                            'Hellooo',
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          maxLines: 10,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Satoshi',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (chatsListViewMessagesRow
                                                  .isImg)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 4.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        chatsListViewMessagesRow
                                                            .imgMessage!,
                                                        fit: BoxFit.cover,
                                                        cacheWidth: 300,
                                                        cacheHeight: 350,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (chatsListViewMessagesRow
                                                      .createdAt ==
                                                  _model.message?.createdAt)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                4.0, 0.0),
                                                    child: Text(
                                                      '${dateTimeFormat(
                                                        "MMMEd",
                                                        chatsListViewMessagesRow
                                                            .createdAt,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )} at ${dateTimeFormat(
                                                        "Hm",
                                                        chatsListViewMessagesRow
                                                            .createdAt,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      );
                                    } else {
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 2.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if ((chatsListViewMessagesRow
                                                        .isImg ==
                                                    false) &&
                                                (chatsListViewMessagesRow
                                                        .isReview ==
                                                    false))
                                              Stack(
                                                alignment: AlignmentDirectional(
                                                    1.0, 1.0),
                                                children: [
                                                  if (chatsListViewMessagesRow
                                                          .isImg ==
                                                      false)
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, -1.0),
                                                      child: Container(
                                                        constraints:
                                                            BoxConstraints(
                                                          minWidth: 80.0,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x4125C4A4),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    12.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    0.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    12.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    12.0),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      8.0,
                                                                      30.0,
                                                                      8.0),
                                                          child: AutoSizeText(
                                                            valueOrDefault<
                                                                String>(
                                                              chatsListViewMessagesRow
                                                                  .messageText,
                                                              'Hellooo',
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            maxLines: 10,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Satoshi',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  8.0,
                                                                  8.0),
                                                      child: Icon(
                                                        Icons.done_all,
                                                        color: (chatsListViewMessagesRow
                                                                        .seen ==
                                                                    true) ||
                                                                (chatsListViewMessagesRow
                                                                        .recipientOnline ==
                                                                    true)
                                                            ? Color(0xFF40C057)
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                        size: 14.0,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            if (chatsListViewMessagesRow
                                                    .isImg ==
                                                false)
                                              Stack(
                                                alignment: AlignmentDirectional(
                                                    1.0, 1.0),
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  4.0),
                                                      child: Container(
                                                        constraints:
                                                            BoxConstraints(
                                                          minWidth: 80.0,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x4125C4A4),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    12.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    0.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    12.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    12.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            if (chatsListViewMessagesRow.isImg)
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, -1.0),
                                                child: Stack(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 1.0),
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  4.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          chatsListViewMessagesRow
                                                              .imgMessage!,
                                                          fit: BoxFit.cover,
                                                          alignment: Alignment(
                                                              1.0, -1.0),
                                                          cacheWidth: 300,
                                                          cacheHeight: 350,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  8.0,
                                                                  8.0),
                                                      child: Icon(
                                                        Icons.done_all,
                                                        color: (chatsListViewMessagesRow
                                                                        .seen ==
                                                                    true) ||
                                                                (chatsListViewMessagesRow
                                                                        .recipientOnline ==
                                                                    true)
                                                            ? Color(0xFF40C057)
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                        size: 14.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            if (chatsListViewMessagesRow
                                                    .createdAt >
                                                chatsListViewMessagesRow
                                                    .createdAt)
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 16.0),
                                                  child: Text(
                                                    '${dateTimeFormat(
                                                      "MMMEd",
                                                      chatsListViewMessagesRow
                                                          .createdAt,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    )} at ${dateTimeFormat(
                                                      "Hm",
                                                      chatsListViewMessagesRow
                                                          .createdAt,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    )}',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      );
                                    }
                                  },
                                ),
                              );
                            },
                            controller: _model.chatsListViewScrollController,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if ((currentUserUid == widget.ownerID) &&
                            (_model.viewChatWithOwner?.lastOrNull
                                    ?.deletedPost ==
                                false))
                          Builder(
                            builder: (context) => Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: ConfirmCancelPopUpWidget(
                                          header: FFLocalizations.of(context)
                                              .getText(
                                            'uoqbv4g1' /* All done? */,
                                          ),
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'delpwk3s' /* Ready to close this post and g... */,
                                          ),
                                          onConfirmAction: () async {
                                            await Future.wait([
                                              Future(() async {
                                                _model.yekjaChat2Customer =
                                                    await ChatsTable().insert({
                                                  'sender': FFAppConstants
                                                      .YekjaAdminID,
                                                  'sender_name': 'Yekja',
                                                  'recipient': widget.senderID,
                                                  'post_id': widget.postID,
                                                });
                                                await MessagesTable().insert({
                                                  'sent_by': FFAppConstants
                                                      .YekjaAdminID,
                                                  'chat_id': _model
                                                      .yekjaChat2Customer?.id,
                                                  'message_text':
                                                      'Congratulations!! The post owner decided to go with you and close this post.   Please take a moment to review them to strengthen our community trust.',
                                                  'recipient': widget.senderID,
                                                });
                                                await MessagesTable().insert({
                                                  'sent_by': FFAppConstants
                                                      .YekjaAdminID,
                                                  'chat_id': _model
                                                      .yekjaChat2Customer?.id,
                                                  'recipient': widget.senderID,
                                                  'is_review': true,
                                                  'message_text':
                                                      'Quick review for their post?',
                                                  'post_customer_id':
                                                      widget.senderID,
                                                  'post_owner_id':
                                                      widget.ownerID,
                                                });
                                              }),
                                              Future(() async {
                                                _model.yekjaChat2Owner =
                                                    await ChatsTable().insert({
                                                  'sender': FFAppConstants
                                                      .YekjaAdminID,
                                                  'sender_name': 'Yekja',
                                                  'recipient': widget.ownerID,
                                                  'post_id': widget.postID,
                                                });
                                                await MessagesTable().insert({
                                                  'sent_by': FFAppConstants
                                                      .YekjaAdminID,
                                                  'chat_id': _model
                                                      .yekjaChat2Owner?.id,
                                                  'message_text':
                                                      'Congratulations you just sealed the deal! Your post is closed now successfully.  Please leave a quick review for the member you connected with to help build trust.',
                                                  'recipient': widget.ownerID,
                                                });
                                                await MessagesTable().insert({
                                                  'sent_by': FFAppConstants
                                                      .YekjaAdminID,
                                                  'chat_id': _model
                                                      .yekjaChat2Owner?.id,
                                                  'recipient': widget.ownerID,
                                                  'is_review': true,
                                                  'message_text':
                                                      'Quick review how this went with the other member?',
                                                  'post_customer_id':
                                                      widget.senderID,
                                                  'post_owner_id':
                                                      widget.ownerID,
                                                });
                                              }),
                                            ]);
                                            await Future.wait([
                                              Future(() async {
                                                await PostsTable().delete(
                                                  matchingRows: (rows) =>
                                                      rows.eqOrNull(
                                                    'id',
                                                    widget.postID,
                                                  ),
                                                );
                                              }),
                                              Future(() async {
                                                Navigator.pop(context);
                                              }),
                                            ]);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Your post is closed sussuccfully!',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    Color(0x4340C057),
                                              ),
                                            );

                                            context.pushNamed(
                                              ChatPageWidget.routeName,
                                              queryParameters: {
                                                'profileid': serializeParam(
                                                  currentUserUid,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          onCancelAction: () async {},
                                        ),
                                      );
                                    },
                                  );

                                  safeSetState(() {});
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.grinStars,
                                      color: Color(0xB90F9970),
                                      size: 18.0,
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'v838atpy' /* Accept & close post when ready... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .textgray,
                                            letterSpacing: 0.0,
                                            decoration:
                                                TextDecoration.underline,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 4.0)),
                                ),
                              ),
                            ),
                          ),
                        if (widget.senderID != FFAppConstants.YekjaAdminID)
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 32.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 8.0,
                                        buttonSize: 36.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        icon: Icon(
                                          Icons.image_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .textgray,
                                          size: 30.0,
                                        ),
                                        onPressed: () async {
                                          final selectedMedia =
                                              await selectMediaWithSourceBottomSheet(
                                            context: context,
                                            maxWidth: 200.00,
                                            maxHeight: 200.00,
                                            allowPhoto: true,
                                          );
                                          if (selectedMedia != null &&
                                              selectedMedia.every((m) =>
                                                  validateFileFormat(
                                                      m.storagePath,
                                                      context))) {
                                            safeSetState(() => _model
                                                    .isDataUploading_inMemImg1 =
                                                true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];

                                            try {
                                              selectedUploadedFiles =
                                                  selectedMedia
                                                      .map(
                                                          (m) => FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
                                                                originalFilename:
                                                                    m.originalFilename,
                                                              ))
                                                      .toList();
                                            } finally {
                                              _model.isDataUploading_inMemImg1 =
                                                  false;
                                            }
                                            if (selectedUploadedFiles.length ==
                                                selectedMedia.length) {
                                              safeSetState(() {
                                                _model.uploadedLocalFile_inMemImg1 =
                                                    selectedUploadedFiles.first;
                                              });
                                            } else {
                                              safeSetState(() {});
                                              return;
                                            }
                                          }

                                          _model.isImage = true;
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Stack(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        children: [
                                          Container(
                                            height: 50.0,
                                            decoration: BoxDecoration(),
                                            child: TextFormField(
                                              controller: _model.textController,
                                              focusNode:
                                                  _model.textFieldFocusNode,
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: false,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'm04p2p42' /* Type here */,
                                                ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMediumIsCustom,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .textgray,
                                                    width: 0.5,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 0.5,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 0.5,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 0.5,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              validator: _model
                                                  .textControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          if (_model.isImage == true)
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 64.0,
                                                  height: 36.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Stack(
                                                    children: [
                                                      if (_model.isImage ==
                                                          true)
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        8.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.memory(
                                                                _model.uploadedLocalFile_inMemImg1
                                                                        .bytes ??
                                                                    Uint8List
                                                                        .fromList(
                                                                            []),
                                                                width: 40.0,
                                                                height: 40.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, -1.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            _model.isImage =
                                                                false;
                                                            safeSetState(() {});
                                                          },
                                                          child: Icon(
                                                            Icons.close_sharp,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 14.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 6.0, 6.0),
                                              child: FlutterFlowIconButton(
                                                borderRadius: 8.0,
                                                buttonSize: 36.0,
                                                icon: Icon(
                                                  Icons.send,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  var _shouldSetState = false;
                                                  if (_model.isImage) {
                                                    {
                                                      safeSetState(() => _model
                                                              .isDataUploading_uploadToDB1 =
                                                          true);
                                                      var selectedUploadedFiles =
                                                          <FFUploadedFile>[];
                                                      var selectedMedia =
                                                          <SelectedFile>[];
                                                      var downloadUrls =
                                                          <String>[];
                                                      try {
                                                        selectedUploadedFiles = _model
                                                                .uploadedLocalFile_inMemImg1
                                                                .bytes!
                                                                .isNotEmpty
                                                            ? [
                                                                _model
                                                                    .uploadedLocalFile_inMemImg1
                                                              ]
                                                            : <FFUploadedFile>[];
                                                        selectedMedia =
                                                            selectedFilesFromUploadedFiles(
                                                          selectedUploadedFiles,
                                                          storageFolderPath:
                                                              'MessagesImg',
                                                        );
                                                        downloadUrls =
                                                            await uploadSupabaseStorageFiles(
                                                          bucketName: 'yekja',
                                                          selectedFiles:
                                                              selectedMedia,
                                                        );
                                                      } finally {
                                                        _model.isDataUploading_uploadToDB1 =
                                                            false;
                                                      }
                                                      if (selectedUploadedFiles
                                                                  .length ==
                                                              selectedMedia
                                                                  .length &&
                                                          downloadUrls.length ==
                                                              selectedMedia
                                                                  .length) {
                                                        safeSetState(() {
                                                          _model.uploadedLocalFile_uploadToDB1 =
                                                              selectedUploadedFiles
                                                                  .first;
                                                          _model.uploadedFileUrl_uploadToDB1 =
                                                              downloadUrls
                                                                  .first;
                                                        });
                                                      } else {
                                                        safeSetState(() {});
                                                        return;
                                                      }
                                                    }

                                                    _model.isImage = false;
                                                    safeSetState(() {});
                                                    _model.imgMessage =
                                                        await MessagesTable()
                                                            .insert({
                                                      'chat_id': widget.chatId,
                                                      'sent_by': currentUserUid,
                                                      'img_message': _model
                                                          .uploadedFileUrl_uploadToDB1,
                                                      'is_img': true,
                                                      'message_text': '',
                                                      'recipient':
                                                          widget.ownerID,
                                                      'post_owner_id':
                                                          widget.ownerID,
                                                      'post_customer_id':
                                                          widget.senderID,
                                                    });
                                                    _shouldSetState = true;
                                                    _model.isImage = false;
                                                    safeSetState(() {});
                                                  } else {
                                                    _model.message =
                                                        await MessagesTable()
                                                            .insert({
                                                      'chat_id': widget.chatId,
                                                      'sent_by': currentUserUid,
                                                      'message_text': _model
                                                          .textController.text,
                                                      'recipient':
                                                          widget.ownerID ==
                                                                  currentUserUid
                                                              ? widget.senderID
                                                              : widget.ownerID,
                                                      'post_owner_id':
                                                          widget.ownerID,
                                                      'post_customer_id':
                                                          widget.senderID,
                                                    });
                                                    _shouldSetState = true;
                                                    safeSetState(() {
                                                      _model.textController
                                                          ?.clear();
                                                    });

                                                    safeSetState(() {});
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  }

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 1.0)),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
