import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'botton_standard_model.dart';
export 'botton_standard_model.dart';

class BottonStandardWidget extends StatefulWidget {
  const BottonStandardWidget({
    super.key,
    this.buttontext,
    required this.onPressed,
  });

  final String? buttontext;
  final Future Function()? onPressed;

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
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
      child: FFButtonWidget(
        onPressed: () async {
          await widget.onPressed?.call();
        },
        text: valueOrDefault<String>(
          widget.buttontext,
          'Next',
        ),
        options: FFButtonOptions(
          width: double.infinity,
          height: 51.0,
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
          iconAlignment: IconAlignment.start,
          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
          color: FlutterFlowTheme.of(context).green1,
          textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                fontFamily: 'Satoshi',
                color: FlutterFlowTheme.of(context).primary,
                fontSize: 16.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w500,
              ),
          elevation: 5.0,
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).green1,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        showLoadingIndicator: false,
      ),
    );
  }
}
