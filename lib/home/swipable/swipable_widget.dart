import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/shared_components/nav_bar/nav_bar_widget.dart';
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
              decoration: BoxDecoration(),
              child: Stack(
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AutoSizeText(
                              FFLocalizations.of(context).getText(
                                'c9tbt5vm' /* Discover Local 
Offers & Reque... */
                                ,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .fontStyle,
                                    ),
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .fontStyle,
                                  ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                '507gxblh' /* Swipe to explore — tap any to ... */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
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
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, -1.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                PostWidget.routeName,
                                                queryParameters: {
                                                  'postID': serializeParam(
                                                    swipeableStackViewSwipablePostsRow
                                                        .sourceId,
                                                    ParamType.String,
                                                  ),
                                                  'mainCatID': serializeParam(
                                                    0,
                                                    ParamType.int,
                                                  ),
                                                  'detailDataName':
                                                      serializeParam(
                                                    swipeableStackViewSwipablePostsRow
                                                        .detailTable,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Container(
                                              width: 300.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .darkgray,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Stack(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 1.0),
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Container(
                                                            width: 300.0,
                                                            height: 300.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        12.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        12.0),
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                swipeableStackViewSwipablePostsRow.images.firstOrNull ==
                                                                            null ||
                                                                        swipeableStackViewSwipablePostsRow.images.firstOrNull ==
                                                                            ''
                                                                    ? 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/uhwqu36njkuw/default_post_image.jpg'
                                                                    : swipeableStackViewSwipablePostsRow
                                                                        .images
                                                                        .firstOrNull!,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        8.0,
                                                                        0.0,
                                                                        235.0),
                                                            child: Container(
                                                              width: 55.0,
                                                              height: 55.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        -1.0),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              1.0),
                                                                  child:
                                                                      Container(
                                                                    width: 55.0,
                                                                    height:
                                                                        55.0,
                                                                    clipBehavior:
                                                                        Clip.antiAlias,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child: Image
                                                                        .network(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        swipeableStackViewSwipablePostsRow
                                                                            .profileAvatar,
                                                                        'https://bkygphvuuqmpmcfrncpm.supabase.co/storage/v1/object/public/yekja/Assets/anonymous.jpg',
                                                                      ),
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 100.0,
                                                    decoration: BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  8.0,
                                                                  12.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        8.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Stack(
                                                                  children: [
                                                                    if (FFLocalizations.of(context)
                                                                            .languageCode !=
                                                                        'fa')
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            1.0,
                                                                            1.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 1.0),
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                  borderRadius: BorderRadius.circular(6.0),
                                                                                ),
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: () {
                                                                                      if (swipeableStackViewSwipablePostsRow.catId == 1) {
                                                                                        return Color(0x42F25081);
                                                                                      } else if (swipeableStackViewSwipablePostsRow.catId == 2) {
                                                                                        return Color(0x4240C057);
                                                                                      } else if (swipeableStackViewSwipablePostsRow.catId == 3) {
                                                                                        return Color(0x421A8D9A);
                                                                                      } else {
                                                                                        return Color(0x42FAB005);
                                                                                      }
                                                                                    }(),
                                                                                    borderRadius: BorderRadius.circular(6.0),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                                                                    child: Text(
                                                                                      valueOrDefault<String>(
                                                                                        swipeableStackViewSwipablePostsRow.catName,
                                                                                        'Category',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Stack(
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                  children: [
                                                                                    Icon(
                                                                                      Icons.favorite,
                                                                                      color: Color(0xFFEC0B0B),
                                                                                      size: 20.0,
                                                                                    ),
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        swipeableStackViewSwipablePostsRow.postLikes?.toString(),
                                                                                        '0',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 6.0)),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ].divide(SizedBox(width: 8.0)),
                                                                        ),
                                                                      ),
                                                                    if (FFLocalizations.of(context)
                                                                            .languageCode ==
                                                                        'fa')
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            1.0,
                                                                            1.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Stack(
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                  children: [
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        swipeableStackViewSwipablePostsRow.postLikes?.toString(),
                                                                                        '0',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                    Icon(
                                                                                      Icons.favorite,
                                                                                      color: Color(0xFFEC0B0B),
                                                                                      size: 20.0,
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 6.0)),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 1.0),
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                  borderRadius: BorderRadius.circular(6.0),
                                                                                ),
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: () {
                                                                                      if (swipeableStackViewSwipablePostsRow.catId == 1) {
                                                                                        return Color(0x42F25081);
                                                                                      } else if (swipeableStackViewSwipablePostsRow.catId == 2) {
                                                                                        return Color(0x4240C057);
                                                                                      } else if (swipeableStackViewSwipablePostsRow.catId == 3) {
                                                                                        return Color(0x421A8D9A);
                                                                                      } else {
                                                                                        return Color(0x42FAB005);
                                                                                      }
                                                                                    }(),
                                                                                    borderRadius: BorderRadius.circular(6.0),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                                                                    child: Text(
                                                                                      valueOrDefault<String>(
                                                                                        swipeableStackViewSwipablePostsRow.catName,
                                                                                        'Category',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 8.0)),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Flexible(
                                                                child:
                                                                    AutoSizeText(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    swipeableStackViewSwipablePostsRow
                                                                        .title,
                                                                    'This is my title and I cannot help it',
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .poppins(
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
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
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .location_on_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .greenInit,
                                                                    size: 20.0,
                                                                  ),
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      swipeableStackViewSwipablePostsRow
                                                                          .userCity,
                                                                      'Not set',
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
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        8.0)),
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
                                      ],
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
                          .divide(SizedBox(height: 24.0))
                          .addToStart(SizedBox(height: 50.0)),
                    ),
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
