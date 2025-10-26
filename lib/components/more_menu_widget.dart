import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'more_menu_model.dart';
export 'more_menu_model.dart';

class MoreMenuWidget extends StatefulWidget {
  const MoreMenuWidget({super.key});

  @override
  State<MoreMenuWidget> createState() => _MoreMenuWidgetState();
}

class _MoreMenuWidgetState extends State<MoreMenuWidget> {
  late MoreMenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoreMenuModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ToggleIcon(
                onPressed: () async {
                  safeSetState(() => _model.isClose = !_model.isClose);
                },
                value: _model.isClose,
                onIcon: FaIcon(
                  FontAwesomeIcons.ellipsisV,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 14.0,
                ),
                offIcon: FaIcon(
                  FontAwesomeIcons.angleDown,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 14.0,
                ),
              ),
            ),
            if (_model.isClose == false)
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 40.0, 0.0, 0.0),
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.bookmark_added,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 12.0,
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'gqwl0yb6' /* Bookmark */,
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
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.flag,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 12.0,
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'mn4jxoun' /* Report */,
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
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
