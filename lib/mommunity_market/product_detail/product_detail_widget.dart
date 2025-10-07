import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/mommunity_market/value_popup/value_popup_widget.dart';
import '/profile/review_card_small/review_card_small_widget.dart';
import '/shared_components/comunication_bar/comunication_bar_widget.dart';
import '/shared_components/photo_gallary/photo_gallary_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_detail_model.dart';
export 'product_detail_model.dart';

class ProductDetailWidget extends StatefulWidget {
  const ProductDetailWidget({
    super.key,
    required this.postID,
    this.mainCatID,
  });

  final String? postID;
  final int? mainCatID;

  static String routeName = 'ProductDetail';
  static String routePath = '/ProductDetail';

  @override
  State<ProductDetailWidget> createState() => _ProductDetailWidgetState();
}

class _ProductDetailWidgetState extends State<ProductDetailWidget>
    with TickerProviderStateMixin {
  late ProductDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductDetailModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.liked = await MarketLikesTable().queryRows(
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
      if (functions.listContainsString(
          _model.liked!.map((e) => e.postId).withoutNulls.toList().toList(),
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
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    // On page dispose action.
    () async {}();

    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<ViewPostSearchRow>>(
      future: (_model.requestCompleter ??= Completer<List<ViewPostSearchRow>>()
            ..complete(ViewPostSearchTable().querySingleRow(
              queryFn: (q) => q
                  .eqOrNull(
                    'source_id',
                    widget.postID,
                  )
                  .eqOrNull(
                    'main_cat_id',
                    widget.mainCatID,
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
        List<ViewPostSearchRow> productDetailViewPostSearchRowList =
            snapshot.data!;

        final productDetailViewPostSearchRow =
            productDetailViewPostSearchRowList.isNotEmpty
                ? productDetailViewPostSearchRowList.first
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
                                          photoList:
                                              !(productDetailViewPostSearchRow!
                                                      .images.isNotEmpty)
                                                  ? [
                                                      'https://bkygphvuuqmpmcfrncpm.supabase.co/storage/v1/object/public/yekja/Assets/Icons/default_image.jpg'
                                                    ]
                                                  : productDetailViewPostSearchRow
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
                                                      .info,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  context.safePop();
                                                },
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if ((productDetailViewPostSearchRow
                                                              .userId !=
                                                          currentUserUid) &&
                                                      !FFAppState().IsGust)
                                                    Container(
                                                      width: 40.0,
                                                      height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: ToggleIcon(
                                                        onPressed: () async {
                                                          safeSetState(() =>
                                                              _model.isLiked =
                                                                  !_model
                                                                      .isLiked);
                                                          if (_model.isLiked ==
                                                              true) {
                                                            await MarketLikesTable()
                                                                .insert({
                                                              'user_id':
                                                                  currentUserUid,
                                                              'post_id': widget
                                                                  .postID,
                                                            });
                                                          } else {
                                                            await MarketLikesTable()
                                                                .delete(
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eqOrNull(
                                                                        'post_id',
                                                                        widget
                                                                            .postID,
                                                                      )
                                                                      .eqOrNull(
                                                                        'user_id',
                                                                        currentUserUid,
                                                                      ),
                                                            );
                                                          }

                                                          safeSetState(() =>
                                                              _model.requestCompleter =
                                                                  null);
                                                          await _model
                                                              .waitForRequestCompleted();
                                                        },
                                                        value: _model.isLiked,
                                                        onIcon: Icon(
                                                          Icons.favorite,
                                                          color:
                                                              Color(0xFFF10707),
                                                          size: 24.0,
                                                        ),
                                                        offIcon: Icon(
                                                          Icons.favorite_border,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    ),
                                                  Stack(
                                                    children: [
                                                      if ((productDetailViewPostSearchRow
                                                                  .userId ==
                                                              currentUserUid) &&
                                                          !FFAppState().IsGust)
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderRadius:
                                                                  50.0,
                                                              buttonSize: 40.0,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              icon: Icon(
                                                                Icons.edit,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 20.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                context
                                                                    .pushNamed(
                                                                  EditPostWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'postId':
                                                                        serializeParam(
                                                                      widget
                                                                          .postID,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      if ((currentUserUid !=
                                                              productDetailViewPostSearchRow
                                                                  .userId) &&
                                                          !FFAppState().IsGust)
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, 0.0),
                                                          child: Container(
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
                                                                safeSetState(
                                                                  () => FFAppState()
                                                                          .ReportedPosts
                                                                          .contains(
                                                                              ReportedPostsStruct(
                                                                            postId:
                                                                                widget.postID,
                                                                            reported:
                                                                                true,
                                                                          ))
                                                                      ? FFAppState()
                                                                          .removeFromReportedPosts(
                                                                              ReportedPostsStruct(
                                                                          postId:
                                                                              widget.postID,
                                                                          reported:
                                                                              true,
                                                                        ))
                                                                      : FFAppState()
                                                                          .addToReportedPosts(
                                                                              ReportedPostsStruct(
                                                                          postId:
                                                                              widget.postID,
                                                                          reported:
                                                                              true,
                                                                        )),
                                                                );
                                                              },
                                                              value: FFAppState()
                                                                  .ReportedPosts
                                                                  .contains(
                                                                      ReportedPostsStruct(
                                                                    postId: widget
                                                                        .postID,
                                                                    reported:
                                                                        true,
                                                                  )),
                                                              onIcon: Icon(
                                                                Icons.flag,
                                                                color: Color(
                                                                    0xFFAE1010),
                                                                size: 20.0,
                                                              ),
                                                              offIcon: FaIcon(
                                                                FontAwesomeIcons
                                                                    .flag,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 15.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                  if ((currentUserUid !=
                                                          productDetailViewPostSearchRow
                                                              .userId) &&
                                                      !FFAppState().IsGust)
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: ToggleIcon(
                                                          onPressed: () async {
                                                            safeSetState(() =>
                                                                _model.isFav =
                                                                    !_model
                                                                        .isFav);
                                                            if (functions
                                                                .listContainsString(
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
                                                                    (e) => e.remove(
                                                                        widget
                                                                            .postID),
                                                                  ),
                                                              );
                                                              safeSetState(
                                                                  () {});
                                                              await UserFavoritesTable()
                                                                  .delete(
                                                                matchingRows:
                                                                    (rows) => rows
                                                                        .eqOrNull(
                                                                          'user_id',
                                                                          currentUserUid,
                                                                        )
                                                                        .eqOrNull(
                                                                          'post_id',
                                                                          widget
                                                                              .postID,
                                                                        ),
                                                              );
                                                            } else {
                                                              FFAppState()
                                                                  .updateUserInfoStruct(
                                                                (e) => e
                                                                  ..updateUserFavs(
                                                                    (e) => e.add(
                                                                        widget
                                                                            .postID!),
                                                                  ),
                                                              );
                                                              safeSetState(
                                                                  () {});
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
                                                                _model.requestCompleter =
                                                                    null);
                                                          },
                                                          value: _model.isFav,
                                                          onIcon: Icon(
                                                            Icons
                                                                .bookmark_added,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .greenInit,
                                                            size: 20.0,
                                                          ),
                                                          offIcon: Icon(
                                                            Icons
                                                                .bookmark_border,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                ].divide(SizedBox(width: 10.0)),
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
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                ImageGalleryPageWidget
                                                    .routeName,
                                                queryParameters: {
                                                  'marketId': serializeParam(
                                                    widget.postID,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Flexible(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 1.0),
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
                                                                      .userInfo
                                                                      .userFavs
                                                                      .length
                                                                      .toString()),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: AutoSizeText(
                                                        valueOrDefault<String>(
                                                          productDetailViewPostSearchRow
                                                              .title,
                                                          'This is a title which is quite long and all',
                                                        ),
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      26.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30.0,
                                                  buttonSize: 40.0,
                                                  icon: Icon(
                                                    Icons.image_search,
                                                    color: Colors.white,
                                                    size: 20.0,
                                                  ),
                                                  onPressed: () async {
                                                    context.pushNamed(
                                                      ImageGalleryPageWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'marketId':
                                                            serializeParam(
                                                          widget.postID,
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                  border: Border.all(
                                                    color: Color(0x890F9970),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 4.0, 8.0, 4.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      productDetailViewPostSearchRow
                                                          .catName,
                                                      'category',
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily,
                                                          color:
                                                              Color(0xFF1DD6A1),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmallIsCustom,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF232426),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 4.0, 8.0, 4.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      productDetailViewPostSearchRow
                                                          .subCatName,
                                                      'sub cat name',
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmallIsCustom,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                      ),
                                      if (productDetailViewPostSearchRow
                                              .postLikes !=
                                          null)
                                        Row(
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
                                                productDetailViewPostSearchRow
                                                    .postLikes
                                                    ?.toString(),
                                                '0',
                                              ),
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
                                    ],
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          FlutterFlowIconButton(
                                            borderRadius: 8.0,
                                            buttonSize: 30.0,
                                            fillColor: Color(0x4200A1E7),
                                            icon: Icon(
                                              Icons.location_pin,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              size: 15.0,
                                            ),
                                            onPressed: () {
                                              print('IconButton pressed ...');
                                            },
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              productDetailViewPostSearchRow
                                                  .userCity,
                                              'Not set',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumIsCustom,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                    ),
                                  ),
                                  if (productDetailViewPostSearchRow.catName ==
                                      'Exchange')
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          FlutterFlowIconButton(
                                            borderRadius: 8.0,
                                            buttonSize: 30.0,
                                            fillColor: Color(0x42C850F2),
                                            icon: Icon(
                                              Icons.delivery_dining,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              size: 15.0,
                                            ),
                                            onPressed: () {
                                              print('IconButton pressed ...');
                                            },
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                productDetailViewPostSearchRow
                                                    .deliveryMethod,
                                                'No delivery',
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmallFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmallIsCustom,
                                                  ),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                    ),
                                  if (productDetailViewPostSearchRow.catName ==
                                      'Exchange')
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FlutterFlowIconButton(
                                                borderRadius: 8.0,
                                                buttonSize: 30.0,
                                                fillColor: Color(0x4240C057),
                                                icon: FaIcon(
                                                  FontAwesomeIcons.exchangeAlt,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  size: 15.0,
                                                ),
                                                onPressed: () {
                                                  print(
                                                      'IconButton pressed ...');
                                                },
                                              ),
                                              RichText(
                                                textScaler:
                                                    MediaQuery.of(context)
                                                        .textScaler,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '2rqgmz8p' /* Value hint  */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMediumIsCustom,
                                                              ),
                                                    ),
                                                    TextSpan(
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'vmm70xk5' /* (check here) */,
                                                      ),
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                      mouseCursor:
                                                          SystemMouseCursors
                                                              .click,
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () async {
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
                                                                        ValuePopupWidget(
                                                                      price: productDetailViewPostSearchRow
                                                                          .price,
                                                                      timeUnit:
                                                                          productDetailViewPostSearchRow
                                                                              .timeUnit,
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                    )
                                                  ],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMediumIsCustom,
                                                      ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 8.0)),
                                          ),
                                        ].divide(SizedBox(width: 4.0)),
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 18.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'ajx9fsxv' /* DESCRIPTION */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily,
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
                                        0.0, 4.0, 0.0, 24.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            valueOrDefault<String>(
                                              productDetailViewPostSearchRow
                                                  .description,
                                              'description',
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
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              shape: BoxShape.rectangle,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
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
                                                      ProfilePageWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'profileId':
                                                            serializeParam(
                                                          productDetailViewPostSearchRow
                                                              .userId,
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width: 70.0,
                                                        height: 70.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Stack(
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            1.0),
                                                                child:
                                                                    Container(
                                                                  width: 60.0,
                                                                  height: 60.0,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    (productDetailViewPostSearchRow.userAvatar != null && productDetailViewPostSearchRow.userAvatar != '') &&
                                                                            productDetailViewPostSearchRow
                                                                                .showProfileImage!
                                                                        ? productDetailViewPostSearchRow
                                                                            .userAvatar!
                                                                        : FFAppConstants
                                                                            .DefultProfilePhoto,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            if (productDetailViewPostSearchRow
                                                                    .yekjaVerified ??
                                                                true)
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        1.0),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .network(
                                                                    'https://bkygphvuuqmpmcfrncpm.supabase.co/storage/v1/object/public/yekja/Assets/Yekja_badge.png',
                                                                    width: 25.0,
                                                                    height:
                                                                        25.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
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
                                                                  productDetailViewPostSearchRow
                                                                      .userName,
                                                                  ' user name',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      fontSize:
                                                                          18.0,
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
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .network(
                                                                      'https://bkygphvuuqmpmcfrncpm.supabase.co/storage/v1/object/public/yekja/Assets/Icons/star_animated.gif',
                                                                      width:
                                                                          30.0,
                                                                      height:
                                                                          30.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'lbvm96he' /* 4.3 */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(4.0),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                          2.0,
                                                                      color: Color(
                                                                          0xB039D2C0),
                                                                      offset:
                                                                          Offset(
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
                                                          ].divide(SizedBox(
                                                              height: 4.0)),
                                                        ),
                                                      ),
                                                    ]
                                                        .divide(SizedBox(
                                                            width: 4.0))
                                                        .addToStart(SizedBox(
                                                            width: 4.0)),
                                                  ),
                                                ),
                                                if (productDetailViewPostSearchRow
                                                        .showSocialmedia ??
                                                    true)
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.all(
                                                            16.0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: Image.asset(
                                                              'assets/images/instagram.png',
                                                              width: 40.0,
                                                              height: 40.0,
                                                              fit: BoxFit.fill,
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
                                  if (productDetailViewPostSearchRow.catName ==
                                      'Exchange')
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'lo8jmg0v' /* MY EXCHANGE WISH */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmallIsCustom,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    productDetailViewPostSearchRow
                                                        .wishlistText,
                                                    'There is no description  for the exchange wishlist.',
                                                  ),
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
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMediumIsCustom,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Builder(
                                          builder: (context) {
                                            final wishlist =
                                                productDetailViewPostSearchRow
                                                        .exchangeSubcatNames
                                                        .toList() ??
                                                    [];

                                            return Wrap(
                                              spacing: 8.0,
                                              runSpacing: 8.0,
                                              alignment: WrapAlignment.start,
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.start,
                                              direction: Axis.horizontal,
                                              runAlignment: WrapAlignment.start,
                                              verticalDirection:
                                                  VerticalDirection.down,
                                              clipBehavior: Clip.none,
                                              children:
                                                  List.generate(wishlist.length,
                                                      (wishlistIndex) {
                                                final wishlistItem =
                                                    wishlist[wishlistIndex];
                                                return Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 4.0,
                                                                8.0, 4.0),
                                                    child: Text(
                                                      wishlistItem,
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
                                                                    .primaryText,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                      ].divide(SizedBox(height: 8.0)),
                                    ),
                                ]
                                    .divide(SizedBox(height: 8.0))
                                    .around(SizedBox(height: 8.0)),
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
                            FutureBuilder<List<ViewUserReviewsRow>>(
                              future: ViewUserReviewsTable().queryRows(
                                queryFn: (q) => q
                                    .eqOrNull(
                                      'reviewed_user_id',
                                      productDetailViewPostSearchRow.userId,
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
                                    rowViewUserReviewsRowList = snapshot.data!;

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
                                      return ReviewCardSmallWidget(
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
                                          avarageScore: rowViewUserReviewsRow
                                              .avgReviewScore,
                                          fairnessScore: rowViewUserReviewsRow
                                              .fairnessScore,
                                          createAt:
                                              rowViewUserReviewsRow.createdAt,
                                          reviewerId:
                                              rowViewUserReviewsRow.writerId,
                                          userAvatar: rowViewUserReviewsRow
                                              .profileAvatarWriter,
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
                          ].addToEnd(SizedBox(height: 100.0)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: wrapWithModel(
                        model: _model.comunicationBarModel,
                        updateCallback: () => safeSetState(() {}),
                        child: ComunicationBarWidget(
                          recipient: productDetailViewPostSearchRow.userId!,
                          postTitle: productDetailViewPostSearchRow.title!,
                          postId: productDetailViewPostSearchRow.sourceId!,
                          allowMessage:
                              productDetailViewPostSearchRow.allowMessage!,
                          allowCall: productDetailViewPostSearchRow.allowCall!,
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
