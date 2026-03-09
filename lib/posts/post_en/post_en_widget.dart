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
import '/shared_components/custom_snackbar/custom_snackbar_widget.dart';
import '/shared_components/photo_gallary/photo_gallary_widget.dart';
import '/shared_components/post_owner_card/post_owner_card_widget.dart';
import '/shared_components/report_bug/report_bug_widget.dart';
import '/shared_components/reporting_popup/reporting_popup_widget.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'post_en_model.dart';
export 'post_en_model.dart';

class PostEnWidget extends StatefulWidget {
  const PostEnWidget({
    super.key,
    required this.postID,
    this.mainCatID,
    required this.detailDataName,
  });

  final String? postID;
  final int? mainCatID;
  final String? detailDataName;

  static String routeName = 'PostEn';
  static String routePath = '/PostEn';

  @override
  State<PostEnWidget> createState() => _PostEnWidgetState();
}

class _PostEnWidgetState extends State<PostEnWidget>
    with TickerProviderStateMixin {
  late PostEnModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostEnModel());

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
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -44.99999999999999),
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
      future: _model
          .postEn(
        uniqueQueryKey: valueOrDefault<String>(
          widget.postID,
          'defult',
        ),
        requestFn: () => ViewPostSearchEnTable().querySingleRow(
          queryFn: (q) => q
              .eqOrNull(
                'post_id',
                widget.postID,
              )
              .eqOrNull(
                'detail_table',
                widget.detailDataName,
              ),
        ),
      )
          .then((result) {
        try {
          _model.requestCompleted2 = true;
          _model.requestLastUniqueKey2 = valueOrDefault<String>(
            widget.postID,
            'defult',
          );
        } finally {}
        return result;
      }),
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
        List<ViewPostSearchEnRow> postEnViewPostSearchEnRowList =
            snapshot.data!;

        final postEnViewPostSearchEnRow =
            postEnViewPostSearchEnRowList.isNotEmpty
                ? postEnViewPostSearchEnRowList.first
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
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onDoubleTap: () async {
                                context.pushNamed(
                                  ImageGalleryPageWidget.routeName,
                                  queryParameters: {
                                    'previewImages': serializeParam(
                                      postEnViewPostSearchEnRow.images
                                          .map((e) => e)
                                          .toList(),
                                      ParamType.String,
                                      isList: true,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                height: 400.0,
                                decoration: BoxDecoration(),
                                child: Container(
                                  height: 400.0,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 1.0),
                                        child: wrapWithModel(
                                          model: _model.photoGallaryModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: PhotoGallaryWidget(
                                            photoList:
                                                !(postEnViewPostSearchEnRow!
                                                        .images.isNotEmpty)
                                                    ? [
                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/uhwqu36njkuw/default_post_image.jpg'
                                                      ]
                                                    : postEnViewPostSearchEnRow
                                                        .images
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
                                          Stack(
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 24.0, 16.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    FlutterFlowIconButton(
                                                      borderRadius: 50.0,
                                                      buttonSize: 40.0,
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      icon: Icon(
                                                        Icons.chevron_left,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 24.0,
                                                      ),
                                                      onPressed: () async {
                                                        context.safePop();
                                                      },
                                                    ),
                                                    if (currentUserUid != '')
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          if ((postEnViewPostSearchEnRow
                                                                      .ownerId !=
                                                                  currentUserUid) &&
                                                              !FFAppState()
                                                                  .IsGust)
                                                            Container(
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
                                                                      matchingRows: (rows) => rows
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

                                                                  safeSetState(
                                                                      () {
                                                                    _model.clearPostEnCacheKey(
                                                                        _model
                                                                            .requestLastUniqueKey2);
                                                                    _model.requestCompleted2 =
                                                                        false;
                                                                  });
                                                                  await _model
                                                                      .waitForRequestCompleted2();
                                                                },
                                                                value: _model
                                                                    .isLiked,
                                                                onIcon: Icon(
                                                                  Icons
                                                                      .favorite,
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
                                                                  postEnViewPostSearchEnRow
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
                                                                child:
                                                                    ToggleIcon(
                                                                  onPressed:
                                                                      () async {
                                                                    safeSetState(() => _model
                                                                            .isFav =
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
                                                                            widget.postID,
                                                                      });
                                                                    }

                                                                    safeSetState(
                                                                        () {
                                                                      _model.clearPostEnCacheKey(
                                                                          _model
                                                                              .requestLastUniqueKey2);
                                                                      _model.requestCompleted2 =
                                                                          false;
                                                                    });
                                                                    await _model
                                                                        .waitForRequestCompleted2();
                                                                    FFAppState()
                                                                        .clearUserFavsCacheKey(
                                                                            currentUserUid);
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
                                                                child:
                                                                    ToggleIcon(
                                                                  onPressed:
                                                                      () async {
                                                                    safeSetState(() => _model
                                                                            .isClose =
                                                                        !_model
                                                                            .isClose);
                                                                  },
                                                                  value: _model
                                                                      .isClose,
                                                                  onIcon:
                                                                      FaIcon(
                                                                    FontAwesomeIcons
                                                                        .ellipsisV,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 14.0,
                                                                  ),
                                                                  offIcon: Icon(
                                                                    Icons
                                                                        .keyboard_arrow_up_outlined,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 20.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 70.0, 16.0, 0.0),
                                                  child: Container(
                                                    width: 43.4,
                                                    height: 138.38,
                                                    decoration: BoxDecoration(),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 1.0),
                                                    child: Visibility(
                                                      visible: !_model.isClose,
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 1.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            if ((postEnViewPostSearchEnRow
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
                                                                  height: 40.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Align(
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
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .edit,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        await Future
                                                                            .wait([
                                                                          Future(
                                                                              () async {
                                                                            FFAppState().postDetailJSON =
                                                                                functions.decodeDetails(postEnViewPostSearchEnRow.detailsText!);
                                                                            safeSetState(() {});
                                                                          }),
                                                                          Future(
                                                                              () async {
                                                                            FFAppState().postState =
                                                                                PostModelStruct(
                                                                              id: postEnViewPostSearchEnRow.postId,
                                                                              ownerId: postEnViewPostSearchEnRow.ownerId,
                                                                              subCatId: postEnViewPostSearchEnRow.subCatId,
                                                                              postLikes: postEnViewPostSearchEnRow.postLikes,
                                                                              catName: postEnViewPostSearchEnRow.catLabel,
                                                                              subCatName: postEnViewPostSearchEnRow.subCatLabel,
                                                                              createdAt: postEnViewPostSearchEnRow.createdAt,
                                                                              review: postEnViewPostSearchEnRow.review,
                                                                              ratings: postEnViewPostSearchEnRow.ratings,
                                                                              rentalType: getJsonField(
                                                                                postEnViewPostSearchEnRow.detailsLabels,
                                                                                r'''$.rental_type''',
                                                                              ).toString(),
                                                                              intend: getJsonField(
                                                                                postEnViewPostSearchEnRow.detailsLabels,
                                                                                r'''$.intend''',
                                                                              ).toString(),
                                                                              price: getJsonField(
                                                                                postEnViewPostSearchEnRow.details,
                                                                                r'''$.price''',
                                                                              ),
                                                                              isNegotiable: getJsonField(
                                                                                postEnViewPostSearchEnRow.details,
                                                                                r'''$.is_negotiable''',
                                                                              ),
                                                                              condition: getJsonField(
                                                                                postEnViewPostSearchEnRow.detailsLabels,
                                                                                r'''$.condition''',
                                                                              ).toString(),
                                                                              deliveryMethod: getJsonField(
                                                                                postEnViewPostSearchEnRow.detailsLabels,
                                                                                r'''$.delivery_method''',
                                                                              ).toString(),
                                                                              openForSwap: getJsonField(
                                                                                postEnViewPostSearchEnRow.details,
                                                                                r'''$.open_for_swap''',
                                                                              ),
                                                                              wishlistText: getJsonField(
                                                                                postEnViewPostSearchEnRow.details,
                                                                                r'''$.wishlist_text''',
                                                                              ).toString(),
                                                                              ticketsQty: getJsonField(
                                                                                postEnViewPostSearchEnRow.details,
                                                                                r'''$.tickets_qty''',
                                                                              ),
                                                                              eventDatetime: functions.jsonToDateTimeUtc(getJsonField(
                                                                                postEnViewPostSearchEnRow.details!,
                                                                                r'''$.event_datetime''',
                                                                              )),
                                                                              venueName: getJsonField(
                                                                                postEnViewPostSearchEnRow.details,
                                                                                r'''$.venue_name''',
                                                                              ).toString(),
                                                                              currency: getJsonField(
                                                                                postEnViewPostSearchEnRow.detailsLabels,
                                                                                r'''$.venue_name''',
                                                                              ).toString(),
                                                                              amount: getJsonField(
                                                                                postEnViewPostSearchEnRow.details,
                                                                                r'''$.amount''',
                                                                              ),
                                                                              allowPartial: getJsonField(
                                                                                postEnViewPostSearchEnRow.details,
                                                                                r'''$.allow_partial''',
                                                                              ),
                                                                              method: getJsonField(
                                                                                postEnViewPostSearchEnRow.detailsLabels,
                                                                                r'''$.method''',
                                                                              ).toString(),
                                                                              originCountry: getJsonField(
                                                                                postEnViewPostSearchEnRow.details,
                                                                                r'''$.origin_country''',
                                                                              ).toString(),
                                                                              originCity: getJsonField(
                                                                                postEnViewPostSearchEnRow.details,
                                                                                r'''$.origin_city''',
                                                                              ).toString(),
                                                                              destinationCountry: getJsonField(
                                                                                postEnViewPostSearchEnRow.details,
                                                                                r'''$.destination_country''',
                                                                              ).toString(),
                                                                              destinationCity: getJsonField(
                                                                                postEnViewPostSearchEnRow.details,
                                                                                r'''$.destination_city''',
                                                                              ).toString(),
                                                                              isDocument: getJsonField(
                                                                                postEnViewPostSearchEnRow.details,
                                                                                r'''$.is_document''',
                                                                              ),
                                                                              weightKg: getJsonField(
                                                                                postEnViewPostSearchEnRow.detailsLabels,
                                                                                r'''$.weight_kg''',
                                                                              ).toString(),
                                                                              dimensionsText: getJsonField(
                                                                                postEnViewPostSearchEnRow.detailsLabels,
                                                                                r'''$.dimensions_text''',
                                                                              ).toString(),
                                                                              isFragile: getJsonField(
                                                                                postEnViewPostSearchEnRow.details,
                                                                                r'''$.is_fragile''',
                                                                              ),
                                                                              travelDate: functions.jsonToDateTimeUtc(getJsonField(
                                                                                postEnViewPostSearchEnRow.details!,
                                                                                r'''$.travel_date''',
                                                                              )),
                                                                              deadline: functions.jsonToDateTimeUtc(getJsonField(
                                                                                postEnViewPostSearchEnRow.details!,
                                                                                r'''$.deadline''',
                                                                              )),
                                                                              priceText: getJsonField(
                                                                                postEnViewPostSearchEnRow.detailsLabels,
                                                                                r'''$.price_text''',
                                                                              ).toString(),
                                                                              pricePeriod: getJsonField(
                                                                                postEnViewPostSearchEnRow.detailsLabels,
                                                                                r'''$.price_period''',
                                                                              ).toString(),
                                                                              deposit: getJsonField(
                                                                                postEnViewPostSearchEnRow.details,
                                                                                r'''$.deposit''',
                                                                              ),
                                                                              availableFrom: functions.jsonToDateTimeUtc(getJsonField(
                                                                                postEnViewPostSearchEnRow.details!,
                                                                                r'''$.available_from''',
                                                                              )),
                                                                              availableUntil: functions.jsonToDateTimeUtc(getJsonField(
                                                                                postEnViewPostSearchEnRow.details!,
                                                                                r'''$.available_until''',
                                                                              )),
                                                                              furnished: getJsonField(
                                                                                postEnViewPostSearchEnRow.details,
                                                                                r'''$.furnished''',
                                                                              ),
                                                                              utilitiesIncluded: getJsonField(
                                                                                postEnViewPostSearchEnRow.details,
                                                                                r'''$.utilities_included''',
                                                                              ),
                                                                              registrationPossible: getJsonField(
                                                                                postEnViewPostSearchEnRow.details,
                                                                                r'''$.registration_possible''',
                                                                              ),
                                                                              compensationType: getJsonField(
                                                                                postEnViewPostSearchEnRow.detailsLabels,
                                                                                r'''$.compensation_type''',
                                                                              ).toString(),
                                                                              durationMin: getJsonField(
                                                                                postEnViewPostSearchEnRow.details,
                                                                                r'''$.duration_min''',
                                                                              ),
                                                                              eventStartsAt: functions.jsonToDateTimeUtc(getJsonField(
                                                                                postEnViewPostSearchEnRow.details!,
                                                                                r'''$.event_starts_at''',
                                                                              )),
                                                                              eventEndsAt: functions.jsonToDateTimeUtc(getJsonField(
                                                                                postEnViewPostSearchEnRow.details!,
                                                                                r'''$.event_ends_at''',
                                                                              )),
                                                                              repeats: getJsonField(
                                                                                postEnViewPostSearchEnRow.detailsLabels,
                                                                                r'''$.repeats''',
                                                                              ),
                                                                              venueAddress: getJsonField(
                                                                                postEnViewPostSearchEnRow.details,
                                                                                r'''$.venue_address''',
                                                                              ).toString(),
                                                                              onlineUrl: getJsonField(
                                                                                postEnViewPostSearchEnRow.details,
                                                                                r'''$.online_url''',
                                                                              ).toString(),
                                                                              capacity: getJsonField(
                                                                                postEnViewPostSearchEnRow.details,
                                                                                r'''$.capacity''',
                                                                              ),
                                                                              totalArea: getJsonField(
                                                                                postEnViewPostSearchEnRow.details,
                                                                                r'''$.total_area''',
                                                                              ),
                                                                              allowCashAdjustment: getJsonField(
                                                                                postEnViewPostSearchEnRow.details,
                                                                                r'''$.allow_cash_adjustment''',
                                                                              ),
                                                                              repeatsText: getJsonField(
                                                                                postEnViewPostSearchEnRow.detailsLabels,
                                                                                r'''$.repeats''',
                                                                              ).toString(),
                                                                              nGoing: getJsonField(
                                                                                postEnViewPostSearchEnRow.details,
                                                                                r'''$.n_going''',
                                                                              ),
                                                                              serviceMode: getJsonField(
                                                                                postEnViewPostSearchEnRow.detailsLabels,
                                                                                r'''$.service_mode''',
                                                                              ).toString(),
                                                                              experienceYears: getJsonField(
                                                                                postEnViewPostSearchEnRow.detailsLabels,
                                                                                r'''$.experience_years''',
                                                                              ).toString(),
                                                                              languages: (getJsonField(
                                                                                postEnViewPostSearchEnRow.details,
                                                                                r'''$.languages''',
                                                                                true,
                                                                              ) as List?)
                                                                                  ?.map<String>((e) => e.toString())
                                                                                  .toList()
                                                                                  .cast<String>(),
                                                                              catId: postEnViewPostSearchEnRow.catId,
                                                                              mainCatId: postEnViewPostSearchEnRow.mainCatId,
                                                                            );
                                                                            safeSetState(() {});
                                                                          }),
                                                                          Future(
                                                                              () async {
                                                                            FFAppState().postDetailLabel =
                                                                                functions.decodeDetails(postEnViewPostSearchEnRow.detailsLabelText!);
                                                                            FFAppState().postDetailTable =
                                                                                postEnViewPostSearchEnRow.detailTable!;
                                                                            safeSetState(() {});
                                                                          }),
                                                                          Future(
                                                                              () async {
                                                                            FFAppState().EditPostData =
                                                                                EditPostDateStruct(
                                                                              city: postEnViewPostSearchEnRow.city,
                                                                              description: postEnViewPostSearchEnRow.description,
                                                                              title: postEnViewPostSearchEnRow.title,
                                                                              imags: postEnViewPostSearchEnRow.images,
                                                                              postID: widget.postID,
                                                                            );
                                                                            safeSetState(() {});
                                                                          }),
                                                                        ]);

                                                                        context
                                                                            .pushNamed(
                                                                          PostEditWidget
                                                                              .routeName,
                                                                          queryParameters:
                                                                              {
                                                                            'edit':
                                                                                serializeParam(
                                                                              true,
                                                                              ParamType.bool,
                                                                            ),
                                                                            'postId':
                                                                                serializeParam(
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
                                                                    postEnViewPostSearchEnRow
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
                                                                  height: 40.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Stack(
                                                                    children: [
                                                                      if (functions.listContainsString(
                                                                          FFAppState()
                                                                              .userInfo
                                                                              .reportedList
                                                                              .toList(),
                                                                          widget
                                                                              .postID!))
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              FaIcon(
                                                                            FontAwesomeIcons.solidFlag,
                                                                            color:
                                                                                Color(0xFFDC0D08),
                                                                            size:
                                                                                16.0,
                                                                          ),
                                                                        ),
                                                                      if (!functions.listContainsString(
                                                                          FFAppState()
                                                                              .userInfo
                                                                              .reportedList
                                                                              .toList(),
                                                                          widget
                                                                              .postID!))
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Builder(
                                                                            builder: (context) =>
                                                                                InkWell(
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
                                                                                                    postTitle: postEnViewPostSearchEnRow.title,
                                                                                                    isProfile: false,
                                                                                                    profileOwnerName: postEnViewPostSearchEnRow.userName,
                                                                                                    profileId: postEnViewPostSearchEnRow.ownerId,
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
                                                              height: 5.0)),
                                                        ).animateOnPageLoad(
                                                            animationsMap[
                                                                'columnOnPageLoadAnimation']!),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 1.0),
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
                                              begin: AlignmentDirectional(
                                                  0.0, -1.0),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      postEnViewPostSearchEnRow
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
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
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
                                            postEnViewPostSearchEnRow.ownerId,
                                        postId:
                                            postEnViewPostSearchEnRow.postId,
                                        detailTable: widget.detailDataName!,
                                        username: '',
                                        itemData: ItemCardGlobalStruct(
                                          description: postEnViewPostSearchEnRow
                                              .description,
                                          itemLocation:
                                              postEnViewPostSearchEnRow.city,
                                          createdAt: postEnViewPostSearchEnRow
                                              .createdAt,
                                          catName: postEnViewPostSearchEnRow
                                              .catLabel,
                                          subCatName: postEnViewPostSearchEnRow
                                              .subCatLabel,
                                          fillColor: functions.hexToColor(
                                              postEnViewPostSearchEnRow
                                                  .effectiveColorHex,
                                              Color(0x00000000)),
                                        ),
                                        details: functions.decodeDetails(
                                            postEnViewPostSearchEnRow
                                                .detailsText!),
                                        detailLabels: functions.decodeDetails(
                                            postEnViewPostSearchEnRow
                                                .detailsLabelText!),
                                      ),
                                    ),
                                  ),
                                  if (postEnViewPostSearchEnRow.postLikes !=
                                      null)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 16.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            Icons.favorite,
                                            color: Color(0xFFEC0B0B),
                                            size: 24.0,
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              postEnViewPostSearchEnRow
                                                  .postLikes
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
                                            'h7kcos98' /* PARTICIPANTS */,
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
                                            'y2u4u1pq' /* People who are going to this e... */,
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        FutureBuilder<
                                            List<ViewEventAttendeesRow>>(
                                          future: (_model.requestCompleter1 ??=
                                                  Completer<
                                                      List<
                                                          ViewEventAttendeesRow>>()
                                                    ..complete(
                                                        ViewEventAttendeesTable()
                                                            .queryRows(
                                                      queryFn: (q) => q
                                                          .eqOrNull(
                                                            'post_id',
                                                            widget.postID,
                                                          )
                                                          .order('joined_at'),
                                                      limit: 5,
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                                    clipBehavior:
                                                        Clip.antiAlias,
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
                                                }).divide(
                                                    SizedBox(width: 10.0)),
                                              ),
                                            );
                                          },
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '0chfn9gh' /* ... */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 16.0)),
                                    ),
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
                                                            'svl0vrf6' /* Participating this event?  */,
                                                          ),
                                                          hintText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            'fhfeek0q' /* Please confirm if you'd like t... */,
                                                          ),
                                                          cancelText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            'mhimjjt0' /* Cancel */,
                                                          ),
                                                          confirmText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            'zcd95z5z' /* Confirm */,
                                                          ),
                                                          onConfirmAction:
                                                              () async {
                                                            unawaited(
                                                              () async {
                                                                _model.joinEvent =
                                                                    await EventAttendeesTable()
                                                                        .insert({
                                                                  'post_id':
                                                                      widget
                                                                          .postID,
                                                                  'user_id':
                                                                      currentUserUid,
                                                                });
                                                              }(),
                                                            );
                                                            await Future
                                                                .delayed(
                                                              Duration(
                                                                milliseconds:
                                                                    2000,
                                                              ),
                                                            );
                                                            if (_model
                                                                    .joinEvent !=
                                                                null) {
                                                              FFAppState()
                                                                      .isGoingEvent =
                                                                  true;
                                                              safeSetState(
                                                                  () {});
                                                              safeSetState(() =>
                                                                  _model.requestCompleter1 =
                                                                      null);
                                                              await _model
                                                                  .waitForRequestCompleted1();
                                                            } else {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (dialogContext) {
                                                                  return Dialog(
                                                                    elevation:
                                                                        0,
                                                                    insetPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                    child:
                                                                        CustomSnackbarWidget(
                                                                      myText: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'vj4m3cra' /* The event is full. Try contact... */,
                                                                      ),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .error,
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            }
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

                                                  safeSetState(() {});
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
                                                              '7736op9e' /* Join Event */,
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
                                                                'gup7wrvf' /* Have you changed your mind? */,
                                                              ),
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'ogr98rn3' /* You are currently a participan... */,
                                                              ),
                                                              cancelText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                '2hb08i9g' /* Cencel */,
                                                              ),
                                                              confirmText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'xph0ye1c' /* Confirm */,
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
                                                                  '43kvoi9x' /* Leave Event */,
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
                                                      '6y032xo5' /* Hide your profile image */,
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
                                    child: wrapWithModel(
                                      model: _model.postOwnerCardModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: PostOwnerCardWidget(
                                        consentShowProfile:
                                            postEnViewPostSearchEnRow
                                                .showProfileImage!,
                                        userAvatar: postEnViewPostSearchEnRow
                                            .profileAvatar,
                                        ownerUsername: valueOrDefault<String>(
                                          postEnViewPostSearchEnRow.userName,
                                          ' user name',
                                        ),
                                        avarageReviewScore:
                                            valueOrDefault<double>(
                                          postEnViewPostSearchEnRow.review,
                                          1.0,
                                        ),
                                        totalReviwer: valueOrDefault<int>(
                                          postEnViewPostSearchEnRow.ratings,
                                          1,
                                        ),
                                        profileId:
                                            postEnViewPostSearchEnRow.ownerId!,
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
                                        'al4zq5em' /* REVIEWS */,
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
                                        postEnViewPostSearchEnRow.ownerId,
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
                                          child: wrapWithModel(
                                            model: _model.reviewCardSmallModels
                                                .getModel(
                                              rowViewUserReviewsRow.reviewId!,
                                              rowIndex,
                                            ),
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: ReviewCardSmallWidget(
                                              key: Key(
                                                'Keyb16_${rowViewUserReviewsRow.reviewId!}',
                                              ),
                                              reviewData: ReviewCardDataStruct(
                                                userName: rowViewUserReviewsRow
                                                    .usernameWriter,
                                                comunicationScore:
                                                    rowViewUserReviewsRow
                                                        .comunicationScore,
                                                qualitScore:
                                                    rowViewUserReviewsRow
                                                        .qualityScsore,
                                                reliabilityScore:
                                                    rowViewUserReviewsRow
                                                        .reliabilityScore,
                                                note:
                                                    rowViewUserReviewsRow.note,
                                                avarageScore:
                                                    rowViewUserReviewsRow
                                                        .avgReviewScore,
                                                fairnessScore:
                                                    rowViewUserReviewsRow
                                                        .fairnessScore,
                                                createAt: rowViewUserReviewsRow
                                                    .createdAt,
                                                reviewerId:
                                                    rowViewUserReviewsRow
                                                        .writerId,
                                                userAvatar:
                                                    rowViewUserReviewsRow
                                                        .profileAvatarWriter,
                                              ),
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
                          recipient: postEnViewPostSearchEnRow.ownerId!,
                          postTitle: postEnViewPostSearchEnRow.title!,
                          postId: postEnViewPostSearchEnRow.postId!,
                          allowMessage:
                              postEnViewPostSearchEnRow.allowMessage!,
                          allowCall: postEnViewPostSearchEnRow.allowCall!,
                          allowShare:
                              postEnViewPostSearchEnRow.allowSharePost!,
                          phoneNumber: postEnViewPostSearchEnRow.phonenumber,
                          subCat: postEnViewPostSearchEnRow.subCatName!,
                        ),
                      ),
                    ),
                    wrapWithModel(
                      model: _model.reportBugModel,
                      updateCallback: () => safeSetState(() {}),
                      child: ReportBugWidget(),
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
