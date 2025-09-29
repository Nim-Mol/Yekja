import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/profile/review_and_rating/review_and_rating_widget.dart';
import '/shared_components/confirm_cancel_pop_up/confirm_cancel_pop_up_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
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
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        top: true,
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
                          ProfilePageWidget.routeName,
                          queryParameters: {
                            'profileId': serializeParam(
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
                              widget.ownerID == currentUserUid
                                  ? widget.senderAvatar
                                  : widget.ownerAvatar,
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
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
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
                              chatsListViewMessagesRowList[chatsListViewIndex];
                          return Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                if (chatsListViewMessagesRow.sentBy !=
                                    currentUserUid) {
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 8.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if ((chatsListViewMessagesRow.isImg ==
                                                false) &&
                                            (chatsListViewMessagesRow
                                                    .isReview ==
                                                false))
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 4.0),
                                              child: Container(
                                                constraints: BoxConstraints(
                                                  minWidth: 80.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF232426),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(16.0),
                                                    bottomRight:
                                                        Radius.circular(16.0),
                                                    topLeft:
                                                        Radius.circular(0.0),
                                                    topRight:
                                                        Radius.circular(16.0),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 8.0, 12.0, 8.0),
                                                  child: AutoSizeText(
                                                    valueOrDefault<String>(
                                                      chatsListViewMessagesRow
                                                          .messageText,
                                                      'Hellooo',
                                                    ),
                                                    textAlign: TextAlign.start,
                                                    maxLines: 10,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        if (chatsListViewMessagesRow.isImg)
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              chatsListViewMessagesRow
                                                  .imgMessage!,
                                              fit: BoxFit.cover,
                                              cacheWidth: 300,
                                              cacheHeight: 350,
                                            ),
                                          ),
                                        if (chatsListViewMessagesRow
                                                .createdAt ==
                                            _model.message?.createdAt)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Text(
                                              '${dateTimeFormat(
                                                "MMMEd",
                                                chatsListViewMessagesRow
                                                    .createdAt,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              )} at ${dateTimeFormat(
                                                "Hm",
                                                chatsListViewMessagesRow
                                                    .createdAt,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              )}',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumIsCustom,
                                                  ),
                                            ),
                                          ),
                                        if (((currentUserUid !=
                                                    chatsListViewMessagesRow
                                                        .sentBy) &&
                                                chatsListViewMessagesRow
                                                    .postOwnerReviewSent! &&
                                                !chatsListViewMessagesRow
                                                    .customerReviewSubmited!) ||
                                            ((currentUserUid !=
                                                    chatsListViewMessagesRow
                                                        .sentBy) &&
                                                chatsListViewMessagesRow
                                                    .customerReviewSent! &&
                                                !chatsListViewMessagesRow
                                                    .postOwnerReviewSubmited!))
                                          wrapWithModel(
                                            model: _model.reviewAndRatingModels
                                                .getModel(
                                              widget.chatId!.toString(),
                                              chatsListViewIndex,
                                            ),
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: ReviewAndRatingWidget(
                                              key: Key(
                                                'Keyut8_${widget.chatId!.toString()}',
                                              ),
                                              writerId: currentUserUid,
                                              postItemId: widget.postID!,
                                              writerName: FFAppState()
                                                  .userInfo
                                                  .userName,
                                              chatId: widget.chatId!,
                                              postOwnerId: widget.ownerID,
                                              recepientName:
                                                  valueOrDefault<String>(
                                                widget.ownerID ==
                                                        currentUserUid
                                                    ? widget.senderUserName
                                                    : widget.ownerUserName,
                                                'user name',
                                              ),
                                              recepientID:
                                                  valueOrDefault<String>(
                                                widget.ownerID ==
                                                        currentUserUid
                                                    ? widget.senderID
                                                    : widget.ownerID,
                                                'user name',
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  );
                                } else {
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if ((chatsListViewMessagesRow.isImg ==
                                                false) &&
                                            (chatsListViewMessagesRow
                                                    .isReview ==
                                                false))
                                          Stack(
                                            alignment:
                                                AlignmentDirectional(1.0, 1.0),
                                            children: [
                                              if (chatsListViewMessagesRow
                                                      .isImg ==
                                                  false)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
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
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 8.0, 8.0),
                                                  child: Icon(
                                                    Icons.done_all,
                                                    color: (chatsListViewMessagesRow
                                                                    .seen ==
                                                                true) ||
                                                            (chatsListViewMessagesRow
                                                                    .recipientOnline ==
                                                                true)
                                                        ? Color(0xFF40C057)
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    size: 14.0,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        if (chatsListViewMessagesRow.isImg ==
                                            false)
                                          Stack(
                                            alignment:
                                                AlignmentDirectional(1.0, 1.0),
                                            children: [
                                              if (chatsListViewMessagesRow
                                                      .isImg ==
                                                  false)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
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
                                            alignment:
                                                AlignmentDirectional(1.0, -1.0),
                                            child: Stack(
                                              alignment: AlignmentDirectional(
                                                  1.0, 1.0),
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 4.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      chatsListViewMessagesRow
                                                          .imgMessage!,
                                                      fit: BoxFit.cover,
                                                      alignment:
                                                          Alignment(1.0, -1.0),
                                                      cacheWidth: 300,
                                                      cacheHeight: 350,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 8.0, 8.0),
                                                  child: Icon(
                                                    Icons.done_all,
                                                    color: (chatsListViewMessagesRow
                                                                    .seen ==
                                                                true) ||
                                                            (chatsListViewMessagesRow
                                                                    .recipientOnline ==
                                                                true)
                                                        ? Color(0xFF40C057)
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    size: 14.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        if (chatsListViewMessagesRow.createdAt >
                                            chatsListViewMessagesRow.createdAt)
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 16.0),
                                              child: Text(
                                                '${dateTimeFormat(
                                                  "MMMEd",
                                                  chatsListViewMessagesRow
                                                      .createdAt,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                )} at ${dateTimeFormat(
                                                  "Hm",
                                                  chatsListViewMessagesRow
                                                      .createdAt,
                                                  locale: FFLocalizations.of(
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
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
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                  child: Container(
                    width: 145.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                    ),
                    child: Visibility(
                      visible: !functions.listContainsString(
                          FFAppState().userInfo.reviewedList.toList(),
                          widget.postID!),
                      child: Builder(
                        builder: (context) => Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
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
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: ConfirmCancelPopUpWidget(
                                      header: 'Send Review Request?',
                                      hintText:
                                          'Are you sure you want to ask this user for a review? They’ll be notified and can choose to respond',
                                      onConfirmAction: () async {
                                        if (functions.listContainsString(
                                            FFAppState()
                                                .userInfo
                                                .reviewedList
                                                .toList(),
                                            widget.postID!)) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'You have already made a review request for this post!',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                            ),
                                          );
                                        } else {
                                          await MessagesTable().insert({
                                            'is_review': true,
                                            'sentBy': currentUserUid,
                                            'chat_id': widget.chatId,
                                            'recipient': widget.ownerID ==
                                                    currentUserUid
                                                ? widget.senderID
                                                : widget.ownerID,
                                          });
                                          if (widget.ownerID ==
                                              currentUserUid) {
                                            await MessagesTable().update(
                                              data: {
                                                'post_owner_Review_sent': true,
                                              },
                                              matchingRows: (rows) => rows
                                                  .eqOrNull(
                                                    'sentBy',
                                                    widget.ownerID,
                                                  )
                                                  .eqOrNull(
                                                    'is_review',
                                                    true,
                                                  ),
                                            );
                                          } else {
                                            await MessagesTable().update(
                                              data: {
                                                'customer_Review_sent': true,
                                              },
                                              matchingRows: (rows) => rows
                                                  .eqOrNull(
                                                    'sentBy',
                                                    widget.senderID,
                                                  )
                                                  .eqOrNull(
                                                    'is_review',
                                                    true,
                                                  ),
                                            );
                                          }

                                          FFAppState().updateUserInfoStruct(
                                            (e) => e
                                              ..updateReviewedList(
                                                (e) => e.add(widget.postID!),
                                              ),
                                          );
                                          safeSetState(() {});
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Your review request was successfully sent.',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  Color(0x4340C057),
                                            ),
                                          );
                                          Navigator.pop(context);
                                          await UserExtTable().update(
                                            data: {
                                              'user_reviewed_ids': FFAppState()
                                                  .userInfo
                                                  .reviewedList,
                                            },
                                            matchingRows: (rows) =>
                                                rows.eqOrNull(
                                              'id',
                                              currentUserUid,
                                            ),
                                          );
                                          return;
                                        }
                                      },
                                      onCancelAction: () async {},
                                    ),
                                  );
                                },
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.grinStars,
                                  color: FlutterFlowTheme.of(context).yellow1,
                                  size: 24.0,
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'v838atpy' /*  Request a review */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 32.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 8.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.image_outlined,
                                color: FlutterFlowTheme.of(context).info,
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
                                            m.storagePath, context))) {
                                  safeSetState(() =>
                                      _model.isDataUploading_inMemImg = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];

                                  try {
                                    selectedUploadedFiles = selectedMedia
                                        .map((m) => FFUploadedFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                              height: m.dimensions?.height,
                                              width: m.dimensions?.width,
                                              blurHash: m.blurHash,
                                            ))
                                        .toList();
                                  } finally {
                                    _model.isDataUploading_inMemImg = false;
                                  }
                                  if (selectedUploadedFiles.length ==
                                      selectedMedia.length) {
                                    safeSetState(() {
                                      _model.uploadedLocalFile_inMemImg =
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
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Stack(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              children: [
                                TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: false,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'm04p2p42' /* Type here */,
                                    ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelMediumIsCustom,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFF5F5F5),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Satoshi',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primary,
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                                if (_model.isImage == true)
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Container(
                                        width: 70.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Stack(
                                          children: [
                                            if (_model.isImage == true)
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 8.0, 0.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.memory(
                                                      _model.uploadedLocalFile_inMemImg
                                                              .bytes ??
                                                          Uint8List.fromList(
                                                              []),
                                                      width: 40.0,
                                                      height: 40.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.isImage = false;
                                                  safeSetState(() {});
                                                },
                                                child: Icon(
                                                  Icons.close_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 15.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 5.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.send,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        var _shouldSetState = false;
                                        if (_model.isImage) {
                                          {
                                            safeSetState(() => _model
                                                    .isDataUploading_uploadToDB =
                                                true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];
                                            var selectedMedia =
                                                <SelectedFile>[];
                                            var downloadUrls = <String>[];
                                            try {
                                              selectedUploadedFiles = _model
                                                      .uploadedLocalFile_inMemImg
                                                      .bytes!
                                                      .isNotEmpty
                                                  ? [
                                                      _model
                                                          .uploadedLocalFile_inMemImg
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
                                                selectedFiles: selectedMedia,
                                              );
                                            } finally {
                                              _model.isDataUploading_uploadToDB =
                                                  false;
                                            }
                                            if (selectedUploadedFiles.length ==
                                                    selectedMedia.length &&
                                                downloadUrls.length ==
                                                    selectedMedia.length) {
                                              safeSetState(() {
                                                _model.uploadedLocalFile_uploadToDB =
                                                    selectedUploadedFiles.first;
                                                _model.uploadedFileUrl_uploadToDB =
                                                    downloadUrls.first;
                                              });
                                            } else {
                                              safeSetState(() {});
                                              return;
                                            }
                                          }

                                          _model.isImage = false;
                                          safeSetState(() {});
                                          _model.imgMessage =
                                              await MessagesTable().insert({
                                            'chat_id': widget.chatId,
                                            'sentBy': currentUserUid,
                                            'img_message': _model
                                                .uploadedFileUrl_uploadToDB,
                                            'is_img': true,
                                            'message_text': '',
                                            'recipient': widget.ownerID,
                                          });
                                          _shouldSetState = true;
                                          _model.isImage = false;
                                          safeSetState(() {});
                                        } else {
                                          _model.message =
                                              await MessagesTable().insert({
                                            'chat_id': widget.chatId,
                                            'sentBy': currentUserUid,
                                            'message_text':
                                                _model.textController.text,
                                            'recipient': widget.ownerID ==
                                                    currentUserUid
                                                ? widget.senderID
                                                : widget.ownerID,
                                          });
                                          _shouldSetState = true;
                                          safeSetState(() {
                                            _model.textController?.clear();
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
          ],
        ),
      ),
    );
  }
}
