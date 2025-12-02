import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/posts/create_post/cat/cat_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'post_cat_model.dart';
export 'post_cat_model.dart';

class PostCatWidget extends StatefulWidget {
  const PostCatWidget({
    super.key,
    this.navRoute,
  });

  final String? navRoute;

  static String routeName = 'PostCat';
  static String routePath = '/createItemType';

  @override
  State<PostCatWidget> createState() => _PostCatWidgetState();
}

class _PostCatWidgetState extends State<PostCatWidget> {
  late PostCatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostCatModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().marketPlaceMeta.mainCatID == 1) {
        _model.addToFilteredList(SubcatModelStruct());
        safeSetState(() {});
      } else {
        _model.addToFilteredList(SubcatModelStruct());
        safeSetState(() {});
      }
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            shape: BoxShape.circle,
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.safePop();
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 20.0,
                            ),
                          ),
                        ),
                        Container(
                          height: 40.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.dashboard_customize_rounded,
                                color: FlutterFlowTheme.of(context).greenInit,
                                size: 20.0,
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'vctzvcga' /* Category */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                              ),
                              RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'x4v7qe1s' /* 2 */,
                                      ),
                                      style: TextStyle(),
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'vofew9ox' /*  of  */,
                                      ),
                                      style: TextStyle(),
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'pncnlblo' /* 6 */,
                                      ),
                                      style: TextStyle(),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                              ),
                            ]
                                .divide(SizedBox(width: 16.0))
                                .addToStart(SizedBox(width: 24.0))
                                .addToEnd(SizedBox(width: 24.0)),
                          ),
                        ),
                        Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            shape: BoxShape.circle,
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (widget.navRoute == 'PostPreview') {
                                context.goNamed(PostEditWidget.routeName);
                              } else {
                                context.goNamed(HomePageWidget.routeName);
                              }
                            },
                            child: Icon(
                              Icons.close,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: wrapWithModel(
                      model: _model.catModel,
                      updateCallback: () => safeSetState(() {}),
                      child: CatWidget(),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Container(
                  width: double.infinity,
                  height: 90.0,
                  constraints: BoxConstraints(
                    maxWidth: 480.0,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 16.0, 24.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().postState.catName != '') {
                                FFAppState().postDetailJSON = null;
                                safeSetState(() {});
                                // If post has wishlist (no intend) go to detail page and from there go to wishlist and then images, otherwise go to PostIntend
                                if (functions.isInSetInt(
                                        FFAppState().postState.catId,
                                        FFAppConstants.catsOpenForSwap
                                            .toList()) ==
                                    true) {
                                  context.pushNamed(PostSubCatWidget.routeName);
                                } else {
                                  context.pushNamed(
                                    PostIntendWidget.routeName,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.rightToLeft,
                                        duration: Duration(milliseconds: 600),
                                      ),
                                    },
                                  );
                                }
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              height: 45.0,
                              decoration: BoxDecoration(
                                color: FFAppState().postState.catId > 0
                                    ? FlutterFlowTheme.of(context).greenInit
                                    : FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: FFAppState().postState.catId > 0
                                      ? FlutterFlowTheme.of(context).greenInit
                                      : FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'vewqt7ds' /* Next */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color:
                                              FFAppState()
                                                              .postState
                                                              .catName !=
                                                          ''
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : Color(0xFF6B6969),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
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
            ],
          ),
        ),
      ),
    );
  }
}
