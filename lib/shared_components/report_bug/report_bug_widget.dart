import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'report_bug_model.dart';
export 'report_bug_model.dart';

class ReportBugWidget extends StatefulWidget {
  const ReportBugWidget({super.key});

  @override
  State<ReportBugWidget> createState() => _ReportBugWidgetState();
}

class _ReportBugWidgetState extends State<ReportBugWidget> {
  late ReportBugModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReportBugModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(-1.0, 1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 65.0),
        child: FlutterFlowIconButton(
          borderColor: Color(0xFF570303),
          borderRadius: 50.0,
          borderWidth: 1.0,
          buttonSize: 50.0,
          fillColor: FlutterFlowTheme.of(context).primary,
          icon: Icon(
            Icons.bug_report_sharp,
            color: Color(0xFFEF1212),
            size: 24.0,
          ),
          onPressed: () async {
            context.pushNamed(ContactYEKJAWidget.routeName);
          },
        ),
      ),
    );
  }
}
