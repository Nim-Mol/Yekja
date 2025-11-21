import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'comunication_bar_model.dart';
export 'comunication_bar_model.dart';

class ComunicationBarWidget extends StatefulWidget {
  const ComunicationBarWidget({
    super.key,
    required this.recipient,
    required this.postTitle,
    required this.postId,
    bool? allowMessage,
    bool? allowCall,
    required this.allowShare,
  })  : this.allowMessage = allowMessage ?? true,
        this.allowCall = allowCall ?? true;

  final String? recipient;
  final String? postTitle;
  final String? postId;
  final bool allowMessage;
  final bool allowCall;
  final bool? allowShare;

  @override
  State<ComunicationBarWidget> createState() => _ComunicationBarWidgetState();
}

class _ComunicationBarWidgetState extends State<ComunicationBarWidget>
    with TickerProviderStateMixin {
  late ComunicationBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComunicationBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: SafeArea(
        child: ClipRRect(
          child: Container(
            width: double.infinity,
            height: 80.0,
            constraints: BoxConstraints(
              maxHeight: double.infinity,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Color(0x33000000),
                  offset: Offset(
                    0.0,
                    2.0,
                  ),
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: FFButtonWidget(
                      onPressed: (!widget.allowMessage ||
                              (currentUserUid == ''))
                          ? null
                          : () async {
                              var _shouldSetState = false;
                              _model.chatExist =
                                  await ViewUserChatsTable().queryRows(
                                queryFn: (q) => q
                                    .eqOrNull(
                                      'chat_sender',
                                      currentUserUid,
                                    )
                                    .eqOrNull(
                                      'chat_post_id',
                                      widget.postId,
                                    ),
                              );
                              _shouldSetState = true;
                              if (_model.chatExist != null &&
                                  (_model.chatExist)!.isNotEmpty) {
                                if ((_model.chatExist?.firstOrNull
                                            ?.senderDeletedAt !=
                                        null) ||
                                    (_model.chatExist?.firstOrNull
                                            ?.recipientDeletedAt !=
                                        null)) {
                                  await ChatsTable().update(
                                    data: {
                                      'sender_deleted_at':
                                          supaSerialize<DateTime>(null),
                                      'recipient_deleted_at':
                                          supaSerialize<DateTime>(null),
                                    },
                                    matchingRows: (rows) => rows
                                        .eqOrNull(
                                          'id',
                                          _model.chatExist?.firstOrNull?.chatId,
                                        )
                                        .eqOrNull(
                                          'sender',
                                          currentUserUid,
                                        ),
                                  );
                                  _shouldSetState = true;

                                  context.pushNamed(
                                    ChatdetailWidget.routeName,
                                    queryParameters: {
                                      'chatId': serializeParam(
                                        _model.chatExist?.firstOrNull?.chatId,
                                        ParamType.int,
                                      ),
                                      'ownerID': serializeParam(
                                        _model.chatExist?.firstOrNull
                                            ?.postOwnerId,
                                        ParamType.String,
                                      ),
                                      'postID': serializeParam(
                                        _model
                                            .chatExist?.firstOrNull?.chatPostId,
                                        ParamType.String,
                                      ),
                                      'ownerUserName': serializeParam(
                                        _model.chatExist?.firstOrNull
                                            ?.ownerUsername,
                                        ParamType.String,
                                      ),
                                      'ownerAvatar': serializeParam(
                                        _model.chatExist?.firstOrNull
                                            ?.ownerAvatar,
                                        ParamType.String,
                                      ),
                                      'senderID': serializeParam(
                                        _model
                                            .chatExist?.firstOrNull?.chatSender,
                                        ParamType.String,
                                      ),
                                      'senderUserName': serializeParam(
                                        _model.chatExist?.firstOrNull
                                            ?.chatSendername,
                                        ParamType.String,
                                      ),
                                      'senderAvatar': serializeParam(
                                        _model.chatExist?.firstOrNull
                                            ?.senderAvatar,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                } else {
                                  context.pushNamed(
                                    ChatdetailWidget.routeName,
                                    queryParameters: {
                                      'chatId': serializeParam(
                                        _model.chatExist?.firstOrNull?.chatId,
                                        ParamType.int,
                                      ),
                                      'ownerID': serializeParam(
                                        _model.chatExist?.firstOrNull
                                            ?.postOwnerId,
                                        ParamType.String,
                                      ),
                                      'postID': serializeParam(
                                        _model
                                            .chatExist?.firstOrNull?.chatPostId,
                                        ParamType.String,
                                      ),
                                      'ownerUserName': serializeParam(
                                        _model.chatExist?.firstOrNull
                                            ?.ownerUsername,
                                        ParamType.String,
                                      ),
                                      'ownerAvatar': serializeParam(
                                        _model.chatExist?.firstOrNull
                                            ?.ownerAvatar,
                                        ParamType.String,
                                      ),
                                      'senderID': serializeParam(
                                        _model
                                            .chatExist?.firstOrNull?.chatSender,
                                        ParamType.String,
                                      ),
                                      'senderUserName': serializeParam(
                                        _model.chatExist?.firstOrNull
                                            ?.chatSendername,
                                        ParamType.String,
                                      ),
                                      'senderAvatar': serializeParam(
                                        _model.chatExist?.firstOrNull
                                            ?.senderAvatar,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                }

                                if (_shouldSetState) safeSetState(() {});
                                return;
                              } else {
                                if (widget.recipient != currentUserUid) {
                                  _model.chat = await ChatsTable().insert({
                                    'sender': currentUserUid,
                                    'recipient': widget.recipient,
                                    'post_id': widget.postId,
                                    'sender_name':
                                        FFAppState().userInfo.userName,
                                  });
                                  _shouldSetState = true;
                                  await Future.delayed(
                                    Duration(
                                      milliseconds: 2000,
                                    ),
                                  );
                                  _model.chatCreated =
                                      await ViewUserChatsTable().queryRows(
                                    queryFn: (q) => q
                                        .eqOrNull(
                                          'chat_sender',
                                          currentUserUid,
                                        )
                                        .eqOrNull(
                                          'chat_post_id',
                                          widget.postId,
                                        ),
                                  );
                                  _shouldSetState = true;

                                  context.pushNamed(
                                    ChatdetailWidget.routeName,
                                    queryParameters: {
                                      'chatId': serializeParam(
                                        _model.chatCreated?.firstOrNull?.chatId,
                                        ParamType.int,
                                      ),
                                      'ownerID': serializeParam(
                                        _model.chatCreated?.firstOrNull
                                            ?.chatRecipient,
                                        ParamType.String,
                                      ),
                                      'postID': serializeParam(
                                        _model.chatCreated?.firstOrNull
                                            ?.chatPostId,
                                        ParamType.String,
                                      ),
                                      'ownerUserName': serializeParam(
                                        _model.chatCreated?.firstOrNull
                                            ?.ownerUsername,
                                        ParamType.String,
                                      ),
                                      'ownerAvatar': serializeParam(
                                        _model.chatCreated?.firstOrNull
                                            ?.ownerAvatar,
                                        ParamType.String,
                                      ),
                                      'senderID': serializeParam(
                                        _model.chatCreated?.firstOrNull
                                            ?.chatSender,
                                        ParamType.String,
                                      ),
                                      'senderUserName': serializeParam(
                                        _model.chatCreated?.firstOrNull
                                            ?.chatSendername,
                                        ParamType.String,
                                      ),
                                      'senderAvatar': serializeParam(
                                        _model.chatCreated?.firstOrNull
                                            ?.senderAvatar,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );

                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                } else {
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              }

                              if (_shouldSetState) safeSetState(() {});
                            },
                      text: FFLocalizations.of(context).getText(
                        'kign2ryz' /*  */,
                      ),
                      icon: Icon(
                        Icons.chat_bubble,
                        size: 18.0,
                      ),
                      options: FFButtonOptions(
                        width: 50.0,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).greenInit,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.outfit(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(50.0),
                        disabledColor:
                            FlutterFlowTheme.of(context).lighterSecBackground,
                        disabledTextColor:
                            FlutterFlowTheme.of(context).bordergray,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: FFButtonWidget(
                      onPressed: (!widget.allowCall ||
                              (currentUserUid == ''))
                          ? null
                          : () {
                              print('Button pressed ...');
                            },
                      text: FFLocalizations.of(context).getText(
                        'cehxi79j' /*  */,
                      ),
                      icon: Icon(
                        Icons.call,
                        size: 20.0,
                      ),
                      options: FFButtonOptions(
                        width: 50.0,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconAlignment: IconAlignment.start,
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).greenInit,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.outfit(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(50.0),
                        disabledColor:
                            FlutterFlowTheme.of(context).lighterSecBackground,
                        disabledTextColor:
                            FlutterFlowTheme.of(context).bordergray,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Builder(
                      builder: (context) => FFButtonWidget(
                        onPressed: (!widget.allowShare! ||
                                (currentUserUid == ''))
                            ? null
                            : () async {
                                await Share.share(
                                  'yekja://yekja.nl${GoRouterState.of(context).uri.toString()}',
                                  sharePositionOrigin:
                                      getWidgetBoundingBox(context),
                                );
                              },
                        text: FFLocalizations.of(context).getText(
                          '8f99d8cs' /*  */,
                        ),
                        icon: Icon(
                          Icons.share,
                          size: 20.0,
                        ),
                        options: FFButtonOptions(
                          width: 50.0,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              4.0, 0.0, 0.0, 1.0),
                          color: FlutterFlowTheme.of(context).greenInit,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.outfit(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(50.0),
                          disabledColor:
                              FlutterFlowTheme.of(context).lighterSecBackground,
                          disabledTextColor:
                              FlutterFlowTheme.of(context).bordergray,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
