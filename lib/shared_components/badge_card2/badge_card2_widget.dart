import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'badge_card2_model.dart';
export 'badge_card2_model.dart';

class BadgeCard2Widget extends StatefulWidget {
  const BadgeCard2Widget({
    super.key,
    String? text,
    String? image,
  })  : this.text = text ?? 'Verified Member',
        this.image = image ??
            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/vCkCd1ZRBsxBCRghPNUE/assets/1mh4i21q5296/shield.png';

  final String text;
  final String image;

  @override
  State<BadgeCard2Widget> createState() => _BadgeCard2WidgetState();
}

class _BadgeCard2WidgetState extends State<BadgeCard2Widget> {
  late BadgeCard2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BadgeCard2Model());

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
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Opacity(
            opacity: 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                widget.image,
                width: 20.0,
                height: 20.0,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(2.0),
            child: Text(
              widget.text,
              style: FlutterFlowTheme.of(context).labelSmall.override(
                    fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                    fontSize: 13.0,
                    letterSpacing: 0.0,
                    useGoogleFonts:
                        !FlutterFlowTheme.of(context).labelSmallIsCustom,
                  ),
            ),
          ),
        ].divide(SizedBox(width: 4.0)).around(SizedBox(width: 4.0)),
      ),
    );
  }
}
