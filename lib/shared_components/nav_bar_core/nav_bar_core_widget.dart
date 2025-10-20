import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/shared_components/confirm_cancel_pop_up/confirm_cancel_pop_up_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'nav_bar_core_model.dart';
export 'nav_bar_core_model.dart';

class NavBarCoreWidget extends StatefulWidget {
  const NavBarCoreWidget({super.key});

  @override
  State<NavBarCoreWidget> createState() => _NavBarCoreWidgetState();
}

class _NavBarCoreWidgetState extends State<NavBarCoreWidget> {
  late NavBarCoreModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarCoreModel());

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

    return FutureBuilder<List<MessagesRow>>(
      future: MessagesTable().querySingleRow(
        queryFn: (q) => q
            .eqOrNull(
              'recipient',
              currentUserUid,
            )
            .eqOrNull(
              'seen',
              false,
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
        List<MessagesRow> stackMessagesRowList = snapshot.data!;

        final stackMessagesRow =
            stackMessagesRowList.isNotEmpty ? stackMessagesRowList.first : null;

        return Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Container(
                height: 60.0,
                decoration: BoxDecoration(
                  color: Color(0xFF232426),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(HomePageWidget.routeName);
                          },
                          child: Icon(
                            Icons.home,
                            color: getCurrentRoute(context) == '/homePage'
                                ? FlutterFlowTheme.of(context).primaryText
                                : FlutterFlowTheme.of(context).darkgray,
                            size: 28.0,
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
                            SearchPageWidget.routeName,
                            queryParameters: {
                              'navigateBackTo': serializeParam(
                                'homePage',
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: Icon(
                          Icons.search,
                          color: functions.routeStartsWithPrefix(
                                  getCurrentRoute(context), '/searchPage')
                              ? FlutterFlowTheme.of(context).primaryText
                              : FlutterFlowTheme.of(context).darkgray,
                          size: 30.0,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Builder(
                          builder: (context) => FlutterFlowIconButton(
                            borderRadius: 50.0,
                            buttonSize: 45.0,
                            fillColor: FlutterFlowTheme.of(context).greenInit,
                            icon: Icon(
                              Icons.add,
                              color: FlutterFlowTheme.of(context).info,
                              size: 28.0,
                            ),
                            onPressed: () async {
                              if (FFAppState().userInfo.role != '') {
                                if (FFAppState().userInfo.city != '') {
                                  context
                                      .pushNamed(PostMainCatWidget.routeName);
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: ConfirmCancelPopUpWidget(
                                          header:
                                              'Complete profile before posting',
                                          hintText:
                                              'Take 2 minutes to add your info and start posting with maximum visibility.',
                                          cancelText: 'Cancel',
                                          confirmText: 'Go ',
                                          onConfirmAction: () async {
                                            context.pushNamed(
                                                ProfileEditWidget.routeName);
                                          },
                                          onCancelAction: () async {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      );
                                    },
                                  );
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Please login or signup if you wat to enable post creation.  ',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    duration: Duration(milliseconds: 5000),
                                    backgroundColor: Color(0xFFBA8D08),
                                  ),
                                );
                                return;
                              }
                            },
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Stack(
                          alignment: AlignmentDirectional(1.0, -1.0),
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (FFAppState().userInfo.role != '') {
                                    context.pushNamed(
                                      ChatPageWidget.routeName,
                                      queryParameters: {
                                        'profileid': serializeParam(
                                          currentUserUid,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Please sing in or sign up to use this function.',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        duration: Duration(milliseconds: 5000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .warning,
                                      ),
                                    );
                                  }
                                },
                                child: Icon(
                                  Icons.chat,
                                  color: functions.routeStartsWithPrefix(
                                          getCurrentRoute(context), '/chatPage')
                                      ? FlutterFlowTheme.of(context).primaryText
                                      : FlutterFlowTheme.of(context).darkgray,
                                  size: 28.0,
                                ),
                              ),
                            ),
                            if (stackMessagesRow?.recipient != null &&
                                stackMessagesRow?.recipient != '')
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 12.0, 0.0, 0.0),
                                  child: Container(
                                    width: 8.0,
                                    height: 8.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEF4C4F),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(SwipableWidget.routeName);
                          },
                          child: Icon(
                            Icons.view_carousel_outlined,
                            color: functions.routeStartsWithPrefix(
                                    getCurrentRoute(context), '/swipablePage')
                                ? FlutterFlowTheme.of(context).primaryText
                                : FlutterFlowTheme.of(context).darkgray,
                            size: 32.0,
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
    );
  }
}
