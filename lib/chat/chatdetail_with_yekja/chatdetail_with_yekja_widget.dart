import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profile/review_and_rating/review_and_rating_widget.dart';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'chatdetail_with_yekja_model.dart';
export 'chatdetail_with_yekja_model.dart';

class ChatdetailWithYekjaWidget extends StatefulWidget {
  const ChatdetailWithYekjaWidget({
    super.key,
    required this.chatId,
    this.postID,
    required this.ownerUserName,
    required this.ownerID,
  });

  final int? chatId;
  final String? postID;
  final String? ownerUserName;
  final String? ownerID;

  static String routeName = 'chatdetailWithYekja';
  static String routePath = '/chatdetailWithYekja';

  @override
  State<ChatdetailWithYekjaWidget> createState() =>
      _ChatdetailWithYekjaWidgetState();
}

class _ChatdetailWithYekjaWidgetState extends State<ChatdetailWithYekjaWidget> {
  late ChatdetailWithYekjaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatdetailWithYekjaModel());

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
      await _model.chatsListViewScrollController?.animateTo(
        _model.chatsListViewScrollController!.position.maxScrollExtent,
        duration: Duration(milliseconds: 100),
        curve: Curves.ease,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<ViewUserReviewsRow>>(
      future: ViewUserReviewsTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'post_id',
          widget.postID,
        ),
        limit: 1,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitChasingDots(
                  color: FlutterFlowTheme.of(context).greenInit,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<ViewUserReviewsRow> chatdetailWithYekjaViewUserReviewsRowList =
            snapshot.data!;

        return Scaffold(
          key: scaffoldKey,
          resizeToAvoidBottomInset: false,
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
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
                              ClipRRect(
                                borderRadius: BorderRadius.circular(24.0),
                                child: Image.network(
                                  FFAppConstants.YekjaLogoChat,
                                  width: 50.0,
                                  height: 50.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  '8v33985q' /* Yekja team */,
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: StreamBuilder<List<MessagesRow>>(
                            stream: _model.chatsListViewSupabaseStream ??=
                                SupaFlow.client
                                    .from("messages")
                                    .stream(primaryKey: ['id'])
                                    .eqOrNull(
                                      'chat_id',
                                      widget.chatId,
                                    )
                                    .order('created_at', ascending: true)
                                    .map((list) => list
                                        .map((item) => MessagesRow(item))
                                        .toList()),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: SpinKitChasingDots(
                                      color: FlutterFlowTheme.of(context)
                                          .greenInit,
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
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 8.0, 12.0, 0.0),
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      16.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          16.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              topRight: Radius
                                                                  .circular(
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
                                                                  TextAlign
                                                                      .start,
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
                                                    ),
                                                  if (chatsListViewMessagesRow
                                                      .isImg)
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, -1.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          chatsListViewMessagesRow
                                                              .imgMessage!,
                                                          fit: BoxFit.cover,
                                                          cacheWidth: 300,
                                                          cacheHeight: 350,
                                                        ),
                                                      ),
                                                    ),
                                                  if (chatsListViewMessagesRow
                                                          .isReview &&
                                                      (!(chatdetailWithYekjaViewUserReviewsRowList
                                                              .isNotEmpty) ||
                                                          ((widget.ownerID ==
                                                                  currentUserUid) &&
                                                              !chatdetailWithYekjaViewUserReviewsRowList
                                                                  .firstOrNull!
                                                                  .ownerSubmitted!) ||
                                                          ((widget.ownerID !=
                                                                  currentUserUid) &&
                                                              !chatdetailWithYekjaViewUserReviewsRowList
                                                                  .firstOrNull!
                                                                  .customerSubmitted!)))
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  16.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .reviewAndRatingModels
                                                            .getModel(
                                                          widget.chatId!
                                                              .toString(),
                                                          chatsListViewIndex,
                                                        ),
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child:
                                                            ReviewAndRatingWidget(
                                                          key: Key(
                                                            'Keyasr_${widget.chatId!.toString()}',
                                                          ),
                                                          writerId:
                                                              currentUserUid,
                                                          postItemId:
                                                              widget.postID!,
                                                          writerName:
                                                              FFAppState()
                                                                  .userInfo
                                                                  .userName,
                                                          chatId:
                                                              widget.chatId!,
                                                          postOwnerId:
                                                              widget.ownerID,
                                                          postCustomerID:
                                                              chatsListViewMessagesRow
                                                                  .postCustomerId!,
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          );
                                        } else {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 8.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [],
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  );
                                },
                                controller:
                                    _model.chatsListViewScrollController,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
