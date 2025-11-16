import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/shared_components/confirm_cancel_pop_up/confirm_cancel_pop_up_widget.dart';
import '/shared_components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'chat_page_model.dart';
export 'chat_page_model.dart';

class ChatPageWidget extends StatefulWidget {
  const ChatPageWidget({
    super.key,
    required this.profileid,
  });

  final String? profileid;

  static String routeName = 'ChatPage';
  static String routePath = '/chatPage';

  @override
  State<ChatPageWidget> createState() => _ChatPageWidgetState();
}

class _ChatPageWidgetState extends State<ChatPageWidget> {
  late ChatPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ViewUserChatsVisibleRow>>(
      future: (_model.requestCompleter ??=
              Completer<List<ViewUserChatsVisibleRow>>()
                ..complete(ViewUserChatsVisibleTable().queryRows(
                  queryFn: (q) => q
                      .or("chat_sender.eq.${currentUserUid}, chat_recipient.eq.${currentUserUid}")
                      .order('unseen_count')
                      .order('chat_created_at'),
                )))
          .future,
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
        List<ViewUserChatsVisibleRow> chatPageViewUserChatsVisibleRowList =
            snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
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
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'au6wzutq' /* Chats */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleLargeFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .titleLargeIsCustom,
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                                ContactYEKJAWidget.routeName);
                                          },
                                          child: Container(
                                            width: 35.0,
                                            height: 35.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: FaIcon(
                                                FontAwesomeIcons.questionCircle,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 22.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
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
                                                widget.profileid,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Container(
                                          width: 35.0,
                                          height: 35.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .greenInit,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.person,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 6.0)),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).darkgray,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.filterChoice = 'All';
                                    safeSetState(() {});
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: _model.filterChoice == 'All'
                                          ? FlutterFlowTheme.of(context)
                                              .greenInit
                                          : FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      borderRadius: BorderRadius.circular(4.0),
                                      border: Border.all(
                                        color: _model.filterChoice == 'All'
                                            ? FlutterFlowTheme.of(context)
                                                .greenInit
                                            : FlutterFlowTheme.of(context)
                                                .bordergray,
                                        width: 0.3,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 2.0, 10.0, 2.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '4nojqmye' /* All */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color: _model.filterChoice ==
                                                      'All'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryText
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.filterChoice = 'My Posts';
                                    safeSetState(() {});
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: _model.filterChoice == 'My Posts'
                                          ? FlutterFlowTheme.of(context)
                                              .greenInit
                                          : FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      borderRadius: BorderRadius.circular(4.0),
                                      border: Border.all(
                                        color: _model.filterChoice == 'My Posts'
                                            ? FlutterFlowTheme.of(context)
                                                .greenInit
                                            : FlutterFlowTheme.of(context)
                                                .bordergray,
                                        width: 0.3,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 2.0, 10.0, 2.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'e248wdxf' /* My Posts */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color: _model.filterChoice ==
                                                      'My Posts'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryText
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.filterChoice = 'Other\'s Posts';
                                    safeSetState(() {});
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: _model.filterChoice ==
                                              'Other\'s Posts'
                                          ? FlutterFlowTheme.of(context)
                                              .greenInit
                                          : FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      borderRadius: BorderRadius.circular(4.0),
                                      border: Border.all(
                                        color: _model.filterChoice ==
                                                'Other\'s Posts'
                                            ? FlutterFlowTheme.of(context)
                                                .greenInit
                                            : FlutterFlowTheme.of(context)
                                                .bordergray,
                                        width: 0.3,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 2.0, 10.0, 2.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'pspduh98' /* Other's Posts */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color: _model
                                                          .filterChoice ==
                                                      'Other\'s Posts'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryText
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.filterChoice = 'Yekja';
                                    safeSetState(() {});
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: _model.filterChoice == 'Yekja'
                                          ? FlutterFlowTheme.of(context)
                                              .greenInit
                                          : FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      borderRadius: BorderRadius.circular(4.0),
                                      border: Border.all(
                                        color: _model.filterChoice == 'Yekja'
                                            ? FlutterFlowTheme.of(context)
                                                .greenInit
                                            : FlutterFlowTheme.of(context)
                                                .bordergray,
                                        width: 0.3,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 2.0, 10.0, 2.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '9bsrpmk4' /* Yekja */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color: _model.filterChoice ==
                                                      'Yekja'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryText
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 10.0)),
                            ),
                            Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).darkgray,
                            ),
                            if (_model.filterChoice == 'All')
                              Builder(
                                builder: (context) {
                                  final chatview =
                                      chatPageViewUserChatsVisibleRowList
                                          .where((e) =>
                                              e.chatSender !=
                                              FFAppConstants.YekjaAdminID)
                                          .toList();

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: chatview.length,
                                    itemBuilder: (context, chatviewIndex) {
                                      final chatviewItem =
                                          chatview[chatviewIndex];
                                      return Builder(
                                        builder: (context) => Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 13.5, 16.0, 13.5),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                ChatdetailWidget.routeName,
                                                queryParameters: {
                                                  'chatId': serializeParam(
                                                    chatviewItem.chatId,
                                                    ParamType.int,
                                                  ),
                                                  'ownerID': serializeParam(
                                                    chatviewItem.postOwnerId,
                                                    ParamType.String,
                                                  ),
                                                  'postID': serializeParam(
                                                    chatviewItem.chatPostId,
                                                    ParamType.String,
                                                  ),
                                                  'ownerUserName':
                                                      serializeParam(
                                                    chatviewItem.ownerUsername,
                                                    ParamType.String,
                                                  ),
                                                  'ownerAvatar': serializeParam(
                                                    chatviewItem.ownerAvatar,
                                                    ParamType.String,
                                                  ),
                                                  'senderID': serializeParam(
                                                    chatviewItem.chatSender,
                                                    ParamType.String,
                                                  ),
                                                  'senderUserName':
                                                      serializeParam(
                                                    chatviewItem.chatSendername,
                                                    ParamType.String,
                                                  ),
                                                  'senderAvatar':
                                                      serializeParam(
                                                    chatviewItem.senderAvatar,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            onLongPress: () async {
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child:
                                                          ConfirmCancelPopUpWidget(
                                                        header:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'i9836zr0' /* Delete chat */,
                                                        ),
                                                        hintText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'n958loab' /* Press confirm if you intend to... */,
                                                        ),
                                                        cancelText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '46z72kp3' /* Cancel */,
                                                        ),
                                                        confirmText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'lkl0kp7h' /* Confirm */,
                                                        ),
                                                        onConfirmAction:
                                                            () async {
                                                          if (currentUserUid ==
                                                              chatviewItem
                                                                  .chatSender) {
                                                            await ChatsTable()
                                                                .update(
                                                              data: {
                                                                'sender_deleted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eqOrNull(
                                                                        'id',
                                                                        chatviewItem
                                                                            .chatId,
                                                                      )
                                                                      .eqOrNull(
                                                                        'sender',
                                                                        chatviewItem
                                                                            .chatSender,
                                                                      ),
                                                            );
                                                          } else {
                                                            await ChatsTable()
                                                                .update(
                                                              data: {
                                                                'recipient_deleted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eqOrNull(
                                                                        'id',
                                                                        chatviewItem
                                                                            .chatId,
                                                                      )
                                                                      .eqOrNull(
                                                                        'recipient',
                                                                        chatviewItem
                                                                            .chatRecipient,
                                                                      ),
                                                            );
                                                          }

                                                          safeSetState(() =>
                                                              _model.requestCompleter =
                                                                  null);
                                                          await _model
                                                              .waitForRequestCompleted();
                                                        },
                                                        onCancelAction:
                                                            () async {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth: 60.0,
                                                    maxHeight: 60.0,
                                                  ),
                                                  decoration: BoxDecoration(),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Stack(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          child: Image.network(
                                                            chatviewItem
                                                                    .deletedPost!
                                                                ? FFAppConstants
                                                                    .PostNotAvailableIMG
                                                                : valueOrDefault<
                                                                    String>(
                                                                    chatviewItem
                                                                        .postImage,
                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/uhwqu36njkuw/default_post_image.jpg',
                                                                  ),
                                                            width: 55.0,
                                                            height: 55.0,
                                                            fit: BoxFit.cover,
                                                            alignment:
                                                                Alignment(
                                                                    0.0, 0.0),
                                                          ),
                                                        ),
                                                        if (functions
                                                            .isPresentAndPositive(
                                                                chatviewItem
                                                                    .unseenCount))
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.0, 1.0),
                                                            child: badges.Badge(
                                                              badgeContent:
                                                                  Text(
                                                                chatviewItem
                                                                    .unseenCount!
                                                                    .toString(),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodySmallIsCustom,
                                                                    ),
                                                              ),
                                                              showBadge: true,
                                                              shape: badges
                                                                  .BadgeShape
                                                                  .circle,
                                                              badgeColor: Color(
                                                                  0xFFED232B),
                                                              elevation: 0.0,
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5.0),
                                                              position: badges
                                                                      .BadgePosition
                                                                  .topEnd(),
                                                              animationType: badges
                                                                  .BadgeAnimationType
                                                                  .scale,
                                                              toAnimate: true,
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              chatviewItem
                                                                  .postTitle,
                                                              'This post is no longer available!',
                                                            ),
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Satoshi',
                                                                  color: chatviewItem
                                                                              .unseenCount! >
                                                                          0
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary
                                                                      : Color(
                                                                          0xFFBFBBBB),
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 4.0)),
                                                      ),
                                                      if (!functions
                                                          .isNullSingleString(
                                                              chatviewItem
                                                                  .unseenCount
                                                                  ?.toString()))
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              '${valueOrDefault<String>(
                                                                chatviewItem
                                                                    .lastMessagePrefix,
                                                                'from',
                                                              )}: ',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Satoshi',
                                                                    color: chatviewItem.unseenCount! >
                                                                            0
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primary
                                                                        : Color(
                                                                            0xFFBFBBBB),
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                            Flexible(
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  chatviewItem
                                                                      .lastMessageText,
                                                                  'Image',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                maxLines: 2,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Satoshi',
                                                                      color: chatviewItem.unseenCount! > 0
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .secondaryText
                                                                          : FlutterFlowTheme.of(context)
                                                                              .bordergray,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w200,
                                                                    ),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Text(
                                                    dateTimeFormat(
                                                      "MEd",
                                                      chatviewItem
                                                          .chatCreatedAt!,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    textAlign:
                                                        TextAlign.justify,
                                                    maxLines: 1,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: chatviewItem
                                                                      .unseenCount! >
                                                                  0
                                                              ? Color(
                                                                  0xFF17C995)
                                                              : Color(
                                                                  0xFFBFBBBB),
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            if (_model.filterChoice == 'My Posts')
                              Builder(
                                builder: (context) {
                                  final chatview =
                                      chatPageViewUserChatsVisibleRowList
                                          .where((e) =>
                                              (e.postOwnerId ==
                                                  widget.profileid) &&
                                              (e.chatSender !=
                                                  FFAppConstants.YekjaAdminID))
                                          .toList();

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: chatview.length,
                                    itemBuilder: (context, chatviewIndex) {
                                      final chatviewItem =
                                          chatview[chatviewIndex];
                                      return Builder(
                                        builder: (context) => Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 13.5, 16.0, 13.5),
                                          child: GestureDetector(
                                            onTap: () async {
                                              context.pushNamed(
                                                ChatdetailWidget.routeName,
                                                queryParameters: {
                                                  'chatId': serializeParam(
                                                    chatviewItem.chatId,
                                                    ParamType.int,
                                                  ),
                                                  'ownerID': serializeParam(
                                                    chatviewItem.postOwnerId,
                                                    ParamType.String,
                                                  ),
                                                  'postID': serializeParam(
                                                    chatviewItem.chatPostId,
                                                    ParamType.String,
                                                  ),
                                                  'ownerUserName':
                                                      serializeParam(
                                                    chatviewItem.ownerUsername,
                                                    ParamType.String,
                                                  ),
                                                  'ownerAvatar': serializeParam(
                                                    chatviewItem.ownerAvatar,
                                                    ParamType.String,
                                                  ),
                                                  'senderID': serializeParam(
                                                    chatviewItem.chatSender,
                                                    ParamType.String,
                                                  ),
                                                  'senderUserName':
                                                      serializeParam(
                                                    chatviewItem.chatSendername,
                                                    ParamType.String,
                                                  ),
                                                  'senderAvatar':
                                                      serializeParam(
                                                    chatviewItem.senderAvatar,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            onForcePressStart: (details) async {
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child:
                                                          ConfirmCancelPopUpWidget(
                                                        header: 'Delete chat',
                                                        hintText:
                                                            'Press confirm if you intend to delete this chat.',
                                                        cancelText: 'Cancel',
                                                        confirmText: 'Confirm',
                                                        onConfirmAction:
                                                            () async {
                                                          if (currentUserUid ==
                                                              chatviewItem
                                                                  .chatSender) {
                                                            await ChatsTable()
                                                                .update(
                                                              data: {
                                                                'sender_deleted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eqOrNull(
                                                                        'id',
                                                                        chatviewItem
                                                                            .chatId,
                                                                      )
                                                                      .eqOrNull(
                                                                        'sender',
                                                                        chatviewItem
                                                                            .chatSender,
                                                                      ),
                                                            );
                                                          } else {
                                                            await ChatsTable()
                                                                .update(
                                                              data: {
                                                                'recipient_deleted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eqOrNull(
                                                                        'id',
                                                                        chatviewItem
                                                                            .chatId,
                                                                      )
                                                                      .eqOrNull(
                                                                        'recipient',
                                                                        chatviewItem
                                                                            .chatRecipient,
                                                                      ),
                                                            );
                                                          }

                                                          safeSetState(() =>
                                                              _model.requestCompleter =
                                                                  null);
                                                          await _model
                                                              .waitForRequestCompleted();
                                                        },
                                                        onCancelAction:
                                                            () async {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth: 60.0,
                                                    maxHeight: 60.0,
                                                  ),
                                                  decoration: BoxDecoration(),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Stack(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          child: Image.network(
                                                            chatviewItem
                                                                    .deletedPost!
                                                                ? FFAppConstants
                                                                    .PostNotAvailableIMG
                                                                : valueOrDefault<
                                                                    String>(
                                                                    chatviewItem
                                                                        .postImage,
                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/uhwqu36njkuw/default_post_image.jpg',
                                                                  ),
                                                            width: 55.0,
                                                            height: 55.0,
                                                            fit: BoxFit.cover,
                                                            alignment:
                                                                Alignment(
                                                                    0.0, 0.0),
                                                          ),
                                                        ),
                                                        if (functions
                                                            .isPresentAndPositive(
                                                                chatviewItem
                                                                    .unseenCount))
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.0, 1.0),
                                                            child: badges.Badge(
                                                              badgeContent:
                                                                  Text(
                                                                chatviewItem
                                                                    .unseenCount!
                                                                    .toString(),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodySmallIsCustom,
                                                                    ),
                                                              ),
                                                              showBadge: true,
                                                              shape: badges
                                                                  .BadgeShape
                                                                  .circle,
                                                              badgeColor: Color(
                                                                  0xFFED232B),
                                                              elevation: 0.0,
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5.0),
                                                              position: badges
                                                                      .BadgePosition
                                                                  .topEnd(),
                                                              animationType: badges
                                                                  .BadgeAnimationType
                                                                  .scale,
                                                              toAnimate: true,
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              chatviewItem
                                                                  .postTitle,
                                                              'This post is no longer available!',
                                                            ),
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Satoshi',
                                                                  color: chatviewItem
                                                                              .unseenCount! >
                                                                          0
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary
                                                                      : Color(
                                                                          0xFFBFBBBB),
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 4.0)),
                                                      ),
                                                      if (!functions
                                                          .isNullSingleString(
                                                              chatviewItem
                                                                  .unseenCount
                                                                  ?.toString()))
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              '${valueOrDefault<String>(
                                                                chatviewItem
                                                                    .lastMessagePrefix,
                                                                'from',
                                                              )}: ',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Satoshi',
                                                                    color: chatviewItem.unseenCount! >
                                                                            0
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primary
                                                                        : Color(
                                                                            0xFFBFBBBB),
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                            Flexible(
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  chatviewItem
                                                                      .lastMessageText,
                                                                  'chat opened',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                maxLines: 2,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Satoshi',
                                                                      color: chatviewItem.unseenCount! > 0
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .secondaryText
                                                                          : FlutterFlowTheme.of(context)
                                                                              .bordergray,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w200,
                                                                    ),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Text(
                                                    dateTimeFormat(
                                                      "MEd",
                                                      chatviewItem
                                                          .chatCreatedAt!,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    textAlign:
                                                        TextAlign.justify,
                                                    maxLines: 1,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: chatviewItem
                                                                      .unseenCount! >
                                                                  0
                                                              ? Color(
                                                                  0xFF17C995)
                                                              : Color(
                                                                  0xFFBFBBBB),
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            if (_model.filterChoice == 'Other\'s Posts')
                              Builder(
                                builder: (context) {
                                  final chatview =
                                      chatPageViewUserChatsVisibleRowList
                                          .where((e) =>
                                              (e.postOwnerId !=
                                                  widget.profileid) &&
                                              (e.chatSender !=
                                                  FFAppConstants.YekjaAdminID))
                                          .toList();

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: chatview.length,
                                    itemBuilder: (context, chatviewIndex) {
                                      final chatviewItem =
                                          chatview[chatviewIndex];
                                      return Builder(
                                        builder: (context) => Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 13.5, 16.0, 13.5),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                ChatdetailWidget.routeName,
                                                queryParameters: {
                                                  'chatId': serializeParam(
                                                    chatviewItem.chatId,
                                                    ParamType.int,
                                                  ),
                                                  'ownerID': serializeParam(
                                                    chatviewItem.postOwnerId,
                                                    ParamType.String,
                                                  ),
                                                  'postID': serializeParam(
                                                    chatviewItem.chatPostId,
                                                    ParamType.String,
                                                  ),
                                                  'ownerUserName':
                                                      serializeParam(
                                                    chatviewItem.ownerUsername,
                                                    ParamType.String,
                                                  ),
                                                  'ownerAvatar': serializeParam(
                                                    chatviewItem.ownerAvatar,
                                                    ParamType.String,
                                                  ),
                                                  'senderID': serializeParam(
                                                    chatviewItem.chatSender,
                                                    ParamType.String,
                                                  ),
                                                  'senderUserName':
                                                      serializeParam(
                                                    chatviewItem.chatSendername,
                                                    ParamType.String,
                                                  ),
                                                  'senderAvatar':
                                                      serializeParam(
                                                    chatviewItem.senderAvatar,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            onLongPress: () async {
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child:
                                                          ConfirmCancelPopUpWidget(
                                                        header: 'Delete chat',
                                                        hintText:
                                                            'Press confirm if you intend to delete this chat.',
                                                        cancelText: 'Cancel',
                                                        confirmText: 'Confirm',
                                                        onConfirmAction:
                                                            () async {
                                                          if (currentUserUid ==
                                                              chatviewItem
                                                                  .chatSender) {
                                                            await ChatsTable()
                                                                .update(
                                                              data: {
                                                                'sender_deleted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eqOrNull(
                                                                        'id',
                                                                        chatviewItem
                                                                            .chatId,
                                                                      )
                                                                      .eqOrNull(
                                                                        'sender',
                                                                        chatviewItem
                                                                            .chatSender,
                                                                      ),
                                                            );
                                                          } else {
                                                            await ChatsTable()
                                                                .update(
                                                              data: {
                                                                'recipient_deleted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eqOrNull(
                                                                        'id',
                                                                        chatviewItem
                                                                            .chatId,
                                                                      )
                                                                      .eqOrNull(
                                                                        'recipient',
                                                                        chatviewItem
                                                                            .chatRecipient,
                                                                      ),
                                                            );
                                                          }

                                                          safeSetState(() =>
                                                              _model.requestCompleter =
                                                                  null);
                                                          await _model
                                                              .waitForRequestCompleted();
                                                        },
                                                        onCancelAction:
                                                            () async {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth: 60.0,
                                                    maxHeight: 60.0,
                                                  ),
                                                  decoration: BoxDecoration(),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Stack(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          child: Image.network(
                                                            chatviewItem
                                                                    .deletedPost!
                                                                ? FFAppConstants
                                                                    .PostNotAvailableIMG
                                                                : valueOrDefault<
                                                                    String>(
                                                                    chatviewItem
                                                                        .postImage,
                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/uhwqu36njkuw/default_post_image.jpg',
                                                                  ),
                                                            width: 55.0,
                                                            height: 55.0,
                                                            fit: BoxFit.cover,
                                                            alignment:
                                                                Alignment(
                                                                    0.0, 0.0),
                                                          ),
                                                        ),
                                                        if (functions
                                                            .isPresentAndPositive(
                                                                chatviewItem
                                                                    .unseenCount))
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.0, 1.0),
                                                            child: badges.Badge(
                                                              badgeContent:
                                                                  Text(
                                                                chatviewItem
                                                                    .unseenCount!
                                                                    .toString(),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodySmallIsCustom,
                                                                    ),
                                                              ),
                                                              showBadge: true,
                                                              shape: badges
                                                                  .BadgeShape
                                                                  .circle,
                                                              badgeColor: Color(
                                                                  0xFFED232B),
                                                              elevation: 0.0,
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5.0),
                                                              position: badges
                                                                      .BadgePosition
                                                                  .topEnd(),
                                                              animationType: badges
                                                                  .BadgeAnimationType
                                                                  .scale,
                                                              toAnimate: true,
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              chatviewItem
                                                                  .postTitle,
                                                              'This post is no longer available.',
                                                            ),
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Satoshi',
                                                                  color: chatviewItem
                                                                              .unseenCount! >
                                                                          0
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary
                                                                      : Color(
                                                                          0xFFBFBBBB),
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 4.0)),
                                                      ),
                                                      if (!functions
                                                          .isNullSingleString(
                                                              chatviewItem
                                                                  .unseenCount
                                                                  ?.toString()))
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              '${chatviewItem.lastMessagePrefix}: ',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Satoshi',
                                                                    color: chatviewItem.unseenCount! >
                                                                            0
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primary
                                                                        : Color(
                                                                            0xFFBFBBBB),
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                            Flexible(
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  chatviewItem
                                                                      .lastMessageText,
                                                                  'Image',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                maxLines: 2,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Satoshi',
                                                                      color: chatviewItem.unseenCount! > 0
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .secondaryText
                                                                          : FlutterFlowTheme.of(context)
                                                                              .bordergray,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w200,
                                                                    ),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Text(
                                                    dateTimeFormat(
                                                      "MEd",
                                                      chatviewItem
                                                          .chatCreatedAt!,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    textAlign:
                                                        TextAlign.justify,
                                                    maxLines: 1,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: chatviewItem
                                                                      .unseenCount! >
                                                                  0
                                                              ? Color(
                                                                  0xFF17C995)
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            if ((_model.filterChoice == 'Yekja') ||
                                (_model.filterChoice == 'All'))
                              Builder(
                                builder: (context) {
                                  final chatview =
                                      chatPageViewUserChatsVisibleRowList
                                          .where((e) =>
                                              e.chatSender ==
                                              FFAppConstants.YekjaAdminID)
                                          .toList();

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: chatview.length,
                                    itemBuilder: (context, chatviewIndex) {
                                      final chatviewItem =
                                          chatview[chatviewIndex];
                                      return Builder(
                                        builder: (context) => Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 13.5, 16.0, 13.5),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                ChatdetailWithYekjaWidget
                                                    .routeName,
                                                queryParameters: {
                                                  'chatId': serializeParam(
                                                    chatviewItem.chatId,
                                                    ParamType.int,
                                                  ),
                                                  'ownerUserName':
                                                      serializeParam(
                                                    chatviewItem.ownerUsername,
                                                    ParamType.String,
                                                  ),
                                                  'postID': serializeParam(
                                                    chatviewItem.chatPostId,
                                                    ParamType.String,
                                                  ),
                                                  'ownerID': serializeParam(
                                                    chatviewItem.postOwnerId,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            onLongPress: () async {
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child:
                                                          ConfirmCancelPopUpWidget(
                                                        header: 'Delete chat',
                                                        hintText:
                                                            'Press confirm if you intend to delete this chat.',
                                                        cancelText: 'Cancel',
                                                        confirmText: 'Confirm',
                                                        onConfirmAction:
                                                            () async {
                                                          if (currentUserUid ==
                                                              chatviewItem
                                                                  .chatSender) {
                                                            await ChatsTable()
                                                                .update(
                                                              data: {
                                                                'sender_deleted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eqOrNull(
                                                                        'id',
                                                                        chatviewItem
                                                                            .chatId,
                                                                      )
                                                                      .eqOrNull(
                                                                        'sender',
                                                                        chatviewItem
                                                                            .chatSender,
                                                                      ),
                                                            );
                                                          } else {
                                                            await ChatsTable()
                                                                .update(
                                                              data: {
                                                                'recipient_deleted_at':
                                                                    supaSerialize<
                                                                            DateTime>(
                                                                        getCurrentTimestamp),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eqOrNull(
                                                                        'id',
                                                                        chatviewItem
                                                                            .chatId,
                                                                      )
                                                                      .eqOrNull(
                                                                        'recipient',
                                                                        chatviewItem
                                                                            .chatRecipient,
                                                                      ),
                                                            );
                                                          }

                                                          safeSetState(() =>
                                                              _model.requestCompleter =
                                                                  null);
                                                          await _model
                                                              .waitForRequestCompleted();
                                                        },
                                                        onCancelAction:
                                                            () async {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth: 60.0,
                                                    maxHeight: 60.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Stack(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          child: Image.network(
                                                            FFAppConstants
                                                                .YekjaLogoChat,
                                                            width: 60.0,
                                                            height: 60.0,
                                                            fit: BoxFit.cover,
                                                            alignment:
                                                                Alignment(
                                                                    0.0, 0.0),
                                                          ),
                                                        ),
                                                        if (functions
                                                            .isPresentAndPositive(
                                                                chatviewItem
                                                                    .unseenCount))
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.0, 1.0),
                                                            child: badges.Badge(
                                                              badgeContent:
                                                                  Text(
                                                                chatviewItem
                                                                    .unseenCount!
                                                                    .toString(),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodySmallIsCustom,
                                                                    ),
                                                              ),
                                                              showBadge: true,
                                                              shape: badges
                                                                  .BadgeShape
                                                                  .circle,
                                                              badgeColor: Color(
                                                                  0xFFED232B),
                                                              elevation: 0.0,
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5.0),
                                                              position: badges
                                                                      .BadgePosition
                                                                  .topEnd(),
                                                              animationType: badges
                                                                  .BadgeAnimationType
                                                                  .scale,
                                                              toAnimate: true,
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              chatviewItem
                                                                  .postTitle,
                                                              'Welcome to Yekja :)',
                                                            ),
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Satoshi',
                                                                  color: chatviewItem
                                                                              .unseenCount! >
                                                                          0
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary
                                                                      : Color(
                                                                          0xFFBFBBBB),
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 4.0)),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Yekja: ',
                                                            textAlign:
                                                                TextAlign.start,
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Satoshi',
                                                                  color: chatviewItem
                                                                              .unseenCount! >
                                                                          0
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary
                                                                      : Color(
                                                                          0xFFBFBBBB),
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                          Flexible(
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                chatviewItem
                                                                    .lastMessageText,
                                                                'Image',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              maxLines: 2,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Satoshi',
                                                                    color: chatviewItem.unseenCount! >
                                                                            0
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .secondaryText
                                                                        : FlutterFlowTheme.of(context)
                                                                            .bordergray,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w200,
                                                                  ),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Text(
                                                    dateTimeFormat(
                                                      "MEd",
                                                      chatviewItem
                                                          .chatCreatedAt!,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    textAlign:
                                                        TextAlign.justify,
                                                    maxLines: 1,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: chatviewItem
                                                                      .unseenCount! >
                                                                  0
                                                              ? Color(
                                                                  0xFF17C995)
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: wrapWithModel(
                          model: _model.navBarModel,
                          updateCallback: () => safeSetState(() {}),
                          child: NavBarWidget(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
