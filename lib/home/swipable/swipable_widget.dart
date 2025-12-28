import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/shared_components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'swipable_model.dart';
export 'swipable_model.dart';

class SwipableWidget extends StatefulWidget {
  const SwipableWidget({super.key});

  static String routeName = 'Swipable';
  static String routePath = '/swipablePage';

  @override
  State<SwipableWidget> createState() => _SwipableWidgetState();
}

class _SwipableWidgetState extends State<SwipableWidget> {
  late SwipableModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwipableModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AutoSizeText(
                            FFLocalizations.of(context).getText(
                              'c9tbt5vm' /* Discover Local Offers & Reques... */,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
                                  fontFamily: 'FarsiFonts',
                                  color: FlutterFlowTheme.of(context).info,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              '507gxblh' /* Swipe to explore  */,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .titleSmallIsCustom,
                                ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: FutureBuilder<List<ViewSwipablePostsRow>>(
                            future: ViewSwipablePostsTable().queryRows(
                              queryFn: (q) => q,
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
                              List<ViewSwipablePostsRow>
                                  swipeableStackViewSwipablePostsRowList =
                                  snapshot.data!;

                              return FlutterFlowSwipeableStack(
                                onSwipeFn: (index) {},
                                onLeftSwipe: (index) {},
                                onRightSwipe: (index) {},
                                onUpSwipe: (index) {},
                                onDownSwipe: (index) {},
                                itemBuilder: (context, swipeableStackIndex) {
                                  final swipeableStackViewSwipablePostsRow =
                                      swipeableStackViewSwipablePostsRowList[
                                          swipeableStackIndex];
                                  return Align(
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: Container(
                                      width: 320.0,
                                      height: 464.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .darkgray,
                                          width: 0.7,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Stack(
                                            alignment:
                                                AlignmentDirectional(0.0, 1.0),
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Container(
                                                  width: 320.0,
                                                  height: 320.0,
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Color(0x00050505),
                                                        Color(0xC9060606)
                                                      ],
                                                      stops: [0.0, 1.0],
                                                      begin:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      end: AlignmentDirectional(
                                                          0, 1.0),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(0.0),
                                                      topLeft:
                                                          Radius.circular(24.0),
                                                      topRight:
                                                          Radius.circular(24.0),
                                                    ),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(0.0),
                                                      topLeft:
                                                          Radius.circular(24.0),
                                                      topRight:
                                                          Radius.circular(24.0),
                                                    ),
                                                    child: Image.network(
                                                      swipeableStackViewSwipablePostsRow
                                                                      .images
                                                                      .firstOrNull ==
                                                                  null ||
                                                              swipeableStackViewSwipablePostsRow
                                                                      .images
                                                                      .firstOrNull ==
                                                                  ''
                                                          ? FFAppConstants
                                                              .DefaultPostImage
                                                          : swipeableStackViewSwipablePostsRow
                                                              .images
                                                              .firstOrNull!,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12.0, 0.0, 0.0,
                                                          254.0),
                                                  child: Container(
                                                    width: 55.0,
                                                    height: 55.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      functions.isNullSingleImage(
                                                                  swipeableStackViewSwipablePostsRow
                                                                      .profileAvatar) ||
                                                              (swipeableStackViewSwipablePostsRow
                                                                      .showProfileImage ==
                                                                  false)
                                                          ? FFAppConstants
                                                              .profileAvatarCircular
                                                          : swipeableStackViewSwipablePostsRow
                                                              .profileAvatar!,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12.0, 0.0, 12.0,
                                                          10.0),
                                                  child: Stack(
                                                    children: [
                                                      if (FFLocalizations.of(
                                                                  context)
                                                              .languageCode !=
                                                          'fa')
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, 1.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Flexible(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0x9D232426),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            6.0),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color:
                                                                          colorFromCssString(
                                                                        swipeableStackViewSwipablePostsRow
                                                                            .effectiveColorHex!,
                                                                        defaultColor:
                                                                            FlutterFlowTheme.of(context).accent2,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              6.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          4.0,
                                                                          10.0,
                                                                          4.0),
                                                                      child:
                                                                          AutoSizeText(
                                                                        FFLocalizations.of(context)
                                                                            .getVariableText(
                                                                          enText:
                                                                              valueOrDefault<String>(
                                                                            swipeableStackViewSwipablePostsRow.catName,
                                                                            'Category',
                                                                          ),
                                                                          faText:
                                                                              valueOrDefault<String>(
                                                                            swipeableStackViewSwipablePostsRow.catNameFa,
                                                                            'Category',
                                                                          ),
                                                                          nlText:
                                                                              valueOrDefault<String>(
                                                                            swipeableStackViewSwipablePostsRow.catNameNl,
                                                                            'Category',
                                                                          ),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryWhite,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .favorite,
                                                                    color: Color(
                                                                        0xFFEC0B0B),
                                                                    size: 20.0,
                                                                  ),
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      swipeableStackViewSwipablePostsRow
                                                                          .postLikes
                                                                          ?.toString(),
                                                                      '0',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryWhite,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        4.0)),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 8.0)),
                                                          ),
                                                        ),
                                                      if (FFLocalizations.of(
                                                                  context)
                                                              .languageCode ==
                                                          'fa')
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, 1.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      swipeableStackViewSwipablePostsRow
                                                                          .postLikes
                                                                          ?.toString(),
                                                                      '0',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryWhite,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                  Icon(
                                                                    Icons
                                                                        .favorite,
                                                                    color: Color(
                                                                        0xFFEC0B0B),
                                                                    size: 20.0,
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        6.0)),
                                                              ),
                                                              Flexible(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            6.0),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color:
                                                                          () {
                                                                        if (swipeableStackViewSwipablePostsRow.catId ==
                                                                            1) {
                                                                          return Color(
                                                                              0x42F25081);
                                                                        } else if (swipeableStackViewSwipablePostsRow.catId ==
                                                                            2) {
                                                                          return Color(
                                                                              0x4240C057);
                                                                        } else if (swipeableStackViewSwipablePostsRow.catId ==
                                                                            3) {
                                                                          return Color(
                                                                              0x421A8D9A);
                                                                        } else {
                                                                          return Color(
                                                                              0x42FAB005);
                                                                        }
                                                                      }(),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              6.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          4.0,
                                                                          8.0,
                                                                          4.0),
                                                                      child:
                                                                          AutoSizeText(
                                                                        FFLocalizations.of(context)
                                                                            .getVariableText(
                                                                          enText:
                                                                              valueOrDefault<String>(
                                                                            swipeableStackViewSwipablePostsRow.catName,
                                                                            'Category',
                                                                          ),
                                                                          faText:
                                                                              valueOrDefault<String>(
                                                                            swipeableStackViewSwipablePostsRow.catNameFa,
                                                                            'Category',
                                                                          ),
                                                                          nlText:
                                                                              valueOrDefault<String>(
                                                                            swipeableStackViewSwipablePostsRow.catNameNl,
                                                                            'Category',
                                                                          ),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryWhite,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 8.0)),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Flexible(
                                            child: Container(
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 8.0, 12.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  4.0),
                                                      child: AutoSizeText(
                                                        valueOrDefault<String>(
                                                          swipeableStackViewSwipablePostsRow
                                                              .title,
                                                          'This is my title and I cannot help it',
                                                        ).maybeHandleOverflow(
                                                          maxChars: 75,
                                                          replacement: '…',
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 2,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    10.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .location_on_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bordergray,
                                                              size: 20.0,
                                                            ),
                                                            AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                swipeableStackViewSwipablePostsRow
                                                                    .city,
                                                                'Not set',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 6.0)),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    16.0),
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
                                                            if (FFLocalizations.of(
                                                                        context)
                                                                    .languageCode ==
                                                                'fa') {
                                                              context.pushNamed(
                                                                PostFaWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'postID':
                                                                      serializeParam(
                                                                    swipeableStackViewSwipablePostsRow
                                                                        .sourceId,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'detailDataName':
                                                                      serializeParam(
                                                                    swipeableStackViewSwipablePostsRow
                                                                        .detailTable,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            } else {
                                                              if (FFLocalizations.of(
                                                                          context)
                                                                      .languageCode ==
                                                                  'nl') {
                                                                context
                                                                    .pushNamed(
                                                                  PostNLWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'postID':
                                                                        serializeParam(
                                                                      swipeableStackViewSwipablePostsRow
                                                                          .sourceId,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'detailDataName':
                                                                        serializeParam(
                                                                      swipeableStackViewSwipablePostsRow
                                                                          .detailTable,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              } else {
                                                                context
                                                                    .pushNamed(
                                                                  PostEnWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'postID':
                                                                        serializeParam(
                                                                      swipeableStackViewSwipablePostsRow
                                                                          .sourceId,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'detailDataName':
                                                                        serializeParam(
                                                                      swipeableStackViewSwipablePostsRow
                                                                          .detailTable,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              }
                                                            }
                                                          },
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bordergray,
                                                                    width: 0.5,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          4.0,
                                                                          12.0,
                                                                          4.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'b8feubfc' /* See details */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 6.0)),
                                                          ),
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
                                  );
                                },
                                itemCount:
                                    swipeableStackViewSwipablePostsRowList
                                        .length,
                                controller: _model.swipeableStackController,
                                loop: true,
                                cardDisplayCount: 3,
                                scale: 0.9,
                                backCardOffset: const Offset(0.0, 20.0),
                              );
                            },
                          ),
                        ),
                      ),
                    ]
                        .divide(SizedBox(height: 16.0))
                        .addToStart(SizedBox(height: 24.0)),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
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
  }
}
