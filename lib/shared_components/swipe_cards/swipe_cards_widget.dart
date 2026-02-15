import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'swipe_cards_model.dart';
export 'swipe_cards_model.dart';

class SwipeCardsWidget extends StatefulWidget {
  const SwipeCardsWidget({super.key});

  @override
  State<SwipeCardsWidget> createState() => _SwipeCardsWidgetState();
}

class _SwipeCardsWidgetState extends State<SwipeCardsWidget> {
  late SwipeCardsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwipeCardsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(
        Duration(
          milliseconds: 2000,
        ),
      );
      _model.hint = true;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (_model.hint == true)
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/Swipe_hand.gif',
                  width: 200.0,
                  height: 67.06,
                  fit: BoxFit.contain,
                ),
              ),
            ].divide(SizedBox(width: 20.0)),
          ),
        Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 35.0, 0.0, 0.0),
            child: FutureBuilder<List<ViewSwipablePostsRow>>(
              future: ViewSwipablePostsTable().queryRows(
                queryFn: (q) => q.order('created_at'),
              ),
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
                List<ViewSwipablePostsRow>
                    swipeableStackViewSwipablePostsRowList = snapshot.data!;

                return FlutterFlowSwipeableStack(
                  onSwipeFn: (swipeableStackIndex) async {
                    final swipeableStackViewSwipablePostsRow =
                        swipeableStackViewSwipablePostsRowList[
                            swipeableStackIndex];
                    _model.hint = false;
                    safeSetState(() {});
                    await Future.delayed(
                      Duration(
                        milliseconds: 5000,
                      ),
                    );
                    _model.hint = true;
                    safeSetState(() {});
                  },
                  onLeftSwipe: (swipeableStackIndex) {},
                  onRightSwipe: (swipeableStackIndex) {},
                  onUpSwipe: (swipeableStackIndex) {},
                  onDownSwipe: (swipeableStackIndex) {},
                  itemBuilder: (context, swipeableStackIndex) {
                    final swipeableStackViewSwipablePostsRow =
                        swipeableStackViewSwipablePostsRowList[
                            swipeableStackIndex];
                    return Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Container(
                        width: 320.0,
                        height: 465.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(24.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).darkgray,
                            width: 0.7,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Stack(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Container(
                                    width: 320.0,
                                    height: 297.42,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0x00050505),
                                          Color(0xC9060606)
                                        ],
                                        stops: [0.0, 1.0],
                                        begin: AlignmentDirectional(0.0, -1.0),
                                        end: AlignmentDirectional(0, 1.0),
                                      ),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(24.0),
                                        topRight: Radius.circular(24.0),
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(24.0),
                                        topRight: Radius.circular(24.0),
                                      ),
                                      child: Image.network(
                                        swipeableStackViewSwipablePostsRow
                                                        .images.firstOrNull ==
                                                    null ||
                                                swipeableStackViewSwipablePostsRow
                                                        .images.firstOrNull ==
                                                    ''
                                            ? FFAppConstants.DefaultPostImage
                                            : swipeableStackViewSwipablePostsRow
                                                .images.firstOrNull!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 10.0),
                                    child: Stack(
                                      children: [
                                        if (FFLocalizations.of(context)
                                                .languageCode !=
                                            'fa')
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 1.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .navBar,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.0),
                                                    border: Border.all(
                                                      color: colorFromCssString(
                                                        swipeableStackViewSwipablePostsRow
                                                            .effectiveColorHex!,
                                                      ),
                                                      width: 0.5,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 4.0,
                                                                10.0, 4.0),
                                                    child: AutoSizeText(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                        enText: valueOrDefault<
                                                            String>(
                                                          swipeableStackViewSwipablePostsRow
                                                              .catName,
                                                          'Category',
                                                        ),
                                                        faText: valueOrDefault<
                                                            String>(
                                                          swipeableStackViewSwipablePostsRow
                                                              .catNameFa,
                                                          'Category',
                                                        ),
                                                        nlText: valueOrDefault<
                                                            String>(
                                                          swipeableStackViewSwipablePostsRow
                                                              .catNameNl,
                                                          'Category',
                                                        ),
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            color:
                                                                colorFromCssString(
                                                              swipeableStackViewSwipablePostsRow
                                                                  .effectiveColorHex!,
                                                            ),
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.favorite,
                                                      color: Color(0xFFEC0B0B),
                                                      size: 20.0,
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        swipeableStackViewSwipablePostsRow
                                                            .postLikes
                                                            ?.toString(),
                                                        '0',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryWhite,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 4.0)),
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                          ),
                                        if (FFLocalizations.of(context)
                                                .languageCode ==
                                            'fa')
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 1.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        swipeableStackViewSwipablePostsRow
                                                            .postLikes
                                                            ?.toString(),
                                                        '0',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryWhite,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                    ),
                                                    Icon(
                                                      Icons.favorite,
                                                      color: Color(0xFFEC0B0B),
                                                      size: 20.0,
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 6.0)),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .navBar,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.0),
                                                    border: Border.all(
                                                      color: functions.hexToColor(
                                                          swipeableStackViewSwipablePostsRow
                                                              .effectiveColorHex,
                                                          Color(0x00000000)),
                                                      width: 0.5,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 4.0,
                                                                8.0, 4.0),
                                                    child: AutoSizeText(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                        enText: valueOrDefault<
                                                            String>(
                                                          swipeableStackViewSwipablePostsRow
                                                              .catName,
                                                          'Category',
                                                        ),
                                                        faText: valueOrDefault<
                                                            String>(
                                                          swipeableStackViewSwipablePostsRow
                                                              .catNameFa,
                                                          'Category',
                                                        ),
                                                        nlText: valueOrDefault<
                                                            String>(
                                                          swipeableStackViewSwipablePostsRow
                                                              .catNameNl,
                                                          'Category',
                                                        ),
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            color: functions.hexToColor(
                                                                swipeableStackViewSwipablePostsRow
                                                                    .effectiveColorHex,
                                                                Color(
                                                                    0x00000000)),
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 8.0, 12.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 1.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Container(
                                                    width: 40.0,
                                                    height: 40.0,
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
                                                Text(
                                                  valueOrDefault<String>(
                                                    swipeableStackViewSwipablePostsRow
                                                        .userName,
                                                    'username',
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                              ].divide(SizedBox(width: 5.0)),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  Icons.location_on_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .bordergray,
                                                  size: 20.0,
                                                ),
                                                AutoSizeText(
                                                  valueOrDefault<String>(
                                                    swipeableStackViewSwipablePostsRow
                                                        .city,
                                                    'Not set',
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
                                              ].divide(SizedBox(width: 5.0)),
                                            ),
                                          ].divide(SizedBox(width: 20.0)),
                                        ),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 4.0),
                                          child: AutoSizeText(
                                            valueOrDefault<String>(
                                              swipeableStackViewSwipablePostsRow
                                                  .title,
                                              'This is my title and I cannot help it',
                                            ).maybeHandleOverflow(
                                              maxChars: 75,
                                              replacement: '…',
                                            ),
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 10.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (FFLocalizations.of(context)
                                                      .languageCode ==
                                                  'fa') {
                                                context.pushNamed(
                                                  PostFaWidget.routeName,
                                                  queryParameters: {
                                                    'postID': serializeParam(
                                                      swipeableStackViewSwipablePostsRow
                                                          .sourceId,
                                                      ParamType.String,
                                                    ),
                                                    'detailDataName':
                                                        serializeParam(
                                                      swipeableStackViewSwipablePostsRow
                                                          .detailTable,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                if (FFLocalizations.of(context)
                                                        .languageCode ==
                                                    'nl') {
                                                  context.pushNamed(
                                                    PostNLWidget.routeName,
                                                    queryParameters: {
                                                      'postID': serializeParam(
                                                        swipeableStackViewSwipablePostsRow
                                                            .sourceId,
                                                        ParamType.String,
                                                      ),
                                                      'detailDataName':
                                                          serializeParam(
                                                        swipeableStackViewSwipablePostsRow
                                                            .detailTable,
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                } else {
                                                  context.pushNamed(
                                                    PostEnWidget.routeName,
                                                    queryParameters: {
                                                      'postID': serializeParam(
                                                        swipeableStackViewSwipablePostsRow
                                                            .sourceId,
                                                        ParamType.String,
                                                      ),
                                                      'detailDataName':
                                                          serializeParam(
                                                        swipeableStackViewSwipablePostsRow
                                                            .detailTable,
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                }
                                              }
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bordergray,
                                                      width: 0.5,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 4.0,
                                                                12.0, 4.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '252qwqix' /* More details! */,
                                                      ),
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
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 6.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 8.0)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: swipeableStackViewSwipablePostsRowList.length,
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
      ],
    );
  }
}
