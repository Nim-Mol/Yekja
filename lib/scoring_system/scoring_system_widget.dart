import '/components/yekja_score_pop_up_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'scoring_system_model.dart';
export 'scoring_system_model.dart';

class ScoringSystemWidget extends StatefulWidget {
  const ScoringSystemWidget({super.key});

  static String routeName = 'ScoringSystem';
  static String routePath = '/scoringSystem';

  @override
  State<ScoringSystemWidget> createState() => _ScoringSystemWidgetState();
}

class _ScoringSystemWidgetState extends State<ScoringSystemWidget> {
  late ScoringSystemModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScoringSystemModel());

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
          child: Container(
            constraints: BoxConstraints(
              maxHeight: 600.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).accent1,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  wrapWithModel(
                    model: _model.yekjaScorePopUpModel,
                    updateCallback: () => safeSetState(() {}),
                    child: YekjaScorePopUpWidget(),
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
