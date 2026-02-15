import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/shared_components/consent_reminder/consent_reminder_widget.dart';
import '/shared_components/custom_snackbar/custom_snackbar_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (currentUserUid != '') {
        _model.unseen = await ViewUnseenTotalsTable().queryRows(
          queryFn: (q) => q.eqOrNull(
            'user_id',
            currentUserUid,
          ),
        );
        _model.unseenMessages = valueOrDefault<int>(
          _model.unseen?.firstOrNull?.unseenMessages,
          0,
        );
        safeSetState(() {});
      } else {
        return;
      }
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
    context.watch<FFAppState>();

    return Stack(
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: Container(
            height: 60.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).navBar,
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
                            ? FlutterFlowTheme.of(context).primaryWhite
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
                          ? FlutterFlowTheme.of(context).primaryWhite
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
                          if (currentUserUid != '') {
                            if (FFAppState().userInfo.agreeConsent == true) {
                              context.pushNamed(PostMainCatWidget.routeName);
                            } else {
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: ConsentReminderWidget(),
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
                                backgroundColor:
                                    FlutterFlowTheme.of(context).warningSnack,
                              ),
                            );
                            return;
                          }
                        },
                      ),
                    ),
                  ),
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
                            title: Text(_model.unseen!.length.toString()),
                            content: Text(_model
                                .unseen!.firstOrNull!.unseenMessages!
                                .toString()),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Stack(
                      alignment: AlignmentDirectional(1.0, -1.0),
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Builder(
                            builder: (context) => InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (currentUserUid != '') {
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
                                        child: CustomSnackbarWidget(
                                          myText: FFLocalizations.of(context)
                                              .getText(
                                            'g0ptdkxg' /* Please sign in or sign up to u... */,
                                          ),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .warning,
                                          waitMS: 3000,
                                        ),
                                      );
                                    },
                                  );
                                }
                              },
                              child: Icon(
                                Icons.chat,
                                color: functions.routeStartsWithPrefix(
                                        getCurrentRoute(context), '/chatPage')
                                    ? FlutterFlowTheme.of(context).primaryWhite
                                    : FlutterFlowTheme.of(context).darkgray,
                                size: 28.0,
                              ),
                            ),
                          ),
                        ),
                        if ((_model.unseen != null &&
                                (_model.unseen)!.isNotEmpty) &&
                            (_model.unseenMessages! > 0))
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
                            ? FlutterFlowTheme.of(context).primaryWhite
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
  }
}
