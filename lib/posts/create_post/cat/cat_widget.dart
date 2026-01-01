import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'cat_model.dart';
export 'cat_model.dart';

class CatWidget extends StatefulWidget {
  const CatWidget({
    super.key,
    required this.mainCat,
  });

  final int? mainCat;

  @override
  State<CatWidget> createState() => _CatWidgetState();
}

class _CatWidgetState extends State<CatWidget> {
  late CatModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CatModel());

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
      alignment: AlignmentDirectional(0.0, -1.0),
      child: FutureBuilder<List<ViewTopSubcategoriesRow>>(
        future: FFAppState().topSubCat(
          requestFn: () => ViewTopSubcategoriesTable().queryRows(
            queryFn: (q) => q,
          ),
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
          List<ViewTopSubcategoriesRow>
              mainContainerViewTopSubcategoriesRowList = snapshot.data!;

          return Container(
            width: double.infinity,
            constraints: BoxConstraints(
              minHeight: 680.0,
              maxWidth: 480.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0),
              ),
            ),
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: SingleChildScrollView(
                primary: false,
                controller: _model.columnController,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: SingleChildScrollView(
                          primary: false,
                          controller: _model.col2ScrollController,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 24.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '2sh31bj5' /* Select the category
best fitti... */
                                        ,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .headlineLargeFamily,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .headlineLargeIsCustom,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final categories =
                                        mainContainerViewTopSubcategoriesRowList
                                            .where((e) =>
                                                e.mainCatId == widget.mainCat)
                                            .toList()
                                            .unique((e) => e.catId!)
                                            .toList();

                                    return GridView.builder(
                                      padding: EdgeInsets.fromLTRB(
                                        0,
                                        0,
                                        0,
                                        24.0,
                                      ),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 10.0,
                                        mainAxisSpacing: 10.0,
                                        childAspectRatio: 1.0,
                                      ),
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: categories.length,
                                      itemBuilder: (context, categoriesIndex) {
                                        final categoriesItem =
                                            categories[categoriesIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            FFAppState().updatePostStateStruct(
                                              (e) => e
                                                ..catId = categoriesItem.catId
                                                ..catName =
                                                    categoriesItem.catName,
                                            );
                                            FFAppState().postDetailTable =
                                                categoriesItem.detailTable!;
                                            _model.updatePage(() {});
                                            FFAppState().postDetailJSON = null;
                                            safeSetState(() {});
                                            _model.selectedCat =
                                                categoriesItem.catId;
                                            safeSetState(() {});
                                            await _model.col2ScrollController
                                                ?.animateTo(
                                              _model.col2ScrollController!
                                                  .position.maxScrollExtent,
                                              duration:
                                                  Duration(milliseconds: 100),
                                              curve: Curves.ease,
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: () {
                                                if (categoriesItem.mainCatId ==
                                                    1) {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .careBackground;
                                                } else if (categoriesItem
                                                        .mainCatId ==
                                                    2) {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .marketBackground;
                                                } else if (categoriesItem
                                                        .mainCatId ==
                                                    3) {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .serviceBackground;
                                                } else if (categoriesItem
                                                        .mainCatId ==
                                                    5) {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .careerBackground;
                                                } else {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .eventBackground;
                                                }
                                              }(),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              border: Border.all(
                                                color: categoriesItem.catId ==
                                                        FFAppState()
                                                            .postState
                                                            .catId
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .bordergray,
                                                width: 0.5,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(3.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  3.0,
                                                                  0.0,
                                                                  3.0),
                                                      child: Container(
                                                        width: 40.0,
                                                        height: 40.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    8.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    8.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    8.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    8.0),
                                                          ),
                                                          shape: BoxShape
                                                              .rectangle,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  2.0),
                                                          child: custom_widgets
                                                              .SvgRenderer(
                                                            width: 36.0,
                                                            height: 36.0,
                                                            svgCode: categoriesItem
                                                                .effectiveIconImage,
                                                            iconColor: () {
                                                              if (Theme.of(
                                                                          context)
                                                                      .brightness ==
                                                                  Brightness
                                                                      .dark) {
                                                                return functions.hexToColor(
                                                                    categoriesItem
                                                                        .effectiveColorHex,
                                                                    Color(
                                                                        0x00000000));
                                                              } else if (categoriesItem
                                                                      .mainCatId ==
                                                                  1) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .greenInit;
                                                              } else if (categoriesItem
                                                                      .mainCatId ==
                                                                  2) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .business;
                                                              } else if (categoriesItem
                                                                      .mainCatId ==
                                                                  3) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .yellow1;
                                                              } else if (categoriesItem
                                                                      .mainCatId ==
                                                                  4) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .red1;
                                                              } else {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .purple1;
                                                              }
                                                            }(),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  0.0,
                                                                  4.0,
                                                                  4.0),
                                                      child: AutoSizeText(
                                                        valueOrDefault<String>(
                                                          FFLocalizations.of(
                                                                          context)
                                                                      .languageCode ==
                                                                  'fa'
                                                              ? categoriesItem
                                                                  .catNameFa
                                                              : categoriesItem
                                                                  .catName,
                                                          'category',
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 2,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  color: categoriesItem
                                                                              .catId ==
                                                                          FFAppState()
                                                                              .postState
                                                                              .catId
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .textgray,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmallIsCustom,
                                                                ),
                                                        overflow:
                                                            TextOverflow.fade,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      controller: _model.gridViewController,
                                    );
                                  },
                                ),
                              ),
                              if (_model.selectedCat != null)
                                Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: FutureBuilder<List<SubCategoriesRow>>(
                                    future: FFAppState().subCats(
                                      uniqueQueryKey: valueOrDefault<String>(
                                        _model.selectedCat?.toString(),
                                        '0',
                                      ),
                                      requestFn: () =>
                                          SubCategoriesTable().queryRows(
                                        queryFn: (q) => q.eqOrNull(
                                          'cat_id',
                                          _model.selectedCat,
                                        ),
                                      ),
                                    ),
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
                                      List<SubCategoriesRow>
                                          wrapSubCategoriesRowList =
                                          snapshot.data!;

                                      return Wrap(
                                        spacing: 10.0,
                                        runSpacing: 10.0,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: List.generate(
                                            wrapSubCategoriesRowList.length,
                                            (wrapIndex) {
                                          final wrapSubCategoriesRow =
                                              wrapSubCategoriesRowList[
                                                  wrapIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              FFAppState()
                                                  .updatePostStateStruct(
                                                (e) => e
                                                  ..subCatId =
                                                      wrapSubCategoriesRow
                                                          .subCatId
                                                  ..subCatName =
                                                      wrapSubCategoriesRow
                                                          .subCatName,
                                              );
                                              _model.updatePage(() {});
                                              // If post has wishlist (no intend) go to detail page and from there go to wishlist and then images, otherwise go to PostIntend
                                              if (functions.isInSetInt(
                                                      FFAppState()
                                                          .postState
                                                          .catId,
                                                      FFAppConstants
                                                          .catsOpenForSwap
                                                          .toList()) ==
                                                  true) {
                                                await actions
                                                    .navigateToDetailForm1(
                                                  context,
                                                  FFAppState().postDetailTable,
                                                  FFAppState().navRoutePost,
                                                );
                                              } else {
                                                context.pushNamed(
                                                  PostIntendWidget.routeName,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .rightToLeft,
                                                      duration: Duration(
                                                          milliseconds: 600),
                                                    ),
                                                  },
                                                );
                                              }
                                            },
                                            child: Container(
                                              height: 36.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FFAppState()
                                                              .postState
                                                              .subCatId ==
                                                          wrapSubCategoriesRow
                                                              .subCatId
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : Color(0xAA696969),
                                                  width: 0.5,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        FFLocalizations.of(
                                                                        context)
                                                                    .languageCode ==
                                                                'fa'
                                                            ? wrapSubCategoriesRow
                                                                .subCatNameFa
                                                            : wrapSubCategoriesRow
                                                                .subCatName,
                                                        'category',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            color: FFAppState()
                                                                        .postState
                                                                        .subCatId ==
                                                                    wrapSubCategoriesRow
                                                                        .subCatId
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .textgray,
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
                                                ]
                                                    .divide(
                                                        SizedBox(width: 8.0))
                                                    .addToStart(
                                                        SizedBox(width: 8.0))
                                                    .addToEnd(
                                                        SizedBox(width: 8.0)),
                                              ),
                                            ),
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                ),
                            ]
                                .addToStart(SizedBox(height: 24.0))
                                .addToEnd(SizedBox(height: 36.0)),
                          ),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 24.0)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
