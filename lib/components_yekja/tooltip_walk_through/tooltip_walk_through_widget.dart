import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'tooltip_walk_through_model.dart';
export 'tooltip_walk_through_model.dart';

class TooltipWalkThroughWidget extends StatefulWidget {
  const TooltipWalkThroughWidget({
    super.key,
    this.walkThroughTooltip,
    this.walkThroughTooltipIcon,
  });

  final String? walkThroughTooltip;
  final Widget? walkThroughTooltipIcon;

  @override
  State<TooltipWalkThroughWidget> createState() =>
      _TooltipWalkThroughWidgetState();
}

class _TooltipWalkThroughWidgetState extends State<TooltipWalkThroughWidget> {
  late TooltipWalkThroughModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TooltipWalkThroughModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).accent1,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
            child: widget.walkThroughTooltipIcon!,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
            child: Text(
              valueOrDefault<String>(
                widget.walkThroughTooltip,
                'some text',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    letterSpacing: 0.0,
                    useGoogleFonts:
                        !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
