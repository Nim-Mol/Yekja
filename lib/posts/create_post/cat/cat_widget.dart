import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cat_model.dart';
export 'cat_model.dart';

class CatWidget extends StatefulWidget {
  const CatWidget({super.key});

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
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        height: 720.0,
        constraints: BoxConstraints(
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    child: SingleChildScrollView(
                      primary: false,
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
                                        fontFamily: FlutterFlowTheme.of(context)
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
                                final categories = FFAppState()
                                    .SubcatApp
                                    .where((e) =>
                                        e.mainCatId ==
                                        FFAppState().postState.mainCatId)
                                    .toList()
                                    .unique((e) => e.catId)
                                    .toList();

                                return GridView.builder(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    0,
                                    0,
                                    120.0,
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
                                            ..catName = categoriesItem.catName,
                                        );
                                        FFAppState().postDetailTable =
                                            categoriesItem.detailTable;
                                        _model.updatePage(() {});
                                        FFAppState().postDetailJSON = null;
                                        safeSetState(() {});
                                        // If post has wishlist (no intend) go to detail page and from there go to wishlist and then images, otherwise go to PostIntend
                                        if (functions.isInSetInt(
                                                FFAppState().postState.catId,
                                                FFAppConstants.catsOpenForSwap
                                                    .toList()) ==
                                            true) {
                                          context.pushNamed(
                                              PostSubCatWidget.routeName);
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
                                                duration:
                                                    Duration(milliseconds: 600),
                                              ),
                                            },
                                          );
                                        }
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: () {
                                            if (categoriesItem.mainCatId == 1) {
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
                                                    FFAppState().postState.catId
                                                ? Color(0x00050505)
                                                : FlutterFlowTheme.of(context)
                                                    .bordergray,
                                            width: categoriesItem.catId ==
                                                    FFAppState().postState.catId
                                                ? 1.0
                                                : 0.5,
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
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 3.0, 0.0, 3.0),
                                                  child: Container(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
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
                                                      shape: BoxShape.rectangle,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(2.0),
                                                      child: custom_widgets
                                                          .SvgRenderer(
                                                        width: 36.0,
                                                        height: 36.0,
                                                        svgCode: categoriesItem
                                                            .effectiveIconImage,
                                                        iconColor: () {
                                                          if (Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark) {
                                                            return functions.hexToColor(
                                                                categoriesItem
                                                                    .effectiveColorHex,
                                                                Color(
                                                                    0x00000000));
                                                          } else if (categoriesItem
                                                                  .mainCatId ==
                                                              1) {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .greenInit;
                                                          } else if (categoriesItem
                                                                  .mainCatId ==
                                                              2) {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .business;
                                                          } else if (categoriesItem
                                                                  .mainCatId ==
                                                              3) {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .yellow1;
                                                          } else if (categoriesItem
                                                                  .mainCatId ==
                                                              4) {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .red1;
                                                          } else {
                                                            return FlutterFlowTheme
                                                                    .of(context)
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 4.0, 4.0),
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
                                                    textAlign: TextAlign.center,
                                                    maxLines: 2,
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
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
                                                    overflow: TextOverflow.fade,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ].addToStart(SizedBox(height: 24.0)),
                      ),
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 24.0)),
            ),
          ),
        ),
      ),
    );
  }
}
