import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'badge_card_model.dart';
export 'badge_card_model.dart';

class BadgeCardWidget extends StatefulWidget {
  const BadgeCardWidget({
    super.key,
    this.text,
    this.image,
  });

  final String? text;
  final String? image;

  @override
  State<BadgeCardWidget> createState() => _BadgeCardWidgetState();
}

class _BadgeCardWidgetState extends State<BadgeCardWidget> {
  late BadgeCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BadgeCardModel());

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
      height: 24.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 1.0,
            color: FlutterFlowTheme.of(context).lighterSecBackground,
            offset: Offset(
              0.0,
              2.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            valueOrDefault<String>(
              widget.text,
              'Verified Renter',
            ),
            style: FlutterFlowTheme.of(context).labelSmall.override(
                  fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                  fontSize: 14.0,
                  letterSpacing: 0.0,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).labelSmallIsCustom,
                ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              widget.image!,
              width: 20.0,
              height: 20.0,
              fit: BoxFit.fill,
            ),
          ),
        ].divide(SizedBox(width: 4.0)).around(SizedBox(width: 4.0)),
      ),
    );
  }
}
