import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'botton_standard_model.dart';
export 'botton_standard_model.dart';

class BottonStandardWidget extends StatefulWidget {
  const BottonStandardWidget({
    super.key,
    String? buttontext,
  }) : this.buttontext = buttontext ?? 'ButtonLabel';

  final String buttontext;

  @override
  State<BottonStandardWidget> createState() => _BottonStandardWidgetState();
}

class _BottonStandardWidgetState extends State<BottonStandardWidget> {
  late BottonStandardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottonStandardModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 50.0),
      child: FFButtonWidget(
        onPressed: () {
          print('Button pressed ...');
        },
        text: FFAppState().introIndex == 2 ? 'Get Started' : 'Next',
        options: FFButtonOptions(
          width: double.infinity,
          height: 56.0,
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
          iconAlignment: IconAlignment.start,
          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
          color: Color(0xFF587858),
          textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                fontFamily: 'Satoshi',
                color: FlutterFlowTheme.of(context).primary,
                fontSize: 16.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w600,
              ),
          elevation: 0.0,
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        showLoadingIndicator: false,
      ),
    );
  }
}
