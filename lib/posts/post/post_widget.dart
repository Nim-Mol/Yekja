import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_overview_pages/post_detail_column/post_detail_column_widget.dart';
import '/profile/review_card_small/review_card_small_widget.dart';
import '/shared_components/comunication_bar/comunication_bar_widget.dart';
import '/shared_components/confirm_cancel_pop_up/confirm_cancel_pop_up_widget.dart';
import '/shared_components/photo_gallary/photo_gallary_widget.dart';
import '/shared_components/reporting_popup/reporting_popup_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'post_model.dart';
export 'post_model.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({
    super.key,
    required this.postID,
    this.mainCatID,
    required this.detailDataName,
  });

  final String? postID;
  final int? mainCatID;
  final String? detailDataName;

  static String routeName = 'Post';
  static String routePath = '/ProductDetail';

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> with TickerProviderStateMixin {
  late PostModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          _model.liked = await PostsLikesTable().queryRows(
            queryFn: (q) => q
                .eqOrNull(
                  'user_id',
                  currentUserUid,
                )
                .eqOrNull(
                  'post_id',
                  widget.postID,
                ),
          );
          if (currentUserUid != '') {
            if (functions.listContainsString(
                _model.liked!
                    .map((e) => e.postId)
                    .withoutNulls
                    .toList()
                    .toList(),
                widget.postID!)) {
              _model.isLiked = true;
              safeSetState(() {});
            } else {
              _model.isLiked = false;
              safeSetState(() {});
            }

            if (functions.listContainsString(
                FFAppState().userInfo.userFavs.toList(), widget.postID!)) {
              _model.favListInitial =
                  FFAppState().userInfo.userFavs.toList().cast<String>();
              _model.isFav = true;
              safeSetState(() {});
            } else {
              _model.favListInitial =
                  FFAppState().userInfo.userFavs.toList().cast<String>();
              _model.isFav = false;
              safeSetState(() {});
            }
          } else {
            return;
          }
        }),
        Future(() async {
          if (widget.detailDataName == 'events') {
            _model.eventAttendeesOut = await EventAttendeesTable().queryRows(
              queryFn: (q) => q
                  .eqOrNull(
                    'post_id',
                    widget.postID,
                  )
                  .eqOrNull(
                    'user_id',
                    currentUserUid,
                  ),
            );
            if (_model.eventAttendeesOut != null &&
                (_model.eventAttendeesOut)!.isNotEmpty) {
              FFAppState().isGoingEvent = true;
              safeSetState(() {});
            } else {
              FFAppState().isGoingEvent = false;
              safeSetState(() {});
            }
          }
        }),
      ]);
    });

    animationsMap.addAll({
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(-41.0, -0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
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

    return FutureBuilder<List<ViewPostSearchEnRow>>(
      future:
          (_model.requestCompleter2 ??= Completer<List<ViewPostSearchEnRow>>()
                ..complete(ViewPostSearchEnTable().querySingleRow(
                  queryFn: (q) => q
                      .eqOrNull(
                        'post_id',
                        widget.postID,
                      )
                      .eqOrNull(
                        'detail_table',
                        widget.detailDataName,
                      ),
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
        List<ViewPostSearchEnRow> postViewPostSearchEnRowList = snapshot.data!;

        final postViewPostSearchEnRow = postViewPostSearchEnRowList.isNotEmpty
            ? postViewPostSearchEnRowList.first
            : null;

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
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 400.0,
                              decoration: BoxDecoration(),
                              child: Container(
                                height: 400.0,
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: wrapWithModel(
                                        model: _model.photoGallaryModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: PhotoGallaryWidget(
                                          photoList: !(postViewPostSearchEnRow!
                                                  .images.isNotEmpty)
                                              ? [
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/uhwqu36njkuw/default_post_image.jpg'
                                                ]
                                              : postViewPostSearchEnRow.images
                                                  .map((e) => e)
                                                  .toList(),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 24.0, 16.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              FlutterFlowIconButton(
                                                borderRadius: 50.0,
                                                buttonSize: 40.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                icon: Icon(
                                                  Icons.chevron_left,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  context.safePop();
                                                },
                                              ),
                                              if (currentUserUid != '')
                                                Flexible(
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        if ((postViewPostSearchEnRow
                                                                    .ownerId !=
                                                                currentUserUid) &&
                                                            !FFAppState()
                                                                .IsGust)
                                                          Container(
                                                            width: 40.0,
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: ToggleIcon(
                                                              onPressed:
                                                                  () async {
                                                                safeSetState(() =>
                                                                    _model.isLiked =
                                                                        !_model
                                                                            .isLiked);
                                                                if (_model
                                                                        .isLiked ==
                                                                    true) {
                                                                  await PostsLikesTable()
                                                                      .insert({
                                                                    'user_id':
                                                                        currentUserUid,
                                                                    'post_id':
                                                                        widget
                                                                            .postID,
                                                                  });
                                                                } else {
                                                                  await PostsLikesTable()
                                                                      .delete(
                                                                    matchingRows:
                                                                        (rows) => rows
                                                                            .eqOrNull(
                                                                              'post_id',
                                                                              widget.postID,
                                                                            )
                                                                            .eqOrNull(
                                                                              'user_id',
                                                                              currentUserUid,
                                                                            ),
                                                                  );
                                                                }

                                                                safeSetState(() =>
                                                                    _model.requestCompleter2 =
                                                                        null);
                                                                await _model
                                                                    .waitForRequestCompleted2();
                                                              },
                                                              value: _model
                                                                  .isLiked,
                                                              onIcon: Icon(
                                                                Icons.favorite,
                                                                color: Color(
                                                                    0xFFF10707),
                                                                size: 22.0,
                                                              ),
                                                              offIcon: Icon(
                                                                Icons
                                                                    .favorite_border,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 20.0,
                                                              ),
                                                            ),
                                                          ),
                                                        if ((currentUserUid !=
                                                                postViewPostSearchEnRow
                                                                    .ownerId) &&
                                                            !FFAppState()
                                                                .IsGust)
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.0, 0.0),
                                                            child: Container(
                                                              width: 40.0,
                                                              height: 40.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: ToggleIcon(
                                                                onPressed:
                                                                    () async {
                                                                  safeSetState(() =>
                                                                      _model.isFav =
                                                                          !_model
                                                                              .isFav);
                                                                  if (functions.listContainsString(
                                                                      FFAppState()
                                                                          .userInfo
                                                                          .userFavs
                                                                          .toList(),
                                                                      widget
                                                                          .postID!)) {
                                                                    FFAppState()
                                                                        .updateUserInfoStruct(
                                                                      (e) => e
                                                                        ..updateUserFavs(
                                                                          (e) =>
                                                                              e.remove(widget.postID),
                                                                        ),
                                                                    );
                                                                    await UserFavoritesTable()
                                                                        .delete(
                                                                      matchingRows: (rows) => rows
                                                                          .eqOrNull(
                                                                            'user_id',
                                                                            currentUserUid,
                                                                          )
                                                                          .eqOrNull(
                                                                            'post_id',
                                                                            widget.postID,
                                                                          ),
                                                                    );
                                                                  } else {
                                                                    FFAppState()
                                                                        .updateUserInfoStruct(
                                                                      (e) => e
                                                                        ..updateUserFavs(
                                                                          (e) =>
                                                                              e.add(widget.postID!),
                                                                        ),
                                                                    );
                                                                    await UserFavoritesTable()
                                                                        .insert({
                                                                      'user_id':
                                                                          currentUserUid,
                                                                      'post_id':
                                                                          widget
                                                                              .postID,
                                                                    });
                                                                  }

                                                                  safeSetState(() =>
                                                                      _model.requestCompleter2 =
                                                                          null);
                                                                  await _model
                                                                      .waitForRequestCompleted2();
                                                                },
                                                                value: _model
                                                                    .isFav,
                                                                onIcon: Icon(
                                                                  Icons
                                                                      .bookmark_added,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .greenInit,
                                                                  size: 20.0,
                                                                ),
                                                                offIcon: Icon(
                                                                  Icons
                                                                      .bookmark_border,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 20.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        if (!FFAppState()
                                                            .IsGust)
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 40.0,
                                                              height: 40.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: ToggleIcon(
                                                                onPressed:
                                                                    () async {
                                                                  safeSetState(() =>
                                                                      _model.isClose =
                                                                          !_model
                                                                              .isClose);
                                                                },
                                                                value: _model
                                                                    .isClose,
                                                                onIcon: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .ellipsisV,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 14.0,
                                                                ),
                                                                offIcon: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .angleRight,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 14.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        if (!_model.isClose)
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              if ((postViewPostSearchEnRow
                                                                          .ownerId ==
                                                                      currentUserUid) &&
                                                                  !FFAppState()
                                                                      .IsGust)
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: 40.0,
                                                                    height:
                                                                        40.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                      child:
                                                                          FlutterFlowIconButton(
                                                                        borderRadius:
                                                                            50.0,
                                                                        buttonSize:
                                                                            40.0,
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .edit,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              20.0,
                                                                        ),
                                                                        onPressed:
                                                                            () async {
                                                                          context
                                                                              .pushNamed(
                                                                            PostEditWidget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'postId': serializeParam(
                                                                                widget.postID,
                                                                                ParamType.String,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              if ((currentUserUid !=
                                                                      postViewPostSearchEnRow
                                                                          .ownerId) &&
                                                                  !FFAppState()
                                                                      .IsGust)
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: 40.0,
                                                                    height:
                                                                        40.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        if (functions.listContainsString(
                                                                            FFAppState().userInfo.reportedList.toList(),
                                                                            widget.postID!))
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidFlag,
                                                                              color: Color(0xFFDC0D08),
                                                                              size: 16.0,
                                                                            ),
                                                                          ),
                                                                        if (!functions.listContainsString(
                                                                            FFAppState().userInfo.reportedList.toList(),
                                                                            widget.postID!))
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Builder(
                                                                              builder: (context) => InkWell(
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
                                                                                        alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                        child: ConfirmCancelPopUpWidget(
                                                                                          header: 'Reporting ',
                                                                                          hintText: 'Are you sure you want to report this post?',
                                                                                          cancelText: 'Cancel',
                                                                                          confirmText: 'Report',
                                                                                          onConfirmAction: () async {
                                                                                            await showDialog(
                                                                                              context: context,
                                                                                              builder: (dialogContext) {
                                                                                                return Dialog(
                                                                                                  elevation: 0,
                                                                                                  insetPadding: EdgeInsets.zero,
                                                                                                  backgroundColor: Colors.transparent,
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                  child: ReportingPopupWidget(
                                                                                                    reportingData: ReportingDataStruct(
                                                                                                      postId: widget.postID,
                                                                                                      postTitle: postViewPostSearchEnRow.title,
                                                                                                      isProfile: false,
                                                                                                      profileOwnerName: postViewPostSearchEnRow.userName,
                                                                                                      profileId: postViewPostSearchEnRow.ownerId,
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                          },
                                                                                          onCancelAction: () async {},
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                },
                                                                                child: FaIcon(
                                                                                  FontAwesomeIcons.flag,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  size: 16.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                            ].divide(SizedBox(
                                                                width: 3.0)),
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'rowOnPageLoadAnimation']!),
                                                      ].divide(SizedBox(
                                                          width: 10.0)),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0x00232426),
                                              Color(0xDF0E0E0E)
                                            ],
                                            stops: [0.0, 1.0],
                                            begin:
                                                AlignmentDirectional(0.0, -1.0),
                                            end: AlignmentDirectional(0, 1.0),
                                          ),
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 20.0, 16.0, 16.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Flexible(
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              FFAppState()
                                                                  .isGoingEvent
                                                                  .toString()),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      postViewPostSearchEnRow
                                                          .title,
                                                      'This is a title which is quite long and all',
                                                    ),
                                                    textAlign: TextAlign.start,
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLargeFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryWhite,
                                                          fontSize: 28.0,
                                                          letterSpacing: 0.0,
                                                          lineHeight: 1.1,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleLargeIsCustom,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 6.0, 16.0),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          buttonSize: 44.0,
                                          icon: Icon(
                                            Icons.image_search,
                                            color: Colors.white,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            context.pushNamed(
                                              ImageGalleryPageWidget.routeName,
                                              queryParameters: {
                                                'previewImages': serializeParam(
                                                  postViewPostSearchEnRow
                                                      .images
                                                      .map((e) => e)
                                                      .toList(),
                                                  ParamType.String,
                                                  isList: true,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Stack(
                                alignment: AlignmentDirectional(1.0, -1.0),
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.postDetailColumnModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: PostDetailColumnWidget(
                                        profileId:
                                            postViewPostSearchEnRow.ownerId,
                                        postId: postViewPostSearchEnRow.postId,
                                        detailTable: widget.detailDataName!,
                                        username: '',
                                        itemData: ItemCardGlobalStruct(
                                          description: postViewPostSearchEnRow
                                              .description,
                                          itemLocation:
                                              postViewPostSearchEnRow.city,
                                          createdAt: postViewPostSearchEnRow
                                              .createdAt,
                                          catName:
                                              postViewPostSearchEnRow.catLabel,
                                          subCatName: postViewPostSearchEnRow
                                              .subCatLabel,
                                          fillColor: functions.hexToColor(
                                              postViewPostSearchEnRow
                                                  .effectiveColorHex,
                                              Color(0x00000000)),
                                        ),
                                        details: functions.decodeDetails(
                                            postViewPostSearchEnRow
                                                .detailsText!),
                                        detailLabels: functions.decodeDetails(
                                            postViewPostSearchEnRow
                                                .detailsLabelText!),
                                      ),
                                    ),
                                  ),
                                  if (postViewPostSearchEnRow.postLikes !=
                                      null)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 16.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text(_model.isFav
                                                        .toString()),
                                                    content: Text(FFAppState()
                                                        .userInfo
                                                        .userFavs
                                                        .length
                                                        .toString()),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: Icon(
                                              Icons.favorite,
                                              color: Color(0xFFEC0B0B),
                                              size: 24.0,
                                            ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              postViewPostSearchEnRow.postLikes
                                                  ?.toString(),
                                              '0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 6.0)),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            if (widget.detailDataName == 'events')
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 8.0, 16.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '2too9sgo' /* PARTICIPANTS */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmallIsCustom,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 8.0, 16.0, 24.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '8a9n5ce1' /* People who are going to this e... */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmallIsCustom,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  FutureBuilder<List<ViewEventAttendeesRow>>(
                                    future:
                                        (_model.requestCompleter1 ??= Completer<
                                                List<ViewEventAttendeesRow>>()
                                              ..complete(
                                                  ViewEventAttendeesTable()
                                                      .queryRows(
                                                queryFn: (q) => q.eqOrNull(
                                                  'post_id',
                                                  widget.postID,
                                                ),
                                              )))
                                            .future,
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: SpinKitChasingDots(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .greenInit,
                                              size: 50.0,
                                            ),
                                          ),
                                        );
                                      }
                                      List<ViewEventAttendeesRow>
                                          participantsRowViewEventAttendeesRowList =
                                          snapshot.data!;

                                      return SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: List.generate(
                                              participantsRowViewEventAttendeesRowList
                                                  .length,
                                              (participantsRowIndex) {
                                            final participantsRowViewEventAttendeesRow =
                                                participantsRowViewEventAttendeesRowList[
                                                    participantsRowIndex];
                                            return Container(
                                              width: 50.0,
                                              height: 50.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                (participantsRowViewEventAttendeesRow
                                                                    .profileAvatar !=
                                                                null &&
                                                            participantsRowViewEventAttendeesRow
                                                                    .profileAvatar !=
                                                                '') &&
                                                        participantsRowViewEventAttendeesRow
                                                            .showProfileImage!
                                                    ? participantsRowViewEventAttendeesRow
                                                        .profileAvatar!
                                                    : FFAppConstants
                                                        .profileAvatarCircular,
                                                fit: BoxFit.cover,
                                              ),
                                            );
                                          }).divide(SizedBox(width: 10.0)),
                                        ),
                                      );
                                    },
                                  ),
                                  if (currentUserUid != '')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 36.0, 0.0, 16.0),
                                      child: Stack(
                                        children: [
                                          if (!FFAppState().isGoingEvent)
                                            Builder(
                                              builder: (context) => InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
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
                                                        child:
                                                            ConfirmCancelPopUpWidget(
                                                          header:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            'wqz0gbml' /* Participating this event?  */,
                                                          ),
                                                          hintText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            '5rh5hzcd' /* Please confirm if you'd like t... */,
                                                          ),
                                                          cancelText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            'j7zk9y66' /* Cancel */,
                                                          ),
                                                          confirmText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            '2xwucqow' /* Confirm */,
                                                          ),
                                                          onConfirmAction:
                                                              () async {
                                                            await EventAttendeesTable()
                                                                .insert({
                                                              'post_id': widget
                                                                  .postID,
                                                              'user_id':
                                                                  currentUserUid,
                                                            });
                                                            FFAppState()
                                                                    .isGoingEvent =
                                                                true;
                                                            safeSetState(() {});
                                                            safeSetState(() =>
                                                                _model.requestCompleter1 =
                                                                    null);
                                                            await _model
                                                                .waitForRequestCompleted1();
                                                          },
                                                          onCancelAction:
                                                              () async {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .greenInit,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                    shape: BoxShape.rectangle,
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .greenInit,
                                                      width: 0.3,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      4.0,
                                                                      16.0,
                                                                      4.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'boz0byfv' /* Join Event */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
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
                                              ),
                                            ),
                                          if (FFAppState().isGoingEvent)
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Builder(
                                                  builder: (context) => InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (dialogContext) {
                                                          return Dialog(
                                                            elevation: 0,
                                                            insetPadding:
                                                                EdgeInsets.zero,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            alignment: AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                            child:
                                                                ConfirmCancelPopUpWidget(
                                                              header:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'tp3k3r4y' /* Have you changed your mind? */,
                                                              ),
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'xpe981q9' /* You are currently a participan... */,
                                                              ),
                                                              cancelText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'c6ztjxng' /* Cencel */,
                                                              ),
                                                              confirmText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'h7bvgbn3' /* Confirm */,
                                                              ),
                                                              onConfirmAction:
                                                                  () async {
                                                                await EventAttendeesTable()
                                                                    .delete(
                                                                  matchingRows:
                                                                      (rows) => rows
                                                                          .eqOrNull(
                                                                            'post_id',
                                                                            widget.postID,
                                                                          )
                                                                          .eqOrNull(
                                                                            'user_id',
                                                                            currentUserUid,
                                                                          ),
                                                                );
                                                                FFAppState()
                                                                        .isGoingEvent =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                                safeSetState(() =>
                                                                    _model.requestCompleter1 =
                                                                        null);
                                                                await _model
                                                                    .waitForRequestCompleted1();
                                                              },
                                                              onCancelAction:
                                                                  () async {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .greenInit,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                        shape:
                                                            BoxShape.rectangle,
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .greenInit,
                                                          width: 0.3,
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.0, -1.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'b4p05q5z' /* Leave Event */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      ProfileEditWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'selectedTab':
                                                            serializeParam(
                                                          1,
                                                          ParamType.int,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '7akfjv6a' /* Hide your profile image */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .textgray,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmallIsCustom,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 24.0, 16.0, 16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Container(
                                      width: double.infinity,
                                      height: 85.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (currentUserUid != '') {
                                                context.pushNamed(
                                                  ProfilePageWidget.routeName,
                                                  queryParameters: {
                                                    'profileId': serializeParam(
                                                      postViewPostSearchEnRow
                                                          .ownerId,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Please login or signup if you wat to enable post creation.  ',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 5000),
                                                    backgroundColor:
                                                        Color(0xFFBA8D08),
                                                  ),
                                                );
                                              }
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 70.0,
                                                  height: 70.0,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  1.0),
                                                          child: Container(
                                                            width: 60.0,
                                                            height: 60.0,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              (postViewPostSearchEnRow.profileAvatar !=
                                                                              null &&
                                                                          postViewPostSearchEnRow.profileAvatar !=
                                                                              '') &&
                                                                      postViewPostSearchEnRow
                                                                          .showProfileImage!
                                                                  ? valueOrDefault<
                                                                      String>(
                                                                      postViewPostSearchEnRow
                                                                          .profileAvatar,
                                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/n2imhdlvogb3/profile_avatar_circular.png',
                                                                    )
                                                                  : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/n2imhdlvogb3/profile_avatar_circular.png',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      if (postViewPostSearchEnRow
                                                              .yekjaVerified ??
                                                          true)
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, 1.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                Image.network(
                                                              'https://bkygphvuuqmpmcfrncpm.supabase.co/storage/v1/object/public/yekja/Assets/Yekja_badge.png',
                                                              width: 25.0,
                                                              height: 25.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            postViewPostSearchEnRow
                                                                .userName,
                                                            ' user name',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .poppins(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                'https://bkygphvuuqmpmcfrncpm.supabase.co/storage/v1/object/public/yekja/Assets/Icons/star_animated.gif',
                                                                width: 30.0,
                                                                height: 30.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            '${valueOrDefault<String>(
                                                              postViewPostSearchEnRow
                                                                  .review
                                                                  ?.toString(),
                                                              '1',
                                                            )} (${valueOrDefault<String>(
                                                              postViewPostSearchEnRow
                                                                  .ratings
                                                                  ?.toString(),
                                                              '1',
                                                            )})',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(4.0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 2.0,
                                                                color: Color(
                                                                    0xB039D2C0),
                                                                offset: Offset(
                                                                  2.0,
                                                                  0.0,
                                                                ),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 4.0)),
                                                  ),
                                                ),
                                              ]
                                                  .divide(SizedBox(width: 4.0))
                                                  .addToStart(
                                                      SizedBox(width: 4.0)),
                                            ),
                                          ),
                                          if (postViewPostSearchEnRow
                                                  .showSocialmedia ??
                                              true)
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(16.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        if (currentUserUid !=
                                                                '') {
                                                          if (FFAppState()
                                                                      .userInfo
                                                                      .instaLink ==
                                                                  '') {
                                                            await launchURL(
                                                                FFAppState()
                                                                    .userInfo
                                                                    .instaLink);
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Instagram link it not set.',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .warning,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    Color(
                                                                        0x42BA8D08),
                                                              ),
                                                            );
                                                          }

                                                          return;
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Please login or signup if you wat to enable post creation.  ',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      5000),
                                                              backgroundColor:
                                                                  Color(
                                                                      0xFFBA8D08),
                                                            ),
                                                          );
                                                          return;
                                                        }
                                                      },
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.asset(
                                                          'assets/images/instagram.png',
                                                          width: 40.0,
                                                          height: 40.0,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 4.0)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 6.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '6g2h5fom' /* REVIEWS */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodySmallIsCustom,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: FutureBuilder<List<ViewUserReviewsRow>>(
                                future: ViewUserReviewsTable().queryRows(
                                  queryFn: (q) => q
                                      .eqOrNull(
                                        'reviewed_user_id',
                                        postViewPostSearchEnRow.ownerId,
                                      )
                                      .eqOrNull(
                                        'both_review_submitted',
                                        true,
                                      )
                                      .order('created_at'),
                                ),
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
                                  List<ViewUserReviewsRow>
                                      rowViewUserReviewsRowList =
                                      snapshot.data!;

                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: List.generate(
                                              rowViewUserReviewsRowList.length,
                                              (rowIndex) {
                                        final rowViewUserReviewsRow =
                                            rowViewUserReviewsRowList[rowIndex];
                                        return Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: ReviewCardSmallWidget(
                                            key: Key(
                                                'Keyepz_${rowIndex}_of_${rowViewUserReviewsRowList.length}'),
                                            reviewData: ReviewCardDataStruct(
                                              userName: rowViewUserReviewsRow
                                                  .usernameWriter,
                                              comunicationScore:
                                                  rowViewUserReviewsRow
                                                      .comunicationScore,
                                              qualitScore: rowViewUserReviewsRow
                                                  .qualityScsore,
                                              reliabilityScore:
                                                  rowViewUserReviewsRow
                                                      .reliabilityScore,
                                              note: rowViewUserReviewsRow.note,
                                              avarageScore:
                                                  rowViewUserReviewsRow
                                                      .avgReviewScore,
                                              fairnessScore:
                                                  rowViewUserReviewsRow
                                                      .fairnessScore,
                                              createAt: rowViewUserReviewsRow
                                                  .createdAt,
                                              reviewerId: rowViewUserReviewsRow
                                                  .writerId,
                                              userAvatar: rowViewUserReviewsRow
                                                  .profileAvatarWriter,
                                            ),
                                          ),
                                        );
                                      })
                                          .divide(SizedBox(width: 12.0))
                                          .addToStart(SizedBox(width: 16.0))
                                          .addToEnd(SizedBox(width: 16.0)),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ].addToEnd(SizedBox(height: 120.0)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: wrapWithModel(
                        model: _model.comunicationBarModel,
                        updateCallback: () => safeSetState(() {}),
                        child: ComunicationBarWidget(
                          recipient: postViewPostSearchEnRow.ownerId!,
                          postTitle: postViewPostSearchEnRow.title!,
                          postId: postViewPostSearchEnRow.postId!,
                          allowMessage: postViewPostSearchEnRow.allowMessage!,
                          allowCall: postViewPostSearchEnRow.allowCall!,
                          allowShare: false,
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
